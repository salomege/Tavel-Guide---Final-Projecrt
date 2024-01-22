//
//  ImpressionsViewModel.swift
//  Travel Guide
//
//  Created by salome on 22.01.24.
//

import Foundation

class ImpressionsViewModel: ObservableObject {
    @Published var items: [Impressions] = [] {
        didSet {
            saveItems()
        }
    }

    let itemsKey: String = "items_list"

    init() {
        getItems()
    }

    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([Impressions].self, from: data)
        else {
            return
        }

        items = savedItems
    }

    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }

    func addItem(title: String, impression: String, date: Date, place: Place) {
        let newItem = Impressions(place: place, title: title, impression: impression, date: date)
        items.append(newItem)
        print(newItem)
    }

    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
           
        }
    }
}
