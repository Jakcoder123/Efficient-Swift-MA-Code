import SwiftUI

struct Card2View: View {
    
    var lesson2: Lesson2
    
    var body: some View {
        
            ZStack {
                Rectangle()
                    .background {
                        Image(lesson2.imageName)
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
                        Text(lesson2.name)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text(lesson2.summary)
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
    Card2View(lesson2: Lesson2(name: "Unbekannt", imageName: "lesson2", summary: "(Constants, Variables, Strings, Integers...)"))
}
