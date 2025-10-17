//
//  DriverCareerRecordView.swift
//  Pitstop
//
//  Created by Murat Işık on 19.07.2025.
//

import SwiftUI

struct CustomDriverCareerRecordView_2: View {
    var body: some View {
        VStack{
            HStack{
                CustomDriverCareerRecordView(dataCount: "4", dataText: "Şampiyonluk")
                CustomDriverCareerRecordView(dataCount: "60+", dataText: "Yarış Galibiyeti")
                CustomDriverCareerRecordView(dataCount: "30+", dataText: "Pol Pozisyonu")
            }.padding(.vertical,50)
            
            HStack{
                CustomDriverCareerRecordView(dataCount: "120+", dataText: "Podyum Bitirişi")
                CustomDriverCareerRecordView(dataCount: "200+", dataText: "Katıldığı Yarış")
                CustomDriverCareerRecordView(dataCount: "15+", dataText: "En Hızlı Tur")
            }
            
        }.padding(20)
    }
}

#Preview {
    CustomDriverCareerRecordView_2()
}
