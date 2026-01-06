import SwiftUI
import SafariServices

// MARK: - Page
struct NewsListView: View {
    
    @StateObject private var viewModel = NewsViewModel()
    @State private var selectedIndex = 0
    @State private var selectedArticle: News?
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                
                ScrollView {
                    VStack(spacing: 0) {
                        
                        NewsFeedView(
                            viewModel: viewModel,
                            selectedIndex: $selectedIndex,
                            onArticleTap: { selectedArticle = $0 }
                        )
                        
                        NewsDivider()
                            .padding(.vertical, 10)
                        
                        OtherNewsListView(
                            viewModel: viewModel,
                            onArticleTap: { selectedArticle = $0 }
                        )
                        .padding(.bottom, 16)
                    }
                    .padding(.top, 55)
                }
                
                PitstopHeaderView()
            }
            .task {
                if viewModel.articles.isEmpty {
                    await viewModel.loadNews()
                }
            }
            .navigationDestination(item: $selectedArticle) { article in
                NewsDetailView(article: article)
            }
            
        }
    }
}


// MARK: - Header
struct PitstopHeaderView: View {
    private let pitStopHeader: String = "Pitstop"
    private let pitStopFlagHeader: String = "raceFlag"
    var body: some View {
        VStack(spacing: 0) {
            Color.red
                .frame(height: UIApplication.shared.safeAreaTop)
            
            HStack(spacing: 12) {
                Text(pitStopHeader)
                    .font(.system(size: 28, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                
                Image(pitStopFlagHeader)
                    .resizable()
                    .frame(width: 36, height: 20)
            }
            .frame(height: 56)
            .frame(maxWidth: .infinity)
            .background(Color.red)
        }
        .ignoresSafeArea(.all)
        .frame(height: Header.height)
        .zIndex(10)
    }
}

// MARK: - Feed View
struct NewsFeedView: View {
    
    @ObservedObject var viewModel: NewsViewModel
    @Binding var selectedIndex: Int
    let onArticleTap: (News) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            if viewModel.isLoading {
                ProgressView("Loading news...")
                    .padding(.top, 16)
            } else if let error = viewModel.errorMessage {
                errorView(error)
            } else if viewModel.articles.isEmpty {
                Text("No news available.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .padding(.top, 24)
            } else {
                
                ScrollableNewsImagesView(
                    articles: heroArticles,
                    selectedIndex: $selectedIndex,
                    onArticleTap: onArticleTap
                )
                
                NewsTitleBoxView(
                    article: selectedHeroArticle,
                    cardWidth: UIScreen.main.bounds.width - 40,
                    onArticleTap: onArticleTap
                )
                .padding(.top, 20)
                .padding(.bottom, 10)
            }
        }
    }
    
    private var heroArticles: [News] {
        Array(viewModel.articles.prefix(7))
    }
    
    private var selectedHeroArticle: News? {
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
                Task { await viewModel.loadNews() }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(.top, 20)
    }
}

// MARK: - Carousel
struct ScrollableNewsImagesView: View {
    
    let articles: [News]
    @Binding var selectedIndex: Int
    let onArticleTap: (News) -> Void
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(Array(articles.enumerated()), id: \.offset) { index, article in
                NewsHeroImage(urlString: article.imageUrl)
                    .frame(height: 270)
                    .padding(.horizontal, 20)
                    .tag(index)
                    .onTapGesture {
                        onArticleTap(article)
                    }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .frame(height: 270)
    }
}

// MARK: - Hero Card
struct NewsTitleBoxView: View {
    let article: News?
    let cardWidth: CGFloat
    let onArticleTap: (News) -> Void
    
    var body: some View {
        if let article {
            VStack(spacing: 12) {
                Text(article.title)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                
                HStack(spacing: 10) {
                    Text(article.source ?? "Autosport")
                    Text("•")
                    Text(article.publishedAt.formatted(date: .abbreviated, time: .omitted))
                }
                .font(.caption)
                .foregroundStyle(.secondary)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 20)
            .frame(width: cardWidth)
            .background(Color.cyan.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .onTapGesture { onArticleTap(article) }
        }
    }
}

// MARK: - Other News List
struct OtherNewsListView: View {
    
    @ObservedObject var viewModel: NewsViewModel
    let onArticleTap: (News) -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(viewModel.articles.dropFirst(7)) { article in
                OtherNewsRow(article: article)
                    .onTapGesture {
                        onArticleTap(article)
                    }
            }
        }
        .padding(.horizontal, 16)
    }
}

struct OtherNewsRow: View {
    let article: News
    
    var body: some View {
        HStack(spacing: 12) {
            NewsThumb(urlString: article.imageUrl)
                .frame(width: 80, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            
            VStack(alignment: .leading, spacing: 6) {
                Text(article.title)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundStyle(.primary)
                    .lineLimit(3)
                
                HStack(spacing: 8) {
                    Text(article.source ?? "Autosport")
                    Text("•")
                    Text(article.publishedAt.formatted(date: .abbreviated, time: .omitted))
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
