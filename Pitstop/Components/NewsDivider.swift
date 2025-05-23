//
//  NewsDivider.swift
//  Pitstop
//
//  Created by Murat Işık on 23.05.2025.
//

import SwiftUI

struct NewsDivider: View {
    var text: String = "News"
    var color: Color = .gray
    var lineHeight: CGFloat = 1

    var body: some View {
        HStack {
            Rectangle()
                .fill(color)
                .frame(height: lineHeight)

            Text(text)
                .font(.caption)
                .foregroundColor(color)
                .padding(.horizontal, 8)

            Rectangle()
                .fill(color)
                .frame(height: lineHeight)
        }
    }
}

#Preview {
    NewsDivider()
}
