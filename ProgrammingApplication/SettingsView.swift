import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Einstellungen")
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
    SettingsView()
}
