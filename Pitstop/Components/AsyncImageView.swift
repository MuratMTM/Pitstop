//
//  AsyncImageView.swift
//  Pitstop
//
//  Created by Murat Işık on 11.12.2025.
//

import SwiftUI

struct AsyncImageView: View {
    let url: String
    
    var body: some View {
        // URL'yi kullanarak görüntüyü çeker ve gösterir.
        // SwiftUI'ın resmi çözümü olan AsyncImage'i kullanmak en temiz yoldur.
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                // Yükleniyor durumu
                ProgressView()
            case .success(let image):
                // Başarılı yükleme
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            case .failure:
                // Hata durumu
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
