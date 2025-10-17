
import SwiftUI

struct CustomDriverCareerRecordView: View {
    let dataCount: String
    let dataText: String
    var body: some View {
       
        VStack {
            Text("\(dataCount)")
                .font(.system(size: 30, weight: .bold, design: .default))
                .foregroundColor(.white)
                .padding(.bottom,5)
            
            Text("\(dataText)")
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .frame(width: 100, height: 110)
        .background(
            LinearGradient(
                colors: [Color.orange.opacity(0.7), Color.red.opacity(0.7)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
        .cornerRadius(15)
        .shadow(radius: 20)
        .padding(.horizontal)
        .padding(.bottom,5)
        .multilineTextAlignment(.center)
        
    }
}

#Preview {
    CustomDriverCareerRecordView(dataCount: "3", dataText: "Şampiyonluk")
}

