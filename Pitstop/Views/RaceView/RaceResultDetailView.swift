

import SwiftUI


struct RaceResultListView: View {
    
    @StateObject private var viewModel: RaceDetailViewModel
    
    init(viewModel: RaceDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            RaceResultHeaderView()
            
            Divider()
            
            List {
                ForEach(viewModel.results, id: \.driver.driverId) { result in
                    RaceResultRowView(result: result)
                        .listRowInsets(
                            EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
                        )
                }
            }
            .listStyle(.plain)
        }
        .background(Color.white)
        .task {
            await viewModel.fetchRaceDetail()
        }
    }
}

struct RaceResultHeaderView: View {
    
    var body: some View {
        HStack(spacing: 12) {
            
            Text("POS")
                .frame(width: RaceResultLayout.positionWidth, alignment: .leading)
            
            Text("DRIVER")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("TIME")
                .frame(width: RaceResultLayout.timeWidth, alignment: .trailing)
            
            Text("PTS")
                .frame(width: RaceResultLayout.pointsWidth, alignment: .trailing)
        }
        .font(.caption)
        .foregroundStyle(.secondary)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color(.systemGray6))
    }
}



struct RaceResultRowView: View {
    
    let result: RaceResultModel
    
    var body: some View {
        HStack(spacing: 12) {
            
            positionView
            
            driverView
            
            statusView
            
            pointsView
        }
        .frame(height: 52)
    }
}



private extension RaceResultRowView {
    
    private var positionView: some View {
        Group {
            if let pos = result.position.value {
                Text("\(pos)")
                    .font(.subheadline.bold())
                    .foregroundColor(.positionColor(pos))
            } else {
                Text("NC")
                    .font(.caption.bold())
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 32, alignment: .leading)
    }

}


private extension RaceResultRowView {
    
    private var driverView: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("\(result.driver.name) \(result.driver.surname)")
                .font(.subheadline)
                .lineLimit(1)
            
            Text(result.team.teamName)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

}

private extension RaceResultRowView {

    private var statusView: some View {
        Text(result.statusText)
            .font(.footnote.monospacedDigit())
            .lineLimit(1)
            .truncationMode(.tail)
            .minimumScaleFactor(0.8)
            .foregroundColor(result.statusColor)
            .frame(
                width: RaceResultLayout.timeWidth,
                alignment: .trailing
            )
    }

    
    private var pointsView: some View {
        Text("\(result.points)")
            .font(.subheadline.bold())
            .foregroundColor(result.points == 0 ? .secondary : .primary)
            .frame(
                width: RaceResultLayout.pointsWidth,
                alignment: .trailing
            )
    }


        
    }
