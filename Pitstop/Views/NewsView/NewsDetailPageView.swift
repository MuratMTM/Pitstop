import SwiftUI

// MARK: - Renk Tanımları

extension Color {
    
    static let f1Red = Color(red: 0.89, green: 0.04, blue: 0.07)
    
    static let bodyText = Color(red: 0.2, green: 0.2, blue: 0.2)
    
    static let metaText = Color(red: 0.5, green: 0.5, blue: 0.5)
    
    static let lightBackground = Color(UIColor.systemGray6)
}

// MARK: - Ana Görünüm
struct NewsDetailView: View {
    let newsItem: NewsDetailItem
    
    let pageTitle = "Haberler"
    
    var body: some View {
        
        ZStack {
            Color.lightBackground.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    
                    
                    Image("leclerc-news")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 280)
                        .clipped()
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 5)
                    
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        
                        Text("Leclerc'in Monaco Antrenmanında Yaşadığı Kaza Sonrası Grid Cezası Tartışması")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.bodyText)
                            .lineLimit(nil)
                        
                        HStack {
                            
                            Text("FORMULA 1")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.f1Red)
                                .padding(.vertical, 4)
                                .padding(.horizontal, 8)
                                .background(Color.f1Red.opacity(0.1))
                                .cornerRadius(6)
                            
                            Text("23 Mayıs 2025 • F1 Resmi Kaynak")
                                .font(.caption)
                                .foregroundColor(.metaText)
                        }
                        
                        
                        Divider()
                            .padding(.vertical, 5)
                        
                        
                        Text(getMockArticleText())
                            .font(.body)
                            .foregroundColor(.bodyText)
                            .lineSpacing(6)
                        
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text("İLGİLİ PİLOTLAR")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.metaText)
                            
                            
                            RelatedDriverPill(driverName: "Charles Leclerc", teamColor: .f1Red)
                            RelatedDriverPill(driverName: "Oscar Piastri", teamColor: Color.orange)
                        }
                        .padding(.top, 30)
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 50)
                }
            }
        }
        .navigationTitle(pageTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.f1Red)
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.f1Red)
                }
            }
        }
        
    }
    private func getMockArticleText() -> String {
        return "Monaco Grand Prix'si antrenman turları, Ferrari pilotu Charles Leclerc'in yaşadığı talihsiz bir kazayla gölgelendi. Yarış hakemleri, kaza sonrasında aracın onarımı nedeniyle Leclerc'e grid cezası verdiğini duyurdu. Bu karar, F1 camiasında büyük tartışma yarattı.\n\nÖzellikle Piastri ile antrenman sırasında yaşadığı yakın temas ve ardından gelen kaza zinciri, Leclerc için hafta sonunun başlangıcını zorlaştırdı. Takım patronları, kararın sert olduğunu ancak itiraz etmeyeceklerini belirtti. Ferrari, pazar günü yarışta maksimum puanı almak için stratejik bir mücadele vereceğini açıkladı.\n\nBu durum, şampiyonluk mücadelesi açısından da kritik öneme sahip. Ferrari'nin bu kaybı telafi etme çabası, Red Bull ve Mercedes gibi rakiplerin stratejilerini yeniden gözden geçirmesine yol açtı."
    }
}

// MARK: - Yardımcı Bileşenler

/// İlgili pilotları takım renkleriyle gösteren etiket
struct RelatedDriverPill: View {
    let driverName: String
    let teamColor: Color
    
    var body: some View {
        HStack(spacing: 8) {
            Text(driverName)
                .font(.callout)
                .fontWeight(.medium)
                .foregroundColor(Color.bodyText)
            
            Image(systemName: "flag.fill")
                .foregroundColor(teamColor)
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 8)
        .background(teamColor.opacity(0.1))
        .cornerRadius(20)
        .shadow(color: teamColor.opacity(0.1), radius: 3)
    }
}


extension Image {
    init(systemNameOrAsset name: String) {
        if let _ = UIImage(named: name) {
            self.init(name)
        } else {
            self.init(systemName: "photo.fill")
        }
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewsDetailView(newsItem: NewsDetailItemViewModel().mockNews[0])
        }
    }
}


