
import SwiftUI

struct AsyncImageView: View {
    let url: String
    
    var body: some View {
       
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
            
                ProgressView()
            case .success(let image):
         
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            case .failure:
       
                Image(systemName: "photo.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
    }
}

struct LoadingView: View {
    let message: String
    var body: some View {
        VStack {
            ProgressView()
            Text(message).padding(.top, 8)
        }
    }
}

struct ErrorView: View {
    let errorMessage: String
    let retryAction: () -> Void
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.red)
            Text("Hata Oluştu: \(errorMessage)")
                .multilineTextAlignment(.center)
            Button("Yeniden Dene", action: retryAction)
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
