import Foundation

struct Lesson5: Identifiable, Decodable {
    
    let id = UUID()
    var name: String
    var imageName: String
    var summary: String
    
}
