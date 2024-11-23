import SwiftUI

struct Card5View: View {
    
    var lesson5: Lesson5
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .background {
                    Image(lesson5.imageName)
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
                    Text(lesson5.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(lesson5.summary)
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
    Card5View(lesson5: Lesson5(name:"Unbekannt", imageName: "lesson5",summary:"(SubThema1, SubThema2...)"))
}
