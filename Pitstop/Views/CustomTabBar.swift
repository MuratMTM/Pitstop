import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            // Blur veya renkli arka plan
            Rectangle()
                .fill(.ultraThinMaterial)
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .ignoresSafeArea(edges: .bottom)
                .frame(height: 90)
                .overlay(Divider().background(Color.white.opacity(0.2)), alignment: .top)
            
            HStack(spacing: 40) {
                TabButton(icon: "newspaper.fill", title: "Haberler", index: 0, selectedTab: $selectedTab)
                TabButton(icon: "f1CarIcon", title: "Takımlar", index: 1, selectedTab: $selectedTab)
                TabButton(icon: "racing-helmet", title: "Puan", index: 2, selectedTab: $selectedTab)
                TabButton(icon: "flag.pattern.checkered.2.crossed", title: "Takvim", index: 3, selectedTab: $selectedTab)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 15)
        }
    }
}


struct TabButton: View {
    let icon: String      // asset adı (ör: "newsIcon")
    let title: String
    let index: Int
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack(spacing: 6) {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 22, height: 22)
                .foregroundStyle(selectedTab == index ? .white : .gray)
                .opacity(selectedTab == index ? 1.0 : 0.7)
                .animation(.easeInOut(duration: 0.2), value: selectedTab)
            
            Text(title)
                .font(.caption2)
                .fontWeight(selectedTab == index ? .semibold : .regular)
                .foregroundColor(selectedTab == index ? .white : .gray)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 8)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)) {
                selectedTab = index
            }
        }
    }
}
