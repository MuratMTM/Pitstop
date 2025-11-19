//
//  GeneralDriverInfoTab.swift
//  Pitstop
//
//  Created by Murat Işık on 8.07.2025.
//

//import SwiftUI
//
//struct GeneralDriverInfoTab: View {
//    var body: some View {
//        
//        VStack{
//            Text("Max Verstappen")
//                .font(.system(size: 30, weight: .heavy, design: .rounded)) //
//                .italic()
//                .foregroundStyle(
//                    LinearGradient(
//                        colors: [.orange, .red, .orange],
//                        startPoint: .leading,
//                        endPoint: .trailing
//                    )
//                )
//                .padding(.horizontal, 24)
//                .padding(.vertical, 12)
//                
//            
//            HStack{
//                DriverInformationBox(boxText: "Doğum Tarihi\n\(DriverMockData.verstappenDetail.birthDate)")
//                DriverInformationBox(boxText: "Doğum Yeri\n\(DriverMockData.verstappenDetail.birthPlace)")
//            }
//            HStack{
//                DriverInformationBox(boxText: "Takım\n\(DriverMockData.verstappenDetail.baseDriver.constructor)")
//                DriverInformationBox(boxText: "Numara \n\(DriverMockData.verstappenDetail.baseDriver.number)")
//                
//            }
//            HStack{
//                DriverInformationBox(boxText: "Şampiyonluk Sıralaması\n\(DriverMockData.verstappenDetail.baseDriver.championship)")
//                DriverInformationBox(boxText: "Puan\n\(DriverMockData.verstappenDetail.baseDriver.points)")
//            }
//        }
//    }
//}
//
//#Preview {
//    GeneralDriverInfoTab()
//}
