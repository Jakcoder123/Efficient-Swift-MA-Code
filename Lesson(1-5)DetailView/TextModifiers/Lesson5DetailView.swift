import SwiftUI

struct Lesson5DetailView: View {
    
    var lesson5: Lesson5
    
    var body: some View {
        Text("Dies ist der fünfte Kurs")
    }
}

#Preview {
    Lesson5DetailView(lesson5: Lesson5(name: "x", imageName: "-", summary: "-"))
}
