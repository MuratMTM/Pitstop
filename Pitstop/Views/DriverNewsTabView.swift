//
//  DriverNewsTabView.swift
//  Pitstop
//
//  Created by Murat Işık on 8.07.2025.
//

import SwiftUI

struct DriverNewsTabView: View {
    var body: some View {
        CustomOtherNewsView(newsItem: OtherNewsItemViewModel().verstappenNewsItem[0] )
        CustomOtherNewsView(newsItem: OtherNewsItemViewModel().verstappenNewsItem[1] )
        CustomOtherNewsView(newsItem: OtherNewsItemViewModel().verstappenNewsItem[2] )
    }
}

#Preview {
    DriverNewsTabView()
}
