import SwiftUI
import SafariServices

struct NewsDetailView: View {
    let article: News
    
    @State private var showSafari = false
    @State private var showShareSheet = false
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    
                    heroImage
                        .frame(height: 320)
                        .padding(.top, 118)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text(article.title)
                            .font(.system(size: 26, weight: .bold, design: .rounded))
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        HStack(spacing: 8) {
                            Text(article.source ?? "Autosport")
                                .fontWeight(.semibold)
                            Text("•")
                            Text(article.publishedAt.formatted(date: .abbreviated, time: .omitted))
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        
                        if let summary = article.summary, !summary.isEmpty {
                            Text(summary)
                                .font(.system(size: 17, weight: .regular))
                                .lineSpacing(8)
                                .foregroundStyle(.primary)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal,20)
                            
                        } else {
                            Text("No summary available.")
                                .font(.system(size: 17))
                                .foregroundStyle(.secondary)
                                .italic()
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    readFullButton
                        .padding(.top, 30)
                        .padding(.bottom, 40)
                    
                    Spacer(minLength: 100)
                }
            }
            .ignoresSafeArea(edges: .top)
            
      
                .overlay(alignment: .trailing) {
                    Button(action: {
                        showShareSheet = true
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.trailing, 20)
                    }
                }
        }
        .sheet(isPresented: $showSafari) {
            if let url = URL(string: article.url) {
                SafariView(url: url)
            }
        }
        .sheet(isPresented: $showShareSheet) {
            if let url = URL(string: article.url) {
                ShareSheet(activityItems: [article.title, url])
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
                EmptyView()
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
                    .font(.system(size: 17, weight: .bold))
                
                Image(systemName: "arrow.right")
                    .font(.system(size: 17, weight: .bold))
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .red.opacity(0.2), radius: 8, x: 0, y: 4)
        }
        .padding(.horizontal, 60)
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

// MARK: - Share Sheet
struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
