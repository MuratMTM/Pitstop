//
//  CustomDriverCardView.swift
//  Pitstop
//
//  Created by Murat Işık on 15.05.2025.
//

import SwiftUI

struct CustomDriverCardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black.opacity(0.1))
                .shadow(radius: 10)
                .frame(width: 300, height: 150)
                
          
            
            
            VStack(spacing:18){
                HStack( spacing: 20) {
                    Text("3")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                    
                    VStack{
                        Text("Max Verstappen")
                            .font(.headline)
                        
                        Text("Red Bull Racing")
                            .font(.caption)
                            .foregroundColor(.gray)
                            
                    }
                   Image("verstappen")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .background(Color.orange)
                        .shadow(radius: 5)
                        .clipShape(Circle())
                    
              
                }
                
                HStack(spacing: 45){
                    Text("PTS: 99")
                        .font(.caption)
                        .foregroundStyle(.white)
                        .bold()
                        .padding(8)
                        .background(
                            Capsule()
                                .fill(Color.blue)
                        )
                        
                        
                        
                    
                    Text("WDC: 4")
                        .font(.caption)
                        .foregroundStyle(.white)
                        .bold()
                        .padding(8)
                        .background(
                            Capsule()
                                .fill(Color.blue)
                        )
                    
                    Image("netherlands")
                         .resizable()
                         .frame(width: 40, height: 40)
                         .background(Color.orange)
                         .shadow(radius: 5)
                         .clipShape(Circle())
                    
                }
              
            }
        }
    }
}

#Preview {
    CustomDriverCardView()
}
