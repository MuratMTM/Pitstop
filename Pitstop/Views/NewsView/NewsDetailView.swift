import SwiftUI
import SafariServices

struct NewsDetailView: View {
    let article: News  // Artık NewsArticleModel değil, News
    
    @State private var showSafari = false
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    
                    heroImage
                        .frame(height: 280)
                        .padding(.top, 118)
                    
                    VStack(alignment: .leading, spacing: 18) {
                        
                        Text(article.title)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        HStack(spacing: 8) {
                            Text(article.source ?? "Autosport")
                                .fontWeight(.bold)
                            Text("•")
                            Text(article.publishedAt.formatted(date: .abbreviated, time: .omitted))
                        }
                        .padding(.horizontal, 8)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        
                        if let summary = article.summary, !summary.isEmpty {
                            Text(summary)
                                .font(.system(size: 19))
                                .lineSpacing(7)
                                .foregroundStyle(.primary)
                        }
                    }
                    .padding(20)
                    
                    readFullButton
                        .padding(.top, 20)
                        .padding(.bottom, 40)
                    
                    Spacer(minLength: 100)
                }
            }
            .ignoresSafeArea(edges: .top)
            
            PitstopHeaderView()
        }
        .sheet(isPresented: $showSafari) {
            if let url = URL(string: article.url) {
                SafariView(url: url)
            }
        }
    }
    
    // MARK: - Hero Image
    private var heroImage: some View {
        AsyncImage(url: URL(string: article.imageUrl ?? "")) { phase in
            switch phase {
            case .empty:
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .overlay(ProgressView())
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .overlay(
                        Image(systemName: "photo")
                            .font(.title)
                            .foregroundStyle(.secondary)
                    )
            @unknown default:
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
            }
        }
        .clipped()
    }
    
    // MARK: - Read Full Button
    private var readFullButton: some View {
        Button {
            showSafari = true
        } label: {
            HStack(spacing: 12) {
                Text("Read more on \(article.source ?? "Autosport")")
                    .font(.system(size: 16, weight: .bold))
                
                Image(systemName: "arrow.right")
                    .font(.system(size: 16, weight: .bold))
            }
            .padding(.horizontal, 18)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .red.opacity(0.2), radius: 8, x: 0, y: 4)
        }
        .padding(.horizontal, 60)
        .padding(.bottom, 10)
        .background(
            LinearGradient(
                colors: [.clear, Color(.systemBackground).opacity(0.8), Color(.systemBackground)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }
}


