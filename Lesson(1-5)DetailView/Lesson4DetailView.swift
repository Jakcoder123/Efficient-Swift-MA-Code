import SwiftUI

struct Lesson4DetailView: View {
    
    var lesson4: Lesson4
    
    var body: some View {
        Text("Dies ist der vierte Kurs")
    }
}

#Preview {
    Lesson4DetailView(lesson4: Lesson4(name: "x", imageName: "-", summary: "-"))
}

