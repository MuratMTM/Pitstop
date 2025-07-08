
import SwiftUI

struct DriverDetailView: View {
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                
                Image("rb21")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: 150)
                    .offset(x: 0, y: -60)
                    
                
                VStack{
                    Image("maxDetailPng")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 200, height: 300)
                        .offset(x: 0, y: 80)
                        .clipShape(RoundedCorner(radius: 30, corners: [.bottomLeft, .bottomRight]))
                }
                
            }.background(Color.gray)
                .padding(.bottom,5)
                
            
            DriverDetailMainView()
            
        }
        
       
       
    }
}



struct DriverDetailMainView: View {
    @State private var selectedTab = "Genel"
    let tabs = ["Genel", "Sonuçlar", "Rekorlar", "Haberler"]

    var body: some View {
        VStack(spacing: 10) {
            

            // 🔵 Segment kontrolü (sekme seçici)
            Picker("Tab", selection: $selectedTab) {
                ForEach(tabs, id: \.self) { tab in
                    Text(tab).tag(tab)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            // ⬇️ Sekmeye göre içerik
            VStack {
                switch selectedTab {
                case "Genel":
                    GeneralDriverInfoTab()
                case "Sonuçlar":
                    SeasonView()
                case "Rekorlar":
                    DriverCareerRecordsTabView()
                case "Haberler":
                    DriverNewsTabView()
                default:
                    Text("Bilinmeyen Sekme")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            .background(Color(.systemGray6))
            .cornerRadius(15)
            .shadow(radius: 4)
            .padding(.horizontal)
            
            Spacer()
         
        }
        .navigationTitle("Sürücü Detayları")
    }
}

#Preview {
    DriverDetailView()
}
