import SwiftUI

struct Card3View: View {
    
    var lesson3: Lesson3
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .background {
                    Image(lesson3.imageName)
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
                    Text(lesson3.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(lesson3.summary)
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
    Card3View(lesson3: Lesson3(name:"Unbekannt", imageName: "lesson3", summary:"(SubThema1, SubThema2...)"))
}

