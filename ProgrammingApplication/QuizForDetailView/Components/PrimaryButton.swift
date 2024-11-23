import SwiftUI

struct PrimaryButton: View {
    
    var text: String
    var background: Color = Color(.blue)
    
    var body: some View {
        
        Text(text)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(10)
            .shadow(color: .black, radius: 0.5, x: 0, y: 3)
            .foregroundColor(.white)



    }
}

#Preview {
    PrimaryButton(text: "Next")
}
