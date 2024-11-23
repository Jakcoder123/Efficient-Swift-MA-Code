import SwiftUI

struct Lesson3DetailView: View {
    
    var lesson3: Lesson3
    
    var body: some View {
        Text("Dies ist der dritte Kurs")
    }
}

#Preview {
    Lesson3DetailView(lesson3: Lesson3(name: "x", imageName: "-", summary: "-"))
}
