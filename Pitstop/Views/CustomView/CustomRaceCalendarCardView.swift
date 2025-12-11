

//import SwiftUI
//
//// MARK: - 2. Tekil Yarış Kartı Görünümü (RaceCardView)
//struct CustomRaceCalendarCardView: View {
//    // MANTIK: Kart, RaceCalendar modelini bekliyor.
//    let event: CircuitModel
//    
//    var body: some View {
//        VStack(spacing: 0) {
//            
//            // ÜST KISIM: PİST GÖRSELİ VE İSİM VURGUSU
//            ZStack(alignment: .bottomLeading) {
//                
//                // Pist Görseli
//                Image(systemNameOrAsset: event.trackImageName)
//                    .resizable()
//                
//                    .frame(height: 200)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.f1Red.opacity(0.1))
//                    
//                
//         
//                
//            }
//            
//            // ALT KISIM: YARIŞ BİLGİLERİ (3'lü Simetrik Düzen)
//            VStack(alignment: .leading, spacing: 6){
//                
//                Rectangle() // Kırmızı Vurgu Çizgisi
//                    .fill(Color.f1Red)
//                    .frame(width: 50, height: 4)
//                    .cornerRadius(2)
//                
//                Text(event.grandPrix)
//                    .font(.title2)
//                    .fontWeight(.heavy)
//                    .foregroundColor(.darkText)
//                    .lineLimit(1)
//                    
//                HStack(alignment: .top, spacing: 10) {
//                
//                // 1. TARİH BİLGİSİ
//                // MANTIK: date alanını kullanıyor
//                InfoPill(iconName: "calendar", label: "YARIŞ TARİHİ", value: event.date, accentColor: .f1Red)
//                
//                // 2. LOKASYON BİLGİSİ
//                // MANTIK: location alanını (ülke) kullanıyor
//                InfoPill(iconName: "mappin.and.ellipse", label: "KONUM", value: event.location, accentColor: .f1Red)
//                
//                // 3. SON KAZANAN BİLGİSİ
//                // MANTIK: whoWon alanını kullanıyor
//                InfoPill(iconName: "crown.fill", label: "SON KAZANAN", value: event.whoWon, accentColor: .f1Red)
//            }
//            .padding(.horizontal, 15)
//            .padding(.vertical, 15)
//        }
//        }
//        .background(Color.gray.opacity(0.3))
//        .cornerRadius(15)
//        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
//    }
//}
//
//// Bilgi Kapsülü (Simetrik 3'lü Düzen İçin Yardımcı Görünüm)
//struct InfoPill: View {
//    let iconName: String
//    let label: String
//    let value: String
//    let accentColor: Color
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 5) {
//            HStack(spacing: 5) {
//                Image(systemName: iconName)
//                    .foregroundColor(accentColor)
//                    .font(.subheadline)
//                
//                Text(label)
//                    .font(.caption2)
//                    .fontWeight(.medium)
//                    .foregroundColor(.metaText)
//            }
//            
//            Text(value)
//                .font(.subheadline)
//                .fontWeight(.bold)
//                .foregroundColor(.darkText)
//                .multilineTextAlignment(.center)
//                .lineLimit(2)
//        }
//        .frame(maxWidth: .infinity, alignment: .leading)
//    }
//}
//
//
//#Preview {
//    CustomRaceCalendarCardView(event: RaceCalendarViewModel().mockCalendar[0])
//}
