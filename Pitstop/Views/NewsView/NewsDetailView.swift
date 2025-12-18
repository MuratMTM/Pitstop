import SwiftUI

struct NewsDetailView: View {
    @StateObject private var viewModel: NewsDetailViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var showSafari = false
    
    init(article: NewsArticleModel) {
        _viewModel = StateObject(wrappedValue: NewsDetailViewModel(article: article))
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    
                    
                    heroImage
                        .frame(height: 280)
                        .padding(.top, 118)
                    
                    VStack(alignment: .leading, spacing: 18) {
                        
                        
                        Text(viewModel.title)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        
                        HStack(spacing: 8) {
                            Text(viewModel.sourceText)
                                .fontWeight(.bold)
                            Text("•")
                            Text(viewModel.formattedDate)
                        }.padding(.horizontal, 8)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        
                        Text(viewModel.summary)
                            .font(.system(size: 19))
                            .lineSpacing(7)
                            .foregroundStyle(.primary)
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
            if let url = viewModel.articleURL {
                SafariView(url: url)
            }
        }
    }
    
    // MARK: - Bileşenler
    
    private var heroImage: some View {
        AsyncImage(url: viewModel.imageURL) { image in
            image.resizable()
                .scaledToFill()
        } placeholder: {
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .overlay(ProgressView())
        }
        .clipped()
    }
    
    private var readFullButton: some View {
        Button {
            showSafari = true
        } label: {
            HStack(spacing: 12) {
                Text("Read more on \(viewModel.sourceText)")
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
            
            LinearGradient(colors: [.clear, Color(.systemBackground).opacity(0.8), Color(.systemBackground)],
                           startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
        )
    }
}
