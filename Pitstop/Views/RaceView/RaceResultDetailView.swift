//
//  RaceResultDetailView.swift
//  Pitstop
//
//  Created by Murat Işık on 15.12.2025.
//

import SwiftUI

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
        HStack {
            Text("POS")
                .frame(width: 36, alignment: .leading)
            
            Text("NO")
                .frame(width: 36, alignment: .leading)
            
            Text("DRIVER")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("TEAM")
                .frame(width: 110, alignment: .leading)
            
            Text("TIME")
                .frame(width: 90, alignment: .trailing)
            
            Text("PTS")
                .frame(width: 36, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(.secondary)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color(.systemGray6))
    }
}

struct RaceResultRowView: View {
    
    let result: RaceResultModel
    
    var body: some View {
        HStack(spacing: 12) {
            
            // POSITION
            positionView
            
            // DRIVER NUMBER
            Text("\(result.driver.number)")
                .frame(width: 36, alignment: .leading)
                .font(.subheadline)
            
            // DRIVER
            driverView
            
            // TEAM
            teamView
            
            // TIME / DNF
            timeView
            
            // POINTS
            Text("\(result.points)")
                .frame(width: 36, alignment: .trailing)
                .font(.subheadline.bold())
                .foregroundColor(result.points == 0 ? .secondary : .primary)
        }
        .frame(height: 52)
    }
}

private extension RaceResultRowView {
    
    var positionView: some View {
        Group {
            if let pos = result.position.value {
                Text("\(pos)")
                    .font(.subheadline.bold())
                    .foregroundColor(.positionColor(pos))
            } else {
                Text("NC")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 36, alignment: .leading)
    }
}


private extension RaceResultRowView {
    
    var driverView: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("\(result.driver.name) \(result.driver.surname)")
                .font(.subheadline)
                .lineLimit(1)
            
            Text(result.driver.shortName)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private extension RaceResultRowView {
    
    var teamView: some View {
        Text(result.team.teamName)
            .font(.footnote)
            .foregroundColor(.primary)
            .frame(width: 110, alignment: .leading)
            .lineLimit(1)
    }
}

private extension RaceResultRowView {
    
    var timeView: some View {
        Text(result.time ?? "DNF")
            .font(.footnote.monospaced())
            .foregroundColor(result.time == nil ? .secondary : .primary)
            .frame(width: 90, alignment: .trailing)
    }
}
