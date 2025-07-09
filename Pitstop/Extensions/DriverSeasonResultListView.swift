import SwiftUI

struct GrandPrixRowView: View {
    let result: GrandPrixResult

    var body: some View {
        HStack(spacing: 0) {
            Text(result.name)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(result.position)
                .frame(maxWidth: .infinity, alignment: .center)

            Text("\(result.points)")
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.08)))
    }
}

struct GrandPrixListView: View {
    let grandPrixes: [GrandPrixResult]

    var totalPoints: Int {
        grandPrixes.map { $0.points }.reduce(0, +)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text("Pist Performansı")
                    .font(.title2.bold())
                    .padding(.bottom, 4)

                // 🔹 Başlıklar
                HStack(spacing: 0) {
                    Text("Pist")
                        .font(.subheadline.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text("Sıralama")
                        .font(.subheadline.bold())
                        .frame(maxWidth: .infinity, alignment: .center)

                    Text("Puan")
                        .font(.subheadline.bold())
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.horizontal)

                // 🔹 Satırlar
                ForEach(grandPrixes) { result in
                    GrandPrixRowView(result: result)
                }

                Divider().padding(.vertical, 4)

                // 🔹 Toplam Puan
                HStack {
                    Spacer()
                    Text("Toplam Puan: \(totalPoints)")
                        .font(.headline)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue.opacity(0.2))
                        )
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
        )
        .padding()
    }
}



#Preview {
    GrandPrixListView(grandPrixes: DriverMockData.verstappenDetail.grandPrixes)
        .background(Color.black.opacity(0.2))
        
}
