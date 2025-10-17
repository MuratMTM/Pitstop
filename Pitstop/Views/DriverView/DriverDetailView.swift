
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
                
            }.background( LinearGradient(colors: [.orange, .black], startPoint: .leading, endPoint: .trailing))
                .padding(.bottom,0)
                
            
            DriverDetailMainView()
            
        }
        
       
       
    }
}



struct DriverDetailMainView: View {
    @State private var selectedTab = "Genel"
    let tabs = ["Genel", "Sonuçlar", "Rekorlar", "Haberler"]
    @Namespace private var animationNamespace

    var body: some View {
        VStack(spacing: 10) {
            
            // 🔷 Özel Sportif Segment Kontrol
            HStack(spacing: 12) {
                ForEach(tabs, id: \.self) { tab in
                    Button {
                        withAnimation(.spring()) {
                            selectedTab = tab
                        }
                    } label: {
                        Text(tab)
                            .font(.system(size: 13, weight: selectedTab == tab ? .bold : .semibold, design: .rounded))
                            .foregroundColor(selectedTab == tab ? .white : .black)
                            .padding(.vertical, 16)
                            .padding(.horizontal, 20)
                            .background(
                                ZStack {
                                    if selectedTab == tab {
                                        LinearGradient(colors: [.red, .orange], startPoint: .leading, endPoint: .trailing)
                                            .clipShape(Capsule())
                                            .matchedGeometryEffect(id: "segment", in: animationNamespace)
                                            .shadow(color: .purple.opacity(0.9), radius: 8, x: 0, y: 4)
                                    }
                                }
                            )
                            .clipShape(Capsule())
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    
                }
            }
            
            .background(Color.secondary.opacity(0.2))
            .clipShape(Capsule())
            
            
            
            // ⬇️ Sekmeye göre içerik
            VStack {
                switch selectedTab {
                case "Genel":
                    GeneralDriverInfoTab()
                case "Sonuçlar":
                    GrandPrixListView(grandPrixes: DriverMockData.verstappenDetail.grandPrixes)
                case "Rekorlar":
                    CustomDriverCareerRecordView_2()
                case "Haberler":
                    DriverNewsTabView()
                default:
                    Text("Bilinmeyen Sekme")
                }
                
                
            }
            .frame(maxWidth: .infinity)
            
            .cornerRadius(15)
            .shadow(radius: 20)
            .padding(.horizontal)
            .padding(10)
            
            Spacer()
           
        }
        .navigationTitle("Sürücü Detayları")
    }
}

#Preview {
    DriverDetailView()
}


