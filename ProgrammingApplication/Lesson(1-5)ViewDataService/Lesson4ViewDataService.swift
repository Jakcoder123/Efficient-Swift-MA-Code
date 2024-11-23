import Foundation

struct Lesson4ViewDataService {
    
    func getLesson4Data() -> [Lesson4] {
        
        // Den Dateipfad zu Lesson1ViewDaten.json bekommen
        if let url = Bundle.main.url(forResource: "Lesson4ViewDaten", withExtension: "json") {
            
            do {
                // Lese die Datei und wandle es in Daten um
                let data = try Data(contentsOf: url)
                
                // Daten in Swift-Instanzen parsen
                let decoder = JSONDecoder()
                
                do {
                    let lessons4 = try decoder.decode([Lesson4].self, from: data)
                    return lessons4
                }
                catch {
                    print("Konnte die JSON-Datei nicht parsen: \(error)")
                }
            }
            catch {
                print("Konnte die Datei nicht lesen \(error)")
            }
            
        }
        
        return [Lesson4]()
    }
}
