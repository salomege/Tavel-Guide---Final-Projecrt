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
            inputSection
            pickerSection
            convertButtonSection
            resultSection
        }
        .padding()
        .onAppear {
            viewModel.fetchData {
            }
        }
        .padding(.top, 200)

        Spacer()
        Image("currency-back")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: UIScreen.main.bounds.width, height: 200)
    }

    private var inputSection: some View {
        TextField("Enter amount in GEL", text: $amount)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.decimalPad)
    }

    private var pickerSection: some View {
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
    }

    private var convertButtonSection: some View {
        Button("Convert") {
            convertAmount()
        }
        .foregroundColor(.white)
        .fontWeight(.bold)
        .frame(width: 200, height: 50)
        .background(Color.accentColor)
        .cornerRadius(10)
    }

    private var resultSection: some View {
        Group {
            if let convertedAmount = viewModel.convertedAmount {
                Text("\(convertedAmount, specifier: "%.2f") \(selectedCurrency)")
                    .padding(.top, 30)
                    .font(.title)
            }
        }
   
    }
    

    private func convertAmount() {
        guard let amount = Double(amount) else {
            return
        }

        viewModel.convertAmount(amount: amount, to: selectedCurrency) {
            
        }
    }
       
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView()
    }
}
