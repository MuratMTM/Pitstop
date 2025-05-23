import SwiftUI

struct NewsPageView: View {
    @StateObject private var viewModel = NewsItemViewModel()

    var body: some View {
        VStack(spacing: 0) {
            // Üst Başlık Barı
            ZStack {
                Color.red
                    .ignoresSafeArea(edges: .all)

                HStack(spacing: 12) {
                    Text("Pitstop")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.white)

                    Image("raceFlag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 36, height: 20)
                }
            }.frame(height: 60)
                
            

            // Scrollable Haber Görseli
            if !viewModel.newsItems.isEmpty {
                TabView(selection: $viewModel.selectedIndex) {
                    ForEach(viewModel.newsItems.indices, id: \.self) { index in
                        Image(viewModel.newsItems[index].imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 270)
                            .clipped()
                            .cornerRadius(20)
                            .padding(.horizontal, 20)
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .frame(height: 270)

                // Bilgi Kutusu
                let currentItem = viewModel.newsItems[viewModel.selectedIndex]

                VStack(alignment: .center, spacing: 6) {
                    Text(currentItem.title)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        .lineLimit(3)
                        .multilineTextAlignment(.center)
                        .padding()

                    HStack(alignment: .center, spacing: 8) {
                        Image(currentItem.authorImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())

                        Text(currentItem.authorName)
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(.gray)

                        Spacer()

                        Text(currentItem.date)
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(.gray)
                    }

                }
                .padding()
                .frame(width: 350)
                .background(Color.cyan.opacity(0.1))
                .cornerRadius(30)
                .shadow(radius: 5)

                NewsDivider()
                    .padding(.vertical, 10)
            }

            Spacer()
        }
    }
}



#Preview {
    NewsPageView()
}
