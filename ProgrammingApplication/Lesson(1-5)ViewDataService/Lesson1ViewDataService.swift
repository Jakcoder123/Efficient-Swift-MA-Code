import Foundation

struct Lesson1ViewDataService {
    
    func getLesson1Data() -> [Lesson1] {
        
        // Den Dateipfad zu Lesson1ViewDaten.json bekommen
        if let url = Bundle.main.url(forResource: "Lesson1ViewDaten", withExtension: "json") {
            
            do {
                // Lese die Datei und wandle es in Daten um
                let data = try Data(contentsOf: url)
                
                // Daten in Swift-Instanzen parsen
                let decoder = JSONDecoder()
                
                do {
                    let lessons1 = try decoder.decode([Lesson1].self, from: data)
                    return lessons1
                }
                catch {
                    print("Konnte die JSON-Datei nicht parsen: \(error)")
                }
            }
            catch {
                print("Konnte die Datei nicht lesen \(error)")
            }
            
        }
        
        return [Lesson1]()
    }
}
