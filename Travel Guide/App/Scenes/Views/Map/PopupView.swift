//
//  PopupView.swift
//  Travel Guide
//
//  Created by salome on 12.02.24.
//

import SwiftUI
import MapKit
struct PopupView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    
    var location : Location
    var body: some View {
        ZStack {
            Color.clear.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 16){
                titleSection
                Divider()
                descriptionSection
                Divider()
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 24)
            .multilineTextAlignment(.center)
            .background(background)
            .transition(.move(edge: .bottom))
        }
    }
    
}
struct LocationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
      PopupView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
        .background(.blue)
        .previewLayout(.sizeThatFits)
    }
}

extension PopupView{
  
  
  
  private var titleSection: some View{

  VStack(alignment: .leading, spacing: 8){
    Text(location.name)
      .font(.largeTitle)
      .fontWeight(.semibold)
    Text(location.cityName)
      .font(.title3)
      .foregroundColor(.secondary)
      .background(RoundedCorners(color: .white,
                                 tl:10,
                                 tr: 10,
                                 bl:0,
                                 br: 0
                                ))
  }
}
  
  private var descriptionSection: some View{
    VStack(alignment: .leading, spacing: 16){
      Text(location.description)
            .font(.subheadline)
                       .foregroundColor(.secondary)
                       .lineLimit(nil)
                       .fixedSize(horizontal: false, vertical: true) 
      
    }
  }
  
    struct RoundedCorners: View {
        var color: Color = .blue
        var tl: CGFloat = 0.0
        var tr: CGFloat = 0.0
        var bl: CGFloat = 0.0
        var br: CGFloat = 0.0
        
        var body: some View {
            GeometryReader { geometry in
                Path { path in
                    
                    let w = geometry.size.width
                    let h = geometry.size.height
                    
                    // Make sure we do not exceed the size of the rectangle
                    let tr = min(min(self.tr, h/2), w/2)
                    let tl = min(min(self.tl, h/2), w/2)
                    let bl = min(min(self.bl, h/2), w/2)
                    let br = min(min(self.br, h/2), w/2)
                    
                    path.move(to: CGPoint(x: w / 2.0, y: 0))
                    path.addLine(to: CGPoint(x: w - tr, y: 0))
                    path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                    path.addLine(to: CGPoint(x: w, y: h - br))
                    path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                    path.addLine(to: CGPoint(x: bl, y: h))
                    path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                    path.addLine(to: CGPoint(x: 0, y: tl))
                    path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                    path.closeSubpath()
                }
                .fill(self.color)
            }
        }
    }
  
    var background: some View {
          RoundedCorners(color: .white, tl: 10, tr: 10, bl: 0, br: 0)
              .shadow(color: .black.opacity(0.2), radius: 3)
      }
}
