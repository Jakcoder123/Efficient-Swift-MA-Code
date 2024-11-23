import SwiftUI

struct Lesson2DetailView: View {
    
    var lesson2: Lesson2
    
    var body: some View {
        Text("Dies ist der zweite Kurs")
    }
}

#Preview {
    Lesson1DetailView(lesson1: Lesson1(name: "x", imageName: "-", summary: "-"))
}

