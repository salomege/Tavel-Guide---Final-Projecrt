//
//  CurrencyView.swift
//  Travel Guide
//
//  Created by salome on 02.02.24.
//

import SwiftUI

struct CurrencyView: View {
    @StateObject var viewModel = CurrencyViewModel()
    @State private var amount: String = ""
    @State private var selectedCurrency: String = "USD"

    var body: some View {
        VStack {
            TextField("Enter amount in GEL", text: $amount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)

            Picker("Select Currency", selection: $selectedCurrency) {
                Text("USD").tag("USD")
                Text("EUR").tag("EUR")
                Text("GBP").tag("GBP")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .onChange(of: selectedCurrency) { _ in
                convertAmount()
            }

            Button("Convert") {
                convertAmount()
                   
            }
            .foregroundColor(.black) // Optional: Set text color
            .frame(width: 200, height: 50) // Set width and height of the button
            .background(Color.accentColor) // Set background color of the button
            .cornerRadius(10)

            if let convertedAmount = viewModel.convertedAmount {
                Text("Converted Amount: \(convertedAmount, specifier: "%.2f") \(selectedCurrency)")
            }
        }
        .padding()
        .onAppear {
            viewModel.fetchData {
            }
        }
    }

    private func convertAmount() {
        guard let amount = Double(amount) else {
            return
        }

        viewModel.convertAmount(amount: amount, to: selectedCurrency) {
            // Handle completion, update UI, etc.
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView()
    }
}
