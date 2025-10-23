import SwiftUI

// MARK: - Ana Görünüm
struct NewsDetailView: View {
    let newsItem: NewsDetailItem

    let pageTitle = "Haberler"

    var body: some View {

        ZStack {
            Color.lightBackground.edgesIgnoringSafeArea(.all)

            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    NewsDetailPageImageView()

                    VStack(alignment: .leading, spacing: 20) {

                        NewsDetailPageNewsTitleView()
                        NewDetailPageNewsSourceView()

                        Divider()
                            .padding(.vertical, 5)

                        NewsDetailPageNewsExplanationView()
                        NewsDetailPageNewsSubItemView()

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
            NewsDetailToolbarItems()
        }

    }

}

// MARK: - Yardımcı Bileşenler

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

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewsDetailView(newsItem: NewsDetailItemViewModel().mockNews[4])
        }
    }
}

struct NewsDetailPageImageView: View {
    let newsDetailImage: String = "leclerc-news"
    var body: some View {
        Image(newsDetailImage)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 280)
            .clipped()
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 5)
    }
}

struct NewsDetailPageNewsTitleView: View {
    let newsTitle: String =
        "Leclerc'in Monaco Antrenmanında Yaşadığı Kaza Sonrası Grid Cezası Tartışması"
    var body: some View {

        Text(newsTitle)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(.bodyText)
            .lineLimit(nil)
    }
}

struct NewDetailPageNewsSourceView: View {
    let newsSourceText: String = "FORMULA 1"
    let newsDateText: String = "23 Mayıs 2025 • F1 Resmi Kaynak"
    var body: some View {
        HStack {

            Text(newsSourceText)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.f1Red)
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .background(Color.f1Red.opacity(0.1))
                .cornerRadius(6)

            Text(newsDateText)
                .font(.caption)
                .foregroundColor(.metaText)
        }
    }
}

struct NewsDetailPageNewsExplanationView: View {
    var body: some View {
        Text(getMockArticleText())
            .font(.body)
            .foregroundColor(.bodyText)
            .lineSpacing(6)
    }
    private func getMockArticleText() -> String {
        return
            "Monaco Grand Prix'si antrenman turları, Ferrari pilotu Charles Leclerc'in yaşadığı talihsiz bir kazayla gölgelendi. Yarış hakemleri, kaza sonrasında aracın onarımı nedeniyle Leclerc'e grid cezası verdiğini duyurdu. Bu karar, F1 camiasında büyük tartışma yarattı.\n\nÖzellikle Piastri ile antrenman sırasında yaşadığı yakın temas ve ardından gelen kaza zinciri, Leclerc için hafta sonunun başlangıcını zorlaştırdı. Takım patronları, kararın sert olduğunu ancak itiraz etmeyeceklerini belirtti. Ferrari, pazar günü yarışta maksimum puanı almak için stratejik bir mücadele vereceğini açıkladı.\n\nBu durum, şampiyonluk mücadelesi açısından da kritik öneme sahip. Ferrari'nin bu kaybı telafi etme çabası, Red Bull ve Mercedes gibi rakiplerin stratejilerini yeniden gözden geçirmesine yol açtı."
    }
}

struct NewsDetailPageNewsSubItemView: View {
    let subItemText: String = "İLGİLİ PİLOTLAR"

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(subItemText)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.metaText)

            RelatedDriverPill(driverName: "Charles Leclerc", teamColor: .f1Red)
            RelatedDriverPill(
                driverName: "Oscar Piastri",
                teamColor: Color.orange
            )
        }
        .padding(.top, 30)
    }
}

private struct NewsDetailToolbarItems: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
            } label: {
                Image(systemName: "square.and.arrow.up").foregroundColor(.f1Red)
            }
        }

        ToolbarItem(placement: .navigationBarLeading) {
            Button {
            } label: {
                Image(systemName: "chevron.left").foregroundColor(.f1Red)
            }
        }
    }
}
