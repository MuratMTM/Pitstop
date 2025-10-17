import SwiftUI




struct NewsDetailItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String? // Opsiyonel özet
    let body: String // Detay sayfası içeriği
    let imageUrl: String // Asset adı veya SFSymbol
    let date: String
    let source: String
    let relatedDrivers: [String] // İlgili pilotlar (ör: ["Max Verstappen", "Sergio Perez"])
    let type: NewsType
}

enum NewsType {
    case carousel, card
}
