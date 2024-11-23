import SwiftUI

struct ProgressBar: View {
    
    var progress: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 4)
                .foregroundColor(Color(hue: 1, saturation: 0.0, brightness: 0.6, opacity: 0.33))
                .cornerRadius(10)
            
            Rectangle()
                .frame(width: progress, height: 4)
                .cornerRadius(10)
                    
        }
    }
}

#Preview {
    ProgressBar(progress: 80)
}
