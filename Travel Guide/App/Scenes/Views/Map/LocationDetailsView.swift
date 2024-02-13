//
//  LocationDetailsView.swift
//  Travel Guide
//
//  Created by salome on 12.02.24.
//

import SwiftUI
import MapKit
struct LocationDetailsView: View {
  
  @EnvironmentObject private var vm : LocationsViewModel

  var location : Location
    var body: some View {
      
          VStack(alignment: .leading, spacing: 16){
            titleSection
            Divider()
            descriptionSection
            Divider()
          }
          .frame(maxWidth: .infinity,alignment: .leading)
          .padding()
        }
      
    }


struct LocationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
      LocationDetailsView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
    }
}

extension LocationDetailsView{
  
  
  
  private var titleSection: some View{

  VStack(alignment: .leading, spacing: 8){
    Text(location.name)
      .font(.largeTitle)
      .fontWeight(.semibold)
    Text(location.cityName)
      .font(.title3)
      .foregroundColor(.secondary)
  }
}
  
  private var descriptionSection: some View{
    VStack(alignment: .leading, spacing: 16){
      Text(location.description)
        .font(.subheadline)
        .foregroundColor(.secondary)
      
    }
  }
  

  
//  private var backButton : some View{
//    Button {
//      vm.sheetLoction = nil
//    } label: {
//      Image(systemName: "xmark")
//        .font(.headline)
//        .padding(16)
//        .foregroundColor(.primary)
//        .background(.thickMaterial)
//        .cornerRadius(10)
//        .shadow(radius: 4)
//        .padding()
//    }
//
//  }
}
