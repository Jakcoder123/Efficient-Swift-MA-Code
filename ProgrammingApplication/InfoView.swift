import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Info")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    InfoView()
}
