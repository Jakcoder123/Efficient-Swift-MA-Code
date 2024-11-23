import SwiftUI

struct Card1View: View {
    
    var lesson1: Lesson1
    
    var body: some View {
        
        
            ZStack {
                Rectangle()
                    .background {
                        Image(lesson1.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                    .foregroundColor(.clear)
                    .cornerRadius(15)
                    .shadow(color: .white, radius: 5)
                    .shadow(color: .black, radius: 5)
                
                
                Rectangle()
                    .opacity(0.5)
                    .cornerRadius(15)
                    .foregroundColor(.black)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(lesson1.name)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text(lesson1.summary)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                    }
                    .padding()
                    
                    Spacer()
                }
            }
            .frame(height: 250)
            
        
        
    }
}

#Preview {
    Card1View(lesson1: Lesson1(name: "Swift Basics", imageName: "lesson1", summary: "(Konstanten, Variablen, Werttypen...)"))
}
