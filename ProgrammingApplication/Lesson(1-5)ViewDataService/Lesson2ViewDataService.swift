import Foundation

struct Lesson2ViewDataService {
    
    func getLesson2Data() -> [Lesson2] {
        
        // Den Dateipfad zu Lesson1ViewDaten.json bekommen
        if let url = Bundle.main.url(forResource: "Lesson2ViewDaten", withExtension: "json") {
            
            do {
                // Lese die Datei und wandle es in Daten um
                let data = try Data(contentsOf: url)
                
                // Daten in Swift-Instanzen parsen
                let decoder = JSONDecoder()
                
                do {
                    let lessons2 = try decoder.decode([Lesson2].self, from: data)
                    return lessons2
                }
                catch {
                    print("Konnte die JSON-Datei nicht parsen: \(error)")
                }
            }
            catch {
                print("Konnte die Datei nicht lesen \(error)")
            }
            
        }
        
        return [Lesson2]()
    }
}

