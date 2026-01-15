import SwiftUI

struct RaceListView: View {
    @StateObject private var viewModel = RaceViewModel()

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 14) {

                    Text("F1 Yarış Sonuçları")
                        .font(.system(size: 34, weight: .black, design: .rounded))
                        .padding(.top, 10)
                        .padding(.horizontal, 16)

                    // Error (üstte göster + retry)
                    if let error = viewModel.errorMessage {
                        ErrorBanner(message: error) {
                            Task { await viewModel.loadRaceCalendar() }
                        }
                        .padding(.horizontal, 16)
                    }

             
                    LazyVStack(spacing: 14) {
                        ForEach(viewModel.races.sorted(by: { ($0.round ?? 999) < ($1.round ?? 999)})) { race in
                            RaceCardView(race: race)
                        }

                
                        if !viewModel.isLoading && viewModel.races.isEmpty && viewModel.errorMessage == nil {
                            EmptyStateView()
                                .padding(.top, 24)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 24)

                    // İlk yükleme: data yokken spinner
                    if viewModel.isLoading && viewModel.races.isEmpty {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .padding(.top, 20)
                    }
                }
            }
            .refreshable {
                await viewModel.loadRaceCalendar()
            }
        }
        .task {
            await viewModel.loadRaceCalendar()
        }
    }
}

// MARK: - Small UI
private struct ErrorBanner: View {
    let message: String
    let retry: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundStyle(.orange)

                Text(message)
                    .font(.callout.weight(.semibold))
                    .foregroundStyle(.secondary)

                Spacer()

                Button("Tekrar Dene", action: retry)
                    .font(.caption.weight(.bold))
            }
        }
        .padding(12)
        .background(.background, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 6)
    }
}

private struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "calendar")
                .font(.system(size: 28))
                .foregroundStyle(.secondary)
            Text("Henüz yarış bulunamadı.")
                .font(.callout.weight(.semibold))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}
