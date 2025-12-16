import SwiftUI
import SafariServices

// MARK: - Page

struct NewsPageView: View {
    @StateObject private var viewModel = NewsViewModel()
    @State private var selectedIndex = 0
    @State private var selectedURL: URL?

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                PitstopHeaderView()

                NewsFeedView(
                    viewModel: viewModel,
                    selectedIndex: $selectedIndex,
                    onOpenURL: { selectedURL = $0 }
                )

                NewsDivider()
                    .padding(.vertical, 10)

                OtherNewsListView(
                    viewModel: viewModel,
                    onOpenURL: { selectedURL = $0 }
                )
                .padding(.bottom, 20)
            }
        }
        .ignoresSafeArea(edges: .top)
        .task {
            if viewModel.articles.isEmpty {
                await viewModel.loadNews(limit: 30)
            }
        }
        .sheet(item: $selectedURL) { url in
            SafariView(url: url)
        }
    }
}

#Preview {
    NewsPageView()
}

// MARK: - Header

struct PitstopHeaderView: View {
    private let pitStopHeader: String = "Pitstop"
    private let pitStopFlagHeader: String = "raceFlag"

    var body: some View {
        ZStack {
            Color(red: 0.9, green: 0.2, blue: 0.2)
                .ignoresSafeArea()

            HStack(spacing: 12) {
                Text(pitStopHeader)
                    .font(.system(size: 28, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)

                Image(pitStopFlagHeader)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 36, height: 20)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .safeAreaPadding(.top)
        }
        .frame(height: 96)
    }
}

// MARK: - Feed (Carousel + Hero Card)

struct NewsFeedView: View {
    @ObservedObject var viewModel: NewsViewModel
    @Binding var selectedIndex: Int
    let onOpenURL: (URL) -> Void

    var body: some View {
        VStack(spacing: 14) {

            if viewModel.isLoading {
                ProgressView("Loading news...")
                    .padding(.top, 16)
                returnAnyView()
            }

            if let error = viewModel.errorMessage {
                errorView(error)
                returnAnyView()
            }

            if viewModel.articles.isEmpty {
                Text("No news available.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .padding(.top, 24)
                returnAnyView()
            }

            ScrollableNewsImagesView(
                articles: heroArticles,
                selectedIndex: $selectedIndex,
                onTap: { onOpenURL($0) }
            )

            GeometryReader { proxy in
                let screenW = proxy.size.width
                let cardW = min(420, screenW - 40)

                NewsTitleBoxView(
                    article: selectedHeroArticle,
                    cardWidth: cardW,
                    onTap: { onOpenURL($0) }
                )
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .frame(height: 170)
        }
        .padding(.top, 8)
    }

    // İlk 7 haber = carousel
    private var heroArticles: [NewsArticleModel] {
        Array(viewModel.articles.prefix(7))
    }

    private var selectedHeroArticle: NewsArticleModel? {
        guard !heroArticles.isEmpty else { return nil }
        let safeIndex = min(max(selectedIndex, 0), heroArticles.count - 1)
        return heroArticles[safeIndex]
    }

    @ViewBuilder
    private func errorView(_ error: String) -> some View {
        VStack(spacing: 10) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.title2)
                .foregroundStyle(.red)

            Text(error)
                .font(.callout)
                .foregroundStyle(.secondary)

            Button("Try Again") {
                Task { await viewModel.loadNews(limit: 30) }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(.top, 20)
    }

    // SwiftUI’da “return” gibi davranmak için küçük hack
    @ViewBuilder private func returnAnyView() -> some View { EmptyView() }
}

// MARK: - Carousel

struct ScrollableNewsImagesView: View {
    let articles: [NewsArticleModel]
    @Binding var selectedIndex: Int
    let onTap: (URL) -> Void

    var body: some View {
        if !articles.isEmpty {
            TabView(selection: $selectedIndex) {
                ForEach(Array(articles.enumerated()), id: \.offset) { index, article in
                    NewsHeroImage(urlString: article.image)
                        .frame(height: 270)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .padding(.horizontal, 20)
                        .tag(index)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if let url = URL(string: article.url) {
                                onTap(url)
                            }
                        }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .frame(height: 270)
        }
    }
}

// MARK: - Hero Card (3 satır summary)

struct NewsTitleBoxView: View {
    let article: NewsArticleModel?
    let cardWidth: CGFloat
    let onTap: (URL) -> Void

    var body: some View {
        if let article {
            VStack(alignment: .center, spacing: 10) {

                Text(article.title)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 14)
                    .padding(.top, 12)

                HStack(spacing: 8) {
                    Image(systemName: "link.circle.fill")
                        .font(.system(size: 18))
                        .foregroundStyle(.gray)

                    Text(article.source)
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(.gray)

                    Spacer()

                    Text(article.publishedAt.prettyNewsDate)
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 16)

                Text(article.summary)
                    .font(.system(size: 13, weight: .regular, design: .rounded))
                    .foregroundColor(.black.opacity(0.75))
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 14)
            }
            .frame(width: cardWidth)
            .background(Color.cyan.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(radius: 5)
            .padding(.horizontal, 20)
            .contentShape(Rectangle())
            .onTapGesture {
                if let url = URL(string: article.url) {
                    onTap(url)
                }
            }
        }
    }
}

// MARK: - Other News List (summary yok)

struct OtherNewsListView: View {
    @ObservedObject var viewModel: NewsViewModel
    let onOpenURL: (URL) -> Void

    var body: some View {
        VStack(spacing: 12) {
            ForEach(otherArticles) { article in
                OtherNewsRow(article: article)
                    .onTapGesture {
                        if let url = URL(string: article.url) {
                            onOpenURL(url)
                        }
                    }
            }
        }
        .padding(.horizontal, 16)
    }

    private var otherArticles: [NewsArticleModel] {
        Array(viewModel.articles.dropFirst(7))
    }
}

struct OtherNewsRow: View {
    let article: NewsArticleModel

    var body: some View {
        HStack(spacing: 12) {
            NewsThumb(urlString: article.image)
                .frame(width: 80, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))

            VStack(alignment: .leading, spacing: 6) {
                Text(article.title)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundStyle(.primary)
                    .lineLimit(2)

                HStack(spacing: 8) {
                    Text(article.source)
                    Text("•")
                    Text(article.publishedAt.prettyNewsDate)
                }
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(1)
            }

            Spacer()
        }
        .padding(12)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: .black.opacity(0.06), radius: 6, x: 0, y: 2)
    }
}

// MARK: - Thumbnails / Images

struct NewsThumb: View {
    let urlString: String?

    var body: some View {
        if let urlString, let url = URL(string: urlString) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    placeholder
                case .success(let image):
                    image.resizable().scaledToFill()
                case .failure:
                    placeholder
                @unknown default:
                    placeholder
                }
            }
        } else {
            placeholder
        }
    }

    private var placeholder: some View {
        ZStack {
            Color.black.opacity(0.06)
            Image(systemName: "photo")
                .foregroundStyle(.secondary)
        }
    }
}

struct NewsHeroImage: View {
    let urlString: String?

    var body: some View {
        if let urlString, let url = URL(string: urlString) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    placeholder
                case .success(let image):
                    image.resizable().scaledToFill()
                case .failure:
                    placeholder
                @unknown default:
                    placeholder
                }
            }
        } else {
            placeholder
        }
    }

    private var placeholder: some View {
        ZStack {
            LinearGradient(
                colors: [Color.black.opacity(0.15), Color.black.opacity(0.05)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            Image(systemName: "newspaper.fill")
                .font(.system(size: 42))
                .foregroundStyle(.white.opacity(0.9))
        }
    }
}

// MARK: - Divider

struct NewsDivider: View {
    var body: some View {
        Rectangle()
            .fill(Color.black.opacity(0.12))
            .frame(height: 1)
            .padding(.horizontal, 20)
    }
}

// MARK: - Safari Sheet

extension URL: @retroactive Identifiable {
    public var id: String { absoluteString }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}
