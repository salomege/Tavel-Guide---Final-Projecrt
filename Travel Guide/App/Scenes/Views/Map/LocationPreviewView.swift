//
//  LocationPreviewView.swift
//  Travel Guide
//
//  Created by salome on 22.01.24.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(spacing: 16.0) {
                imageSection
                titleSection
            }
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(.ultraThinMaterial)
            .offset(y: 65)
        )
        .cornerRadius(10)
    }
}


extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if !location.imageName.isEmpty {
                Image(location.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width:100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.green)
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity)
    }
    private var learnMoreButton: some View {
        Button {
            vm.sheetLoction = location
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(width:124, height: 34)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width:124, height: 34)
        }
        .buttonStyle(.borderedProminent)
        
    }
}
