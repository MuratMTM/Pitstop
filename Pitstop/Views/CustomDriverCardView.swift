//
//  CustomDriverCardView.swift
//  Pitstop
//
//  Created by Murat Işık on 15.05.2025.
//

import SwiftUI

struct CustomDriverCardView: View {
    var driverNumber: String
    var driverName: String
    var constructor: String
    var image: String
    var points: String
    var wdc: String
    var driverOrigin: String
    
   
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black.opacity(0.1))
                .shadow(color: .green.opacity(4),radius: 10)
                .frame(width: 300, height: 150)
                .overlay(
                      RoundedRectangle(cornerRadius: 20)
                          .stroke(Color.black, lineWidth: 3)
                  )
                
          
            
            
            HStack(spacing:18){
                VStack( spacing: 20) {
                    Text(driverNumber)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                    
                    Text("PTS: \(points)")
                        .font(.caption)
                        .foregroundStyle(.white)
                        .bold()
                        .padding(8)
                        .background(
                            Capsule()
                                .fill(Color.black)
                        )}
                    
                VStack{
                        Text(driverName)
                            .font(.headline)
                        
                        Text(constructor)
                            .font(.caption)
                            .bold()
                            .foregroundColor(.secondary)
                            .padding(.bottom,30)
                        
                        Text("WDC: \(wdc)")
                            .font(.caption)
                            .foregroundStyle(.white)
                            .bold()
                            .padding(8)
                            .background(
                                Capsule()
                                    .fill(Color.black)
                                    
                            )
                            .padding(.vertical,8)
                            
                    }
                   VStack( spacing: 16){
                       Image(image)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .background(Color.black.opacity(0.5))
                            .shadow(radius: 5)
                            .clipShape(Circle())
                        
                        Image(driverOrigin)
                             .resizable()
                             .frame(width: 35, height: 35)
                             .background(Color.orange)
                             .shadow(radius: 5)
                             .clipShape(Circle())
                   }
                    
              
                }
                
            
              
            }
        }
    }


#Preview {
    CustomDriverCardView(driverNumber: "81", driverName: "Oscar Piastri", constructor: "McLaren", image: "piastri", points: "131", wdc: "0", driverOrigin: "australia")
}
