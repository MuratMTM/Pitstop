import Foundation

struct NewsItem: Identifiable{
    let id = UUID()
    let imageName: String
    let title: String
    let authorImage: String
    let authorName: String
    let date: String
}


