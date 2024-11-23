import Foundation

struct Lesson5ViewDataService {
    
    func getLesson5Data() -> [Lesson5] {
        
        // Den Dateipfad zu Lesson1ViewDaten.json bekommen
        if let url = Bundle.main.url(forResource: "Lesson5ViewDaten", withExtension: "json") {
            
            do {
                // Lese die Datei und wandle es in Daten um
                let data = try Data(contentsOf: url)
                
                // Daten in Swift-Instanzen parsen
                let decoder = JSONDecoder()
                
                do {
                    let lessons5 = try decoder.decode([Lesson5].self, from: data)
                    return lessons5
                }
                catch {
                    print("Konnte die JSON-Datei nicht parsen: \(error)")
                }
            }
            catch {
                print("Konnte die Datei nicht lesen \(error)")
            }
            
        }
        
        return [Lesson5]()
    }
}
