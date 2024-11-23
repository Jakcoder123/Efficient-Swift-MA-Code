import SwiftUI

struct Card4View: View {
    
    var lesson4: Lesson4
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .background {
                    Image(lesson4.imageName)
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
                    Text(lesson4.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(lesson4.summary)
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
    Card4View(lesson4: Lesson4(name:"Unbekannt",
                               imageName: "lesson4",
                               summary:"(SubThema1, SubThema2...)"))
}
