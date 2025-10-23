import SwiftUI

struct NewsPageView: View {

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                PitstopHeaderView()
                NewsFeedView()
            }
            NewsDivider()
                .padding(.vertical, 10)
            OtherNewsListView()
        }.edgesIgnoringSafeArea(.top)

    }
}

#Preview {
    NewsPageView()
}






struct PitstopHeaderView: View {
    private let pitStopHeader: String = "Pitstop"
    private let pitStopFlagHeader: String = "raceFlag"
    var body: some View {
        ZStack {
            Color(red: 0.9, green: 0.2, blue: 0.2)
                .ignoresSafeArea(edges: .all)

            HStack(spacing: 12) {
                Text(pitStopHeader)
                    .font(.system(size: 28, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)

                Image(pitStopFlagHeader)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 36, height: 20)
            }.padding(
                .top,
                UIApplication.shared.connectedScenes.compactMap {
                    ($0 as? UIWindowScene)?.windows.first?.safeAreaInsets.top
                }.first ?? 44
            )
            .padding(.horizontal)
        }.frame(
            height: 60
                + (UIApplication.shared.connectedScenes.compactMap {
                    ($0 as? UIWindowScene)?.windows.first?.safeAreaInsets.top
                }.first ?? 44)
        )
    }
}

struct NewsFeedView: View {

    @StateObject var viewModel = NewsItemViewModel()

    var body: some View {
        VStack {

            ScrollableNewsImagesView(viewModel: viewModel)

            NewsTitleBoxView(viewModel: viewModel)
        }
    }
}

struct ScrollableNewsImagesView: View {
    @ObservedObject var viewModel: NewsItemViewModel
    var body: some View {
        VStack {
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

            }

        }
    }
}

struct NewsTitleBoxView: View {
    @ObservedObject var viewModel: NewsItemViewModel
    var body: some View {

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
    }
}

struct OtherNewsListView: View {
    @StateObject private var secondViewModel = OtherNewsItemViewModel()
    var body: some View {
        VStack {
            ForEach(secondViewModel.otherNewsItem.indices, id: \.self) {
                index in
                CustomOtherNewsView(
                    newsItem: secondViewModel.otherNewsItem[index]
                )
            }
        }
    }
}
