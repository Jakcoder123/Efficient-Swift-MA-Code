import Foundation
import SwiftUI

func snakeCaseModifier(_ word: String) -> Text {
    return Text(word)
        .font(.custom("Menlo", size: 16))
        .bold()
}

func stringModifier(_ word: String) -> Text {
    return Text(word)
        .font(.custom("Menlo", size: 16))
        .foregroundStyle(.red)
        .bold()
}

func numberModifier(_ word: String) -> Text {
return Text(word)
    .font(.custom("Menlo", size: 16))
    .foregroundStyle(Color(red: 255/255, green: 204/255, blue: 10/255))
    .bold()
}

func structModifier(_ word: String) -> Text {
return Text(word)
    .font(.custom("Menlo", size: 16))
    .bold()
    .foregroundStyle(Color(red: 238/255, green: 51/255, blue: 126/255))
}

func typeModifier(_ word: String) -> Text {
return Text(word)
    .font(.custom("Menlo", size: 16))
    .bold()
    .foregroundStyle(Color(red: 173/255, green: 68/255, blue: 171/255))
}

func funcModifier(_ word: String) -> Text {
return Text(word)
    .font(.custom("Menlo", size: 16))
    .bold()
    .foregroundStyle(Color(red: 125/255, green: 101/255, blue: 162/255))
}

func commentModifier(_ word: String) -> Text {
return Text(word)
    .font(.custom("Menlo", size: 16))
    .bold()
    .foregroundStyle(Color(.darkGray))
}

func underlineModifier(_ word: String) -> Text {
return Text(word)
    .font(.system(size: 14))
    .underline()
    .bold()
}
