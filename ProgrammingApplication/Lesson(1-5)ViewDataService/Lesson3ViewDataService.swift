import Foundation

struct Lesson3ViewDataService {
    
    func getLesson3Data() -> [Lesson3] {
        
        // Den Dateipfad zu Lesson1ViewDaten.json bekommen
        if let url = Bundle.main.url(forResource: "Lesson3ViewDaten", withExtension: "json") {
            
            do {
                // Lese die Datei und wandle es in Daten um
                let data = try Data(contentsOf: url)
                
                // Daten in Swift-Instanzen parsen
                let decoder = JSONDecoder()
                
                do {
                    let lessons3 = try decoder.decode([Lesson3].self, from: data)
                    return lessons3
                }
                catch {
                    print("Konnte die JSON-Datei nicht parsen: \(error)")
                }
            }
            catch {
                print("Konnte die Datei nicht lesen \(error)")
            }
            
        }
        
        return [Lesson3]()
    }
}
