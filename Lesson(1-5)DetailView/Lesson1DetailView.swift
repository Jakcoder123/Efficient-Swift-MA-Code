import SwiftUI

extension UIApplication { // Keyboard hiding-Funktion
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct Lesson1DetailView: View {
    
    @StateObject var quizManager = QuizManager()
    
    var lesson1: Lesson1
    @State var txtValue1:String = ""
    @State var answer1: Bool? = nil
    @State var txtValue2:String = ""
    @State var answer2: Bool? = nil
    @State var txtValue3:String = ""
    @State var answer3: Bool? = nil
    @State var txtValue4:String = ""
    @State var answer4: Bool? = nil
    @State var txtValue5:String = ""
    @State var answer5: Bool? = nil
    @State private var rectangleIsVisible = false
    
    var body: some View {
            
                GeometryReader { geometry in
                ScrollView() {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            
                                Text("Variablen und Konstanten")
                                    .font(.system(size: 25))
                                    .padding()
                                
                                Text("Variablen und Konstanten werden dazu genutzt einem Namen (wie z.B \(snakeCaseModifier("maximalPunktzahl")) oder \(snakeCaseModifier("userBegrüssung"))) irgendeinen Wert (wie z.B \(numberModifier("100")) oder den String \(stringModifier("\"Hallo\""))) zuzuordnen. Der Wert einer Variablen kann zukünftig geändert werden während der Wert einer Konstanten nicht veränderbar ist.")
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                
                                Text("Eine Variable wird mit der Abkürzung \(structModifier("var")) deklariert, das könnte in etwa so aussehen:")
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                
                                ZStack {
                                    HStack {
                                        Spacer(minLength: 20)
                                        HStack {
                                        Text("""
                                            
                                            \(structModifier("var"))  \(snakeCaseModifier("userPunktzahl = ")) \(numberModifier("20    "))
                                                                                        
                                            """)
                                            .foregroundColor(.white)
                                            Spacer()
                                        }
                                            .padding(.leading,10)
                                            .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                            .cornerRadius(10)
                                            .shadow(radius: 10)
                                            .padding(1)
                                            .background(.black)
                                            .cornerRadius(10)
                                        Spacer(minLength: 20)
                                    }
                                    
                                }
                                
                                Text("Eine Konstante wird mit der Abkürzung \(structModifier("let")) deklariert, z.B so:")
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                    .padding(.top)
                                
                                ZStack {
                                    HStack {
                                        Spacer(minLength: 20)
                                        HStack {
                                        Text("""
                                            
                                            \(structModifier("let"))  \(snakeCaseModifier("maximalPunktzahl = ")) \(numberModifier("100"))
                                                                                        
                                            """)
                                            .foregroundColor(.white)
                                            Spacer()
                                        }
                                            .padding(.leading,10)
                                            .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                            .cornerRadius(10)
                                            .shadow(radius: 10)
                                            .padding(1)
                                            .background(.black)
                                            .cornerRadius(10)
                                        Spacer(minLength: 20)
                                    }
                                }
                                
                                Text("In den obigen Beispielen, haben wir für die Maximalpunktzahl \(structModifier("let")) (Konstante) verwendet, da sich diese nicht stetig ändern sollte. Für die Punktzahl des Users (Spielers) haben wir allerdings \(structModifier("var")) (Variable) verwendet, weil sich die Punktzahl des Users, je nach dessen Spielweise ändern kann.")
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.cyan)
                                        .padding(.horizontal)
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.cyan)
                                        .opacity(0.1)
                                        .padding(.horizontal)
                                    
                                    VStack {
                                        HStack {
                                            Text("Aufgabe")
                                                .foregroundColor(.cyan)
                                                .padding(.horizontal, 30)
                                                .padding(.vertical, 10)
                                            Spacer()
                                        }
                                        HStack(){
                                            TextField("   ?", text: $txtValue1)
                                                .textFieldStyle(.roundedBorder)
                                                .frame(width: 50, height: 20)
                                                .padding(.leading, 30)
                                                .onChange(of: txtValue1) { newValue in
                                                    let filtered = newValue.filter { !$0.isWhitespace }
                                                    if filtered != newValue {
                                                        txtValue1 = filtered
                                                    }
                                                    
                                                }
                                            
                                            
                                            Text("\(snakeCaseModifier("planetenAnzahl = ")) \(numberModifier("8"))")
                                                .padding(.trailing)
                                            
                                            if answer1 == true {
                                                
                                                Text(Image(systemName: "checkmark"))
                                                    .foregroundColor(.green)
                                                
                                            } else if answer1 == false{
                                                
                                                Text(Image(systemName: "xmark"))
                                                    .foregroundColor(.red)
                                                
                                            }
                                            Spacer()
                                            Spacer()
                                        }
                                        
                                        .padding(.vertical, 20)
                                        Button {
                                            
                                            withAnimation(.easeIn(duration:0.5)) {
                                                rectangleIsVisible = true
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                withAnimation(.easeOut(duration:0.5)) {
                                                    rectangleIsVisible = false
                                                }
                                            }
                                            
                                            
                                            if txtValue1 == "Var" || txtValue1 == "var" || txtValue1 == "Let" || txtValue1 == "let" {
                                                answer1 = true
                                            }
                                            else {
                                                answer1 = false
                                            }
                                        } label: {
                                            
                                            HStack{
                                                Spacer()
                                                
                                                Text("Fertig")
                                                    .shadow(color: .black, radius: 0, x: 0, y: 0.5)
                                                    .bold()
                                                    .padding(.vertical)
                                                Spacer()
                                            }
                                            .padding(10)
                                        }
                                        
                                    }
                                    if answer1 == true {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .opacity(0.5)
                                                .foregroundColor(.green)
                                                .padding(.horizontal)
                                            Text(Image(systemName: "checkmark"))
                                                .font(.system(size: 100))
                                                .foregroundColor(.white)
                                                .opacity(0.8)
                                        }
                                        .opacity(rectangleIsVisible ? 1 : 0)
                                    } else if answer1 == false {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .opacity(0.5)
                                                .foregroundColor(.red)
                                                .padding(.horizontal)
                                            Text(Image(systemName: "xmark"))
                                                .font(.system(size: 100))
                                                .foregroundColor(.white)
                                                .opacity(0.8)
                                        }
                                        .opacity(rectangleIsVisible ? 1 : 0)
                                    }
                                } // Aufgabenprogrammierung
                                .padding(.top)
                                
                                
                                Text("""
\(underlineModifier("Erklärung:")) Fülle die Lücke so, dass die Nummer 8 in der Variable/Konstanten planetenAnzahl gespeichert wird.
""")
                                .font(.system(size: 14))
                                .padding(.horizontal)
                                .padding(.bottom)
                                
                                Text("Man kann mehrere Variablen gleichzeitig deklarieren, indem man zuerst wie üblich die Abkürzung (\(structModifier("var"))/ \(structModifier("let"))) schreibt und dann die Variablen mit Kommas getrennt deklariert:")
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                    .padding(.top)
                                
                                ZStack {
                                    HStack {
                                        Spacer(minLength: 20)
                                        HStack {
                                        Text("""
                                            
                                            \(structModifier("var"))  \(snakeCaseModifier("x = ")) \(numberModifier("0.5")), \(snakeCaseModifier("y = ")) \(numberModifier("1.2")), \(snakeCaseModifier("z = ")) \(numberModifier("0.98"))
                                                                                        
                                            """)
                                            .foregroundColor(.white)
                                            Spacer()
                                        }
                                            .padding(.leading,10)
                                            .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                            .cornerRadius(10)
                                            .shadow(radius: 10)
                                            .padding(1)
                                            .background(.black)
                                            .cornerRadius(10)
                                        Spacer(minLength: 20)
                                    }
                                }
                                .padding(.bottom)
                                
                                
                                
                                Text("Werttypen")
                                    .font(.system(size: 25))
                                    .padding()
                                
                                Text("Man kann den Typ einer Variablen oder Konstanten, wie folgt definieren:")
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                
                                ZStack {
                                    HStack {
                                        Spacer(minLength: 20)
                                        HStack {
                                        Text("""
                                            
                                            \(structModifier("var"))  \(snakeCaseModifier("userBegrüssung:")) \(typeModifier("String"))
                                                                                        
                                            """)
                                            .foregroundColor(.white)
                                            Spacer()
                                        }
                                            .padding(.leading,10)
                                            .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                            .cornerRadius(10)
                                            .shadow(radius: 10)
                                            .padding(1)
                                            .background(.black)
                                            .cornerRadius(10)
                                        Spacer(minLength: 20)
                                    }
                                }
                                
                                Text("Nun kann die Variable \(snakeCaseModifier("userBegrüssung:")) nur noch mit einem String deklariert werden z.B so:")
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                
                                ZStack {
                                    HStack {
                                        Spacer(minLength: 20)
                                        HStack {
                                        Text("""
                                            
                                            \(snakeCaseModifier("userBegrüssung = "))\(stringModifier("\"Hallo\""))
                                                                                        
                                            """)
                                            .foregroundColor(.white)
                                            Spacer()
                                        }
                                            .padding(.leading,10)
                                            .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                            .cornerRadius(10)
                                            .shadow(radius: 10)
                                            .padding(1)
                                            .background(.black)
                                            .cornerRadius(10)
                                        Spacer(minLength: 20)
                                    }
                                }
                                
                                Text("Das macht vorallem dann Sinn wenn man nicht will, dass die Variable in Zukunft zu einem anderen Typen geändert werden kann. Es gibt die folgenden Typen: \(typeModifier("String")) (Zeichenketten, bsp: \(stringModifier("\"Hi\""))), \(typeModifier("Character")) (Einzelne Zeichen, bsp: \(stringModifier("\"A\""))), \(typeModifier("Int")) (ganze Zahlen, bsp: \(numberModifier("10"))), \(typeModifier("Float")) (Zahl mit max. 6 Nachkommastellen, bsp: \(numberModifier("0.33..."))), \(typeModifier("Double")) (Zahl mit max. 15 Nachkommastellen, bsp: \(numberModifier("0.33..."))) und \(typeModifier("Bool")) (Wahrheitswerte (true oder false), bsp: \(structModifier("true"))).")
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                
                                Text("Würde man anstelle des rotmarkierten Strings im oberen Beispiel z.B eine Nummer, die den Typ \(typeModifier("Int")) hat, einsetzen, würde das Programm einen Error melden:")
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                
                                ZStack {
                                    HStack {
                                        Spacer(minLength: 20)
                                        HStack {
                                        Text("""
                                            
                                            \(structModifier("var"))  \(snakeCaseModifier("userBegrüssung:")) \(typeModifier("String")) \(snakeCaseModifier(" = ")) \(numberModifier("10  "))
                                                \(Image(systemName: "x.circle.fill"))Error
                                                                                        
                                            """)
                                            .foregroundColor(.white)
                                            Spacer()
                                        }
                                            .padding(.leading,10)
                                            .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                            .cornerRadius(10)
                                            .shadow(radius: 10)
                                            .padding(1)
                                            .background(.black)
                                            .cornerRadius(10)
                                        Spacer(minLength: 20)
                                    }
                                } //Beispiel-Programmierung
                                .padding(.bottom)
                                
                                Text("Werte in der Konsole ausgeben")
                                    .font(.system(size: 25))
                                    .padding()
                                
                                Text("Um Werte in der Konsole (ein Textfenster in Xcode) auszugeben, benötigen wir die Funktion: \(funcModifier("print()")), wenn wir nun z.B den String \(stringModifier("\"Hallo ich bin die Konsole\"")) als Input in die Klammern setzen, ...")
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                
                                ZStack {
                                    HStack {
                                        Spacer(minLength: 20)
                                        HStack {
                                        Text("""
                                            
                                            \(funcModifier("print"))(\(stringModifier("\"Hallo ich bin die Konsole\"")))
                                                                                        
                                            """)
                                            .foregroundColor(.white)
                                            Spacer()
                                        }
                                            .padding(.leading,10)
                                            .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                            .cornerRadius(10)
                                            .shadow(radius: 10)
                                            .padding(1)
                                            .background(.black)
                                            .cornerRadius(10)
                                        Spacer(minLength: 20)
                                    }
                                } // Programmfeld
                                
                                Text("... wird dieser Wert in der Konsole als Output angezeigt:")
                                    .padding()
                                GeometryReader { geometry in
                                    ZStack(alignment: .leading) {
                                        Rectangle()
                                            .frame(width: geometry.size.width - 35, height: 100)
                                            .foregroundColor(.black)
                                            .padding(13)
                                            .padding(.horizontal, 4)
                                            .cornerRadius(0)
                                            .shadow(color: .white, radius: 5)
                                        VStack {
                                            HStack {
                                                Image(systemName: "stop.fill")
                                                    .padding(.leading, 30)
                                                    .foregroundColor(.gray)
                                                Image(systemName: "play.fill")
                                                    .foregroundColor(.white)
                                                Spacer()
                                            }
                                            .padding(.bottom, 4)
                                            HStack {
                                                Text("\(snakeCaseModifier("Hallo ich bin die Konsole"))")
                                                    .foregroundStyle(.white)
                                                    .padding(.leading, 30)
                                                Spacer()
                                            }
                                            .padding(.bottom, 30)
                                        }
                                    }
                                    .frame(width: geometry.size.width, height: 100)
                                } // Konsole
                                .padding(.bottom, 100)
                                
                                Text("Anstatt den Wert direkt in die \(funcModifier("print"))-Funktion zu geben, kann man diesen stattdessen zuerst in einer Variablen oder Konstanten speichern und diese anschliessend \"printen\":")
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                
                                ZStack {
                                    HStack {
                                        Spacer(minLength: 20)
                                        HStack {
                                        Text("""
                                            
                                            \(structModifier("var")) \(snakeCaseModifier("userPunktzahl = ")) \(numberModifier("10 + 2 * 5  "))
                                            \(funcModifier("print"))(\(snakeCaseModifier("userPunktzahl")))
                                                                                        
                                            """)
                                            .foregroundColor(.white)
                                            Spacer()
                                        }
                                            .padding(.leading,10)
                                            .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                            .cornerRadius(10)
                                            .shadow(radius: 10)
                                            .padding(1)
                                            .background(.black)
                                            .cornerRadius(10)
                                        Spacer(minLength: 20)
                                    }
                                }
                                
                                Text("In der Variablen, wird das Ergebnis der oben dargestellten Rechnung (also \(numberModifier("20"))) gespeichert. Durch das Einsetzen der Variable in die \(funcModifier("print"))-Funktion wird also folgendes in der Konsole ausgegeben:")
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                
                                GeometryReader { geometry in
                                    ZStack(alignment: .leading) {
                                        Rectangle()
                                            .frame(width: geometry.size.width - 35, height: 100)
                                            .foregroundColor(.black)
                                            .padding(13)
                                            .padding(.horizontal, 4)
                                            .cornerRadius(0)
                                            .shadow(color: .white, radius: 5)
                                        VStack {
                                            HStack {
                                                Image(systemName: "stop.fill")
                                                    .padding(.leading, 30)
                                                    .foregroundColor(.gray)
                                                Image(systemName: "play.fill")
                                                    .foregroundColor(.white)
                                                Spacer()
                                            }
                                            .padding(.bottom, 4)
                                            HStack {
                                                Text("\(snakeCaseModifier("20"))")
                                                    .foregroundStyle(.white)
                                                    .padding(.leading, 30)
                                                Spacer()
                                            }
                                            .padding(.bottom, 30)
                                        }
                                    }
                                    .frame(width: geometry.size.width, height: 100)
                                } // Konsole
                                .padding(.bottom, 100)
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.cyan)
                                        .padding(.horizontal)
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.cyan)
                                        .opacity(0.1)
                                        .padding(.horizontal)
                                    
                                    VStack {
                                        HStack {
                                            Text("Aufgabe")
                                                .foregroundColor(.cyan)
                                                .padding(.horizontal, 30)
                                                .padding(.vertical, 10)
                                            Spacer()
                                        }
                                        HStack(){
                                            TextField("    ?", text: $txtValue2)
                                                .textFieldStyle(.roundedBorder)
                                                .frame(width: 60, height: 20)
                                                .padding(.leading, 30)
                                                .onChange(of: txtValue2) { newValue in
                                                    let filtered = newValue.filter { !$0.isWhitespace }
                                                    if filtered != newValue {
                                                        txtValue2 = filtered
                                                    }
                                                    
                                                }
                                            Text("\(snakeCaseModifier("planetenAnzahl")) )")
                                                .padding(.trailing)
                                            
                                            if answer2 == true {
                                                
                                                Text(Image(systemName: "checkmark"))
                                                    .foregroundColor(.green)
                                                
                                            } else if answer2 == false{
                                                
                                                Text(Image(systemName: "xmark"))
                                                    .foregroundColor(.red)
                                                
                                            }
                                            Spacer()
                                            Spacer()
                                        }
                                        
                                        .padding(.vertical, 20)
                                        
                                        GeometryReader { geometry in
                                            ZStack(alignment: .center) {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .frame(width: geometry.size.width - 60, height: 100)
                                                    .foregroundColor(.black)
                                                    .padding(13)
                                                    .padding(.horizontal, 4)
                                                    .shadow(color: .white, radius: 5)
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(.cyan.opacity(0.1), lineWidth: 4)
                                                    .frame(width: geometry.size.width - 60, height: 100)
                                                    .padding(13)
                                                    .padding(.horizontal, 4)
                                                    .shadow(color: .cyan.opacity(1), radius: 5)
                                                VStack {
                                                    
                                                    if answer2 == true {
                                                        HStack {
                                                            Image(systemName: "stop.fill")
                                                                .padding(.leading, 42)
                                                                .foregroundColor(.gray)
                                                            Image(systemName: "play.fill")
                                                                .foregroundColor(.white)
                                                            Spacer()
                                                        }
                                                        .padding(.bottom, 4)
                                                    } else {
                                                        HStack {
                                                            Image(systemName: "play.fill")
                                                                .padding(.leading, 42)
                                                                .foregroundColor(.white)
                                                            Spacer()
                                                        }
                                                        .padding(.bottom, 4)
                                                    }
                                                    HStack {
                                                        if answer2 == true {
                                                            Text("\(snakeCaseModifier("8"))")
                                                                .foregroundStyle(.white)
                                                                .padding(.leading, 42)
                                                        } else {
                                                            Text("\(snakeCaseModifier("8"))")
                                                                .opacity(0)
                                                                .padding(.leading, 42)
                                                        }
                                                        Spacer()
                                                    }
                                                    .padding(.bottom, 30)
                                                }
                                            }
                                            .frame(width: geometry.size.width, height: 100)
                                        } // Konsole
                                        .padding(.bottom, 110)
                                        
                                        Button {
                                            
                                            withAnimation(.easeIn(duration:0.5)) {
                                                rectangleIsVisible = true
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                withAnimation(.easeOut(duration:0.5)) {
                                                    rectangleIsVisible = false
                                                }
                                            }
                                            
                                            
                                            if txtValue2 == "Print(" || txtValue2 == "print(" {
                                                answer2 = true
                                            }
                                            else {
                                                answer2 = false
                                            }
                                        } label: {
                                            
                                            HStack{
                                                Spacer()
                                                
                                                Text("Fertig")
                                                    .bold()
                                                    .padding()
                                                
                                                Spacer()
                                            }
                                            .padding(10)
                                            
                                            
                                        }
                                        
                                    }
                                    if answer2 == true {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .opacity(0.5)
                                                .foregroundColor(.green)
                                                .padding(.horizontal)
                                            Text(Image(systemName: "checkmark"))
                                                .font(.system(size: 100))
                                                .foregroundColor(.white)
                                                .opacity(0.8)
                                        }
                                        .opacity(rectangleIsVisible ? 1 : 0)
                                    } else if answer2 == false {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .opacity(0.5)
                                                .foregroundColor(.red)
                                                .padding(.horizontal)
                                            Text(Image(systemName: "xmark"))
                                                .font(.system(size: 100))
                                                .foregroundColor(.white)
                                                .opacity(0.8)
                                        }
                                        .opacity(rectangleIsVisible ? 1 : 0)
                                    }
                                } // Aufgabenprogrammierung
                                .padding(.top)
                                HStack{
                                    Text("\(underlineModifier("Erklärung:")) Fülle die Lücke so, dass die Nummer 8 in der Konsole ausgegeben wird.")
                                        .padding(.bottom)
                                        .padding(.horizontal)
                                        .font(.system(size: 14))
                                    Spacer()
                                }
                                .padding(.bottom)
                                
                                Text("Dank der String Interpolation können wir die Punktzahl mit einer Nachricht ausgeben, um den Kontext der Nummer \(numberModifier("20")) in der Konsohle deutlich zu machen. Das tun wir mit einem Backslash gefolgt von zwei Klammern in welche wir die Variable einsetzen ( so: \("\\()") ):")
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                
                                ZStack {
                                    HStack {
                                        Spacer(minLength: 20)
                                        ScrollView(.horizontal,showsIndicators: true) {
                                        Text("""
                                            
                                            \(funcModifier("print"))( \(stringModifier("\"Deine Punktzal ist ")) \(snakeCaseModifier("\\(userPunktzahl)"))\(stringModifier("\"")))
                                                                                        
                                            """)
                                            .foregroundColor(.white)
                                        }
                                            .padding(.leading,10)
                                            .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                            .cornerRadius(10)
                                            .shadow(radius: 10)
                                            .padding(1)
                                            .background(.black)
                                            .cornerRadius(10)
                                        Spacer(minLength: 20)
                                    }
                                }
                                
                                Text("In der Konsole wird folgendes angezeigt:")
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                
                                GeometryReader { geometry in
                                    ZStack(alignment: .leading) {
                                        Rectangle()
                                            .frame(width: geometry.size.width - 35, height: 100)
                                            .foregroundColor(.black)
                                            .padding(13)
                                            .padding(.horizontal, 4)
                                            .cornerRadius(0)
                                            .shadow(color: .white, radius: 5)
                                        VStack {
                                            HStack {
                                                Image(systemName: "stop.fill")
                                                    .padding(.leading, 30)
                                                    .foregroundColor(.gray)
                                                Image(systemName: "play.fill")
                                                    .foregroundColor(.white)
                                                Spacer()
                                            }
                                            .padding(.bottom, 4)
                                            HStack {
                                                Text("\(snakeCaseModifier("Deine Punktzahl ist 20"))")
                                                    .foregroundStyle(.white)
                                                    .padding(.leading, 30)
                                                Spacer()
                                            }
                                            .padding(.bottom, 30)
                                        }
                                    }
                                    .frame(width: geometry.size.width, height: 100)
                                } // Konsole
                                .padding(.bottom, 100)
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.cyan)
                                        .padding(.horizontal)
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.cyan)
                                        .opacity(0.1)
                                        .padding(.horizontal)
                                    
                                    VStack {
                                        HStack {
                                            Text("Aufgabe")
                                                .foregroundColor(.cyan)
                                                .padding(.horizontal, 30)
                                                .padding(.vertical, 10)
                                            Spacer()
                                        }
                                        VStack(spacing: 0) {
                                            HStack {
                                                Text("\(snakeCaseModifier("print(\"Unser Sonnensystem beinhalt-")) ")
                                                    .padding(.leading, 30)
                                                    .padding(.bottom, 5)
                                                Spacer()
                                            }
                                            HStack(){
                                                Text("\(snakeCaseModifier("et")) ")
                                                    .padding(.leading, 30)
                                                    .padding(.bottom, 5)
                                                TextField("              ?", text: $txtValue3)
                                                    .textFieldStyle(.roundedBorder)
                                                    .frame(width: 155, height: 20)
                                                    .onChange(of: txtValue3) { newValue in
                                                        let filtered = newValue.filter { !$0.isWhitespace }
                                                        if filtered != newValue {
                                                            txtValue3 = filtered
                                                        }
                                                        
                                                    }
                                                Text("\(snakeCaseModifier("Planeten.\"")))")
                                                Spacer()
                                                if answer3 == true {
                                                    
                                                    Text(Image(systemName: "checkmark"))
                                                        .foregroundColor(.green)
                                                    
                                                } else if answer3 == false{
                                                    
                                                    Text(Image(systemName: "xmark"))
                                                        .foregroundColor(.red)
                                                    
                                                }
                                                Spacer()
                                                Spacer()
                                            }
                                            
                                            
                                        }
                                        .padding(.vertical, 20)
                                        
                                        GeometryReader { geometry in
                                            ZStack(alignment: .center) {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .frame(width: geometry.size.width - 60, height: 100)
                                                    .foregroundColor(.black)
                                                    .padding(13)
                                                    .padding(.horizontal, 4)
                                                    .shadow(color: .white, radius: 5)
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(.cyan.opacity(0.1), lineWidth: 4)
                                                    .frame(width: geometry.size.width - 60, height: 100)
                                                    .padding(13)
                                                    .padding(.horizontal, 4)
                                                    .shadow(color: .cyan.opacity(1), radius: 5)
                                                VStack {
                                                    if answer3 == true {
                                                        HStack {
                                                            Image(systemName: "stop.fill")
                                                                .padding(.leading, 42)
                                                                .foregroundColor(.gray)
                                                            Image(systemName: "play.fill")
                                                                .foregroundColor(.white)
                                                            Spacer()
                                                        }
                                                        .padding(.top,18)
                                                        .padding(.bottom, 4)
                                                    } else {
                                                        HStack {
                                                            Image(systemName: "play.fill")
                                                                .padding(.leading, 42)
                                                                .foregroundColor(.white)
                                                            Spacer()
                                                        }
                                                        .padding(.top,18)
                                                        .padding(.bottom, 4)
                                                    }
                                                    
                                                    HStack {
                                                        if answer3 == true {
                                                            Text("\(snakeCaseModifier("Unser Sonnensystem beinhaltet 8 Planeten."))")
                                                                .foregroundStyle(.white)
                                                                .padding(.leading, 42)
                                                        } else {
                                                            Text("\(snakeCaseModifier("Unser Sonnensystem beinhaltet 8 Planeten."))")
                                                                .opacity(0)
                                                                .padding(.leading, 42)
                                                        }
                                                        Spacer()
                                                    }
                                                    .padding(.bottom, 30)
                                                }
                                            }
                                            .frame(width: geometry.size.width, height: 100)
                                        } // Konsole
                                        .padding(.bottom, 110)
                                        
                                        Button {
                                            
                                            withAnimation(.easeIn(duration:0.5)) {
                                                rectangleIsVisible = true
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                withAnimation(.easeOut(duration:0.5)) {
                                                    rectangleIsVisible = false
                                                }
                                            }
                                            
                                            
                                            if txtValue3 == "\\(planetenAnzahl)" {
                                                answer3 = true
                                            }
                                            else {
                                                answer3 = false
                                            }
                                        } label: {
                                            
                                            HStack{
                                                Spacer()
                                                
                                                Text("Fertig")
                                                    .bold()
                                                    .padding()
                                                Spacer()
                                            }
                                            .padding(10)
                                            
                                            
                                        }
                                        
                                    }
                                    if answer3 == true {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .opacity(0.5)
                                                .foregroundColor(.green)
                                                .padding(.horizontal)
                                            Text(Image(systemName: "checkmark"))
                                                .font(.system(size: 100))
                                                .foregroundColor(.white)
                                                .opacity(0.8)
                                        }
                                        .opacity(rectangleIsVisible ? 1 : 0)
                                    } else if answer3 == false {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .opacity(0.5)
                                                .foregroundColor(.red)
                                                .padding(.horizontal)
                                            Text(Image(systemName: "xmark"))
                                                .font(.system(size: 100))
                                                .foregroundColor(.white)
                                                .opacity(0.8)
                                        }
                                        .opacity(rectangleIsVisible ? 1 : 0)
                                    }
                                } // Aufgabenprogrammierung
                                .padding(.top)
                                HStack{
                                    Text("\(underlineModifier("Erklärung:")) Fülle die Lücke so, dass die in planetenAnzahl gespeicherte Nummer zusammen mit dem Text in der Konsole ausgegeben wird.")
                                        .padding(.bottom)
                                        .padding(.horizontal)
                                        .font(.system(size: 14))
                                    Spacer()
                                }
                                .padding(.bottom)
                                Text("Kommentare")
                                    .font(.system(size: 25))
                                    .padding()
                                
                                Text("Wie der Name bereits vermuten lässt, sind Kommentare Texte, welche nicht ausgeführt werden, also nur als Notiz dienen. Kommentare welche man mit zwei Schrägstrichen (//) beginnt, werden also vom Programm ignoriert. Das könnte in etwa so aussehen:")
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                
                                ZStack {
                                    HStack {
                                        Spacer(minLength: 20)
                                        HStack {
                                        Text("""
                                            
                                            \(funcModifier("print"))( \(stringModifier("\"Hallo\"")))
                                            \(commentModifier("// printet Hallo"))
                                                                                        
                                            """)
                                            .foregroundColor(.white)
                                            Spacer()
                                        }
                                            .padding(.leading,10)
                                            .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                            .cornerRadius(10)
                                            .shadow(radius: 10)
                                            .padding(1)
                                            .background(.black)
                                            .cornerRadius(10)
                                        Spacer(minLength: 20)
                                    }
                                }
                                
                                Text("Die beiden Schrägstriche (//), können auch dazu genutzt werden bestimmte Stücke von Code auszukommentieren. Das bedeutet, dass man beispielsweise eine Zeile Code mit den beiden Schrägstrichen markiert, um sie (oft kurzfristig) auszugrauen und somit funktionslos zu machen:")
                                    .padding()
                                
                                
                                ZStack {
                                    HStack {
                                        Spacer(minLength: 20)
                                        HStack {
                                        Text("""
                                            
                                            \(commentModifier("// print(\"Hallo\")"))
                                            \(commentModifier("// printet nichts mehr"))
                                                                                        
                                            """)
                                            .foregroundColor(.white)
                                            Spacer()
                                        }
                                            .padding(.leading,10)
                                            .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                            .cornerRadius(10)
                                            .shadow(radius: 10)
                                            .padding(1)
                                            .background(.black)
                                            .cornerRadius(10)
                                        Spacer(minLength: 20)
                                    }
                                }
                            
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.cyan)
                                        .padding(.horizontal)
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.cyan)
                                        .opacity(0.1)
                                        .padding(.horizontal)
                                    
                                    VStack {
                                        HStack {
                                            Text("Aufgabe")
                                                .foregroundColor(.cyan)
                                                .padding(.horizontal, 30)
                                                .padding(.vertical, 10)
                                            Spacer()
                                        }
                                        HStack(){
                                            TextField(" ?", text: $txtValue4)
                                                .textFieldStyle(.roundedBorder)
                                                .frame(width: 30, height: 20)
                                                .padding(.leading, 30)
                                                .onChange(of: txtValue4) { newValue in
                                                    let filtered = newValue.filter { !$0.isWhitespace }
                                                    if filtered != newValue {
                                                        txtValue4 = filtered
                                                    }
                                                    
                                                }
                                            Text("\(snakeCaseModifier("print(\"defekteVariable\")"))")
                                                .padding(.trailing)
                                            
                                            if answer4 == true {
                                                
                                                Text(Image(systemName: "checkmark"))
                                                    .foregroundColor(.green)
                                                
                                            } else if answer4 == false{
                                                
                                                Text(Image(systemName: "xmark"))
                                                    .foregroundColor(.red)
                                                
                                            }
                                            Spacer()
                                            Spacer()
                                        }
                                        
                                        .padding(.vertical, 20)
                                        
                                        GeometryReader { geometry in
                                            ZStack(alignment: .center) {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .frame(width: geometry.size.width - 60, height: 100)
                                                    .foregroundColor(.black)
                                                    .padding(13)
                                                    .padding(.horizontal, 4)
                                                    .shadow(color: .white, radius: 5)
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(.cyan.opacity(0.1), lineWidth: 4)
                                                    .frame(width: geometry.size.width - 60, height: 100)
                                                    .padding(13)
                                                    .padding(.horizontal, 4)
                                                    .shadow(color: .cyan.opacity(1), radius: 5)
                                                VStack {
                                                    if answer4 == true {
                                                        HStack {
                                                            Image(systemName: "stop.fill")
                                                                .padding(.leading, 42)
                                                                .foregroundColor(.gray)
                                                            Image(systemName: "play.fill")
                                                                .foregroundColor(.white)
                                                            Spacer()
                                                        }
                                                        .padding(.bottom, 4)
                                                    } else {
                                                        HStack {
                                                            Image(systemName: "play.fill")
                                                                .padding(.leading, 42)
                                                                .foregroundColor(.white)
                                                            Spacer()
                                                        }
                                                        .padding(.bottom, 4)
                                                    }
                                                    HStack {
                                                        if answer4 == true {
                                                            Text("\(snakeCaseModifier("¨-.,idxybuajs"))")
                                                                .opacity(0)
                                                                .foregroundStyle(.white)
                                                                .padding(.leading, 42)
                                                        } else {
                                                            Text("\(snakeCaseModifier("¨-.,idxyuajs"))")
                                                                .foregroundStyle(.white)
                                                                .padding(.leading, 42)
                                                        }
                                                        Spacer()
                                                    }
                                                    .padding(.bottom, 30)
                                                }
                                            }
                                            .frame(width: geometry.size.width, height: 100)
                                        } // Konsole
                                        .padding(.bottom, 110)
                                        
                                        Button {
                                            
                                            withAnimation(.easeIn(duration:0.5)) {
                                                rectangleIsVisible = true
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                withAnimation(.easeOut(duration:0.5)) {
                                                    rectangleIsVisible = false
                                                }
                                            }
                                            
                                            
                                            if txtValue4 == "//" {
                                                answer4 = true
                                            }
                                            else {
                                                answer4 = false
                                            }
                                        } label: {
                                            
                                            HStack{
                                                Spacer()
                                                
                                                Text("Fertig")
                                                    .bold()
                                                    .padding()
                                                Spacer()
                                            }
                                            .padding(10)
                                            
                                            
                                        }
                                        
                                    }
                                    if answer4 == true {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .opacity(0.5)
                                                .foregroundColor(.green)
                                                .padding(.horizontal)
                                            Text(Image(systemName: "checkmark"))
                                                .font(.system(size: 100))
                                                .foregroundColor(.white)
                                                .opacity(0.8)
                                        }
                                        .opacity(rectangleIsVisible ? 1 : 0)
                                    } else if answer4 == false {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .opacity(0.5)
                                                .foregroundColor(.red)
                                                .padding(.horizontal)
                                            Text(Image(systemName: "xmark"))
                                                .font(.system(size: 100))
                                                .foregroundColor(.white)
                                                .opacity(0.8)
                                        }
                                        .opacity(rectangleIsVisible ? 1 : 0)
                                    }
                                } // Aufgabenprogrammierung
                                .padding(.top)
                                
                                Text("\(underlineModifier("Erklärung:")) Fülle die Lücke so, dass die defekteVariable, nicht mehr geprintet wird.")
                                    .padding(.bottom)
                                    .padding(.horizontal)
                                    .font(.system(size: 14))
                                
                                Text("Typinferenz")
                                    .font(.system(size: 25))
                                    .padding()
                            
                            Text("""
                                 Wir haben gelernt, dass man den Typen einer Konstanten oder Variablen deklarieren kann. Das ist jedoch in den seltensten Fällen nötig, denn die Programmiersprache Swift, nutzt die sogennante Typinferenz. Diese, auch Typableitung genannt, erkennt (anhand des Wertes mit welchem die Variable/Konstante deklariert wurde), welchem Typen sie die Variablen/Konstanten zuordnen muss.
                                 
                                 Deklariert man beispielsweise die Konstante \(snakeCaseModifier("ganzeZahl")) mit dem Wert \(numberModifier("3")), nimmt das Programm an, dass man die Konstante dem Typen \(typeModifier("Int")) zuordnen wollte, weil die Zahl \(numberModifier("3")) wie ein Integer "aussieht":
                                 """)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                            .padding(.bottom)
                            
                            ZStack {
                                HStack {
                                    Spacer(minLength: 20)
                                    ScrollView(.horizontal, showsIndicators: true) {
                                    Text("""
                                        
                                        \(structModifier("let"))  \(snakeCaseModifier("ganzeZahl = ")) \(numberModifier("3"))
                                        \(commentModifier("// das Programm ordnet die Variable dem Typen Int zu (let ganzeZahl: Int)"))
                                                                                    
                                        """)
                                        .foregroundColor(.white)
                                    }
                                        .padding(.leading,10)
                                        .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                        .padding(1)
                                        .background(.black)
                                        .cornerRadius(10)
                                    Spacer(minLength: 20)
                                }
                                
                            }
                            
                            Text("Dasselbe gilt logischerweise auch für andere Typen wie z.B \(typeModifier("Double")), welcher Gleitkommazahlen speichert:")
                                .multilineTextAlignment(.leading)
                                .padding()
                            
                            ZStack {
                                HStack {
                                    Spacer(minLength: 20)
                                    ScrollView(.horizontal, showsIndicators: true) {
                                    Text("""
                                        
                                        \(structModifier("let"))  \(snakeCaseModifier("gleitkommaZahl = ")) \(numberModifier("0.14159"))
                                        \(commentModifier("// das Programm ordnet die Variable dem Typen Double zu (let gleitkommaZahl: Double)"))
                                                                                    
                                        """)
                                        .foregroundColor(.white)
                                    }
                                        .padding(.leading,10)
                                        .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                        .padding(1)
                                        .background(.black)
                                        .cornerRadius(10)
                                    Spacer(minLength: 20)
                                }
                                
                            }
                            
                            Text("Integer- und Gleitkommazahlen- Umwandlung")
                                .font(.system(size: 25))
                                .padding()
                            
                            Text("Wir wollen jetzt die Konstanten \(snakeCaseModifier("ganzeZahl")) und \(snakeCaseModifier("gleitkommaZahl")) miteinander addieren. Nun haben wir jedoch wegen der Typinferenz ein kleines Problem, denn die Konstante \(snakeCaseModifier("ganzeZahl")) ist vom Typ \(typeModifier("Int")), während \(snakeCaseModifier("gleitkommaZahl")) vom Typ \(typeModifier("Double")) ist. Werte von verschiedenen Typen können nicht einfach so zusammen addiert werden. Deshalb wandeln wir den Typen \(typeModifier("Int")) der Konstanten \(snakeCaseModifier("ganzeZahl")), in den Typen \(typeModifier("Double")) um. Jetzt sind beide Werte vom selben Typ und können zusammenaddiert werden. Das sieht in der Praxis folgendermassen aus:")
                                .padding(.bottom)
                                .padding(.horizontal)
                            
                            ZStack {
                                HStack {
                                    Spacer(minLength: 20)
                                    ScrollView(.horizontal, showsIndicators: true) {
                                    Text("""
                                        
                                        \(structModifier("let"))  \(snakeCaseModifier("pi = ")) \(typeModifier("Double"))(\(snakeCaseModifier("ganzeZahl"))) \(snakeCaseModifier("+ gleitkommaZahl"))
                                        \(funcModifier("print"))\(snakeCaseModifier("(pi)"))
                                        
                                        """)
                                        .foregroundColor(.white)
                                    }
                                        .padding(.leading,10)
                                        .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                        .padding(1)
                                        .background(.black)
                                        .cornerRadius(10)
                                    Spacer(minLength: 20)
                                }
                                
                            }
                            
                            Text("Daraus folgt:")
                                .padding()
                            
                            GeometryReader { geometry in
                                ZStack(alignment: .leading) {
                                    Rectangle()
                                        .frame(width: geometry.size.width - 35, height: 100)
                                        .foregroundColor(.black)
                                        .padding(13)
                                        .padding(.horizontal, 4)
                                        .cornerRadius(0)
                                        .shadow(color: .white, radius: 5)
                                    VStack {
                                        HStack {
                                            Image(systemName: "stop.fill")
                                                .padding(.leading, 30)
                                                .foregroundColor(.gray)
                                            Image(systemName: "play.fill")
                                                .foregroundColor(.white)
                                            Spacer()
                                        }
                                        .padding(.bottom, 4)
                                        HStack {
                                            Text("\(snakeCaseModifier("3.14159"))")
                                                .foregroundStyle(.white)
                                                .padding(.leading, 30)
                                            Spacer()
                                        }
                                        .padding(.bottom, 30)
                                    }
                                }
                                .frame(width: geometry.size.width, height: 100)
                            } // Konsole
                            .padding(.bottom, 100)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.cyan)
                                    .padding(.horizontal)
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.cyan)
                                    .opacity(0.1)
                                    .padding(.horizontal)
                                
                                VStack {
                                    HStack {
                                        Text("Aufgabe")
                                            .foregroundColor(.cyan)
                                            .padding(.horizontal, 30)
                                            .padding(.vertical, 10)
                                        Spacer()
                                    }
                                    HStack {
                                            Text("\(structModifier("var")) \(snakeCaseModifier("acht = "))\(numberModifier("8"))   \(commentModifier("// Vom Typ Int"))")
                                            .padding(.leading, 30)
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("\(structModifier("var")) \(snakeCaseModifier("zwölf = "))\(stringModifier("\"12\""))   \(commentModifier("// Vom Typ String"))")
                                            .padding(.leading, 30)
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("\(structModifier("let")) \(snakeCaseModifier("zwanzig = acht +"))")
                                            .padding(.leading, 30)
                                        
                                        TextField("  ?", text: $txtValue5)
                                            .textFieldStyle(.roundedBorder)
                                            .frame(width: 40, height: 20)
                                            .onChange(of: txtValue5) { newValue in
                                                let filtered = newValue.filter { !$0.isWhitespace }
                                                if filtered != newValue {
                                                    txtValue5 = filtered
                                                }
                                                
                                            }
                                        Text("\(snakeCaseModifier("(zwölf)!"))")
                                            .padding(.leading, -10)
                                        if answer5 == true {
                                            
                                            Text(Image(systemName: "checkmark"))
                                                .foregroundColor(.green)
                                            
                                        } else if answer5 == false{
                                            
                                            Text(Image(systemName: "xmark"))
                                                .foregroundColor(.red)
                                            
                                        }
                                        Spacer()
                                        Spacer()
                                    }
                                    .padding(.vertical, 20)
                                    
                                    HStack {
                                        Text("\(funcModifier("print"))\(snakeCaseModifier("(zwanzig)"))")
                                            .padding(.leading, 30)
                                        
                                        Spacer()
                                    }
                                    .padding(.bottom)
                                    
                                    GeometryReader { geometry in
                                        ZStack(alignment: .center) {
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: geometry.size.width - 60, height: 100)
                                                .foregroundColor(.black)
                                                .padding(13)
                                                .padding(.horizontal, 4)
                                                .shadow(color: .white, radius: 5)
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.cyan.opacity(0.1), lineWidth: 4)
                                                .frame(width: geometry.size.width - 60, height: 100)
                                                .padding(13)
                                                .padding(.horizontal, 4)
                                                .shadow(color: .cyan.opacity(1), radius: 5)
                                            VStack {
                                                if answer5 == true {
                                                    HStack {
                                                        Image(systemName: "stop.fill")
                                                            .padding(.leading, 42)
                                                            .foregroundColor(.gray)
                                                        Image(systemName: "play.fill")
                                                            .foregroundColor(.white)
                                                        Spacer()
                                                    }
                                                    .padding(.bottom, 4)
                                                } else {
                                                    HStack {
                                                        Image(systemName: "play.fill")
                                                            .padding(.leading, 42)
                                                            .foregroundColor(.white)
                                                        Spacer()
                                                    }
                                                    .padding(.bottom, 4)
                                                }
                                                HStack {
                                                    if answer5 == true {
                                                        Text("\(snakeCaseModifier("20"))")
                                                            .opacity(1)
                                                            .foregroundStyle(.white)
                                                            .padding(.leading, 42)
                                                    } else {
                                                        Text("\(snakeCaseModifier("20"))")
                                                            .foregroundStyle(.white)
                                                            .opacity(0)
                                                            .padding(.leading, 42)
                                                    }
                                                    Spacer()
                                                }
                                                .padding(.bottom, 30)
                                            }
                                        }
                                        .frame(width: geometry.size.width, height: 100)
                                    } // Konsole
                                    .padding(.bottom, 110)
                                    
                                    Button {
                                        
                                        withAnimation(.easeIn(duration:0.5)) {
                                            rectangleIsVisible = true
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            withAnimation(.easeOut(duration:0.5)) {
                                                rectangleIsVisible = false
                                            }
                                        }
                                        
                                        
                                        if txtValue5 == "Int" {
                                            answer5 = true
                                        }
                                        else {
                                            answer5 = false
                                        }
                                    } label: {
                                        
                                        HStack{
                                            Spacer()
                                            
                                            Text("Fertig")
                                                .bold()
                                                .padding()
                                            Spacer()
                                        }
                                        .padding(10)
                                        
                                        
                                    }
                                    
                                }
                                if answer5 == true {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .opacity(0.5)
                                            .foregroundColor(.green)
                                            .padding(.horizontal)
                                        Text(Image(systemName: "checkmark"))
                                            .font(.system(size: 100))
                                            .foregroundColor(.white)
                                            .opacity(0.8)
                                    }
                                    .opacity(rectangleIsVisible ? 1 : 0)
                                } else if answer5 == false {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .opacity(0.5)
                                            .foregroundColor(.red)
                                            .padding(.horizontal)
                                        Text(Image(systemName: "xmark"))
                                            .font(.system(size: 100))
                                            .foregroundColor(.white)
                                            .opacity(0.8)
                                    }
                                    .opacity(rectangleIsVisible ? 1 : 0)
                                }
                            } // Aufgabenprogrammierung
                            .padding(.top)
                            
                            Text("\(underlineModifier("Erklärung:")) Fülle die Lücke so, dass die Variable acht, mit der Variable zwölf, zusammenaddiert werden kann. Mache dir dazu die Kommentare in der Aufgabe zunutze (lass dich nicht von dem Ausrufezeichen irritieren, wir werden später noch lernen wozu man es hier braucht).")
                                .padding(.bottom)
                                .padding(.horizontal)
                                .font(.system(size: 14))
                            
                            Text("Booleans")
                                .font(.system(size: 25))
                                .padding()
                            
                            Text("Wie wir bereits gelernt haben, gibt es den Typen Bool, wessen Werte entweder true (wahr) oder false (falsch) sein können. Ein Beispiel soll den Nutzen dieses Typs veranschaulichen:")
                                .padding(.bottom)
                                .padding(.horizontal)
                            
                            ZStack {
                                HStack {
                                    Spacer(minLength: 20)
                                    HStack {
                                    Text("""
                                        
                                        \(structModifier("let")) \(snakeCaseModifier("rotIstEineFarbe = ")) \(structModifier("true"))
                                        \(structModifier("let")) \(snakeCaseModifier("grünIstEineZahl = ")) \(structModifier("false"))
                                        
                                        """)
                                        .foregroundColor(.white)
                                        Spacer()
                                    }
                                        .padding(.leading,10)
                                        .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                        .padding(1)
                                        .background(.black)
                                        .cornerRadius(10)
                                    Spacer(minLength: 20)
                                }
                                
                            }
                            
                            Text("Das Beispiel zeigt, wie wir verschiedenen Aussagen bzw. Konstanten, die Wahrheitswerte true oder false zuordnen (rot ist eine Farbe also wahr, grün ist jedoch keine Zahl also falsch). Wenn wir die beiden Konstanten printen, ...")
                                .padding()
                            
                            ZStack {
                                HStack {
                                    Spacer(minLength: 20)
                                    HStack {
                                    Text("""
                                        
                                        \(funcModifier("print"))\(snakeCaseModifier("(rotIstEineFarbe)"))
                                        \(funcModifier("print"))\(snakeCaseModifier("(grünIstEineZahl)"))
                                        
                                        """)
                                        .foregroundColor(.white)
                                        Spacer()
                                    }
                                        .padding(.leading,10)
                                        .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                        .padding(1)
                                        .background(.black)
                                        .cornerRadius(10)
                                    Spacer(minLength: 20)
                                }
                                
                            }
                            
                            Text("... werden die, in den Konstanten gespeicherten, Wahrheitswerte (in derselben Reihenfolge wie sie oben \"geprintet\" wurden) in der Konsole ausgegeben:")
                                .padding()
                            
                            GeometryReader { geometry in
                                ZStack(alignment: .leading) {
                                    Rectangle()
                                        .frame(width: geometry.size.width - 35, height: 100)
                                        .foregroundColor(.black)
                                        .padding(13)
                                        .padding(.horizontal, 4)
                                        .cornerRadius(0)
                                        .shadow(color: .white, radius: 5)
                                    VStack {
                                        HStack {
                                            Image(systemName: "stop.fill")
                                                .padding(.leading, 30)
                                                .padding(.top)
                                                .foregroundColor(.gray)
                                            Image(systemName: "play.fill")
                                                .foregroundColor(.white)
                                                .padding(.top)
                                            Spacer()
                                        }
                                        .padding(.bottom, 4)
                                        HStack {
                                            Text("""
\(snakeCaseModifier("true"))
\(snakeCaseModifier("false"))
""")
                                            .foregroundStyle(.white)
                                            .padding(.leading, 30)
                                            Spacer()
                                        }
                                        .padding(.bottom, 30)
                                    }
                                }
                                .frame(width: geometry.size.width, height: 100)
                            } // Konsole
                            .padding(.bottom, 100)
                            
                            Text("Tupel")
                                .font(.system(size: 25))
                                .padding()
                            
                            Text("Ein Tupel fässt mehrere Werte zu einem einzigen zusammen. Die darin enthaltenen Werte müssen dabei nicht vom gleichen Typ sein:")
                                .padding(.bottom)
                                .padding(.horizontal)
                            
                            ZStack {
                                HStack {
                                    Spacer(minLength: 20)
                                    ScrollView(.horizontal, showsIndicators: true) {
                                    Text("""
                                        
                                        \(structModifier("let")) \(snakeCaseModifier("userInfo = ("))\(numberModifier("10")), \(stringModifier("\"EinsamerKrieger\""))\(snakeCaseModifier(")"))
                                        
                                        """)
                                        .foregroundColor(.white)
                                    }
                                        .padding(.leading,10)
                                        .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                        .padding(1)
                                        .background(.black)
                                        .cornerRadius(10)
                                    Spacer(minLength: 20)
                                }
                                
                            }
                            
                            Text("""
Dieses Tupel fässt nun also einen Int und einen String zusammen. Man kann beliebig viele Werte von den verschiedensten Typen (oder vomselben) in ein Tupel setzen.

Ausserdem kann man die Werte eines Tupels zersetzen, indem man sie in Variablen oder Konstanten speichert:
""")
                            .padding()
                            
                            ZStack {
                                HStack {
                                    Spacer(minLength: 20)
                                    ScrollView(.horizontal, showsIndicators: true) {
                                    Text("""
                                        
                                        \(structModifier("let")) \(snakeCaseModifier("(userPunktzahl, userName"))\(snakeCaseModifier(") = userInfo"))
                                        
                                        """)
                                        .foregroundColor(.white)
                                    }
                                        .padding(.leading,10)
                                        .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                        .padding(1)
                                        .background(.black)
                                        .cornerRadius(10)
                                    Spacer(minLength: 20)
                                }
                                
                            }
                            
                            Text("""
Wenn wir nur einen Wert bräuchten, z.B nur die \(snakeCaseModifier("userPunktzahl")), dann könnten wir nach dem \(structModifier("let")) auch \(snakeCaseModifier("(userPunktzahl,")) \(structModifier("_"))\(snakeCaseModifier(")")) schreiben, wobei das \(structModifier("_")) den \(snakeCaseModifier("userName")) ignoriert, für das Beispiel nutzen wir jedoch beide Werte.

Jetzt können wir wie gewohnt auf die beiden Konstanten zugreifen, zum Beispiel mit String-Interpolation:
""")
                            .padding()
                            
                            ZStack {
                                HStack {
                                    Spacer(minLength: 20)
                                    ScrollView(.horizontal, showsIndicators: true) {
                                    Text("""
                                        
                                        \(funcModifier("print"))\(snakeCaseModifier("("))\(stringModifier("\"Die Punktzahl von "))\(snakeCaseModifier("\\(userName)")) \(stringModifier("beträgt")) \(snakeCaseModifier("\\(userPunktzahl)")) \(stringModifier("Punkte.\""))\(snakeCaseModifier(")"))
                                        
                                        """)
                                        .foregroundColor(.white)
                                    }
                                        .padding(.leading,10)
                                        .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                        .padding(1)
                                        .background(.black)
                                        .cornerRadius(10)
                                    Spacer(minLength: 20)
                                }
                                
                            }
                            
                            Text("Die Konsole gibt aus:")
                                .padding()
                            
                            GeometryReader { geometry in
                                ZStack(alignment: .leading) {
                                    Rectangle()
                                        .frame(width: geometry.size.width - 35, height: 100)
                                        .foregroundColor(.black)
                                        .padding(13)
                                        .padding(.horizontal, 4)
                                        .cornerRadius(0)
                                        .shadow(color: .white, radius: 5)
                                    VStack {
                                        HStack {
                                            Image(systemName: "stop.fill")
                                                .padding(.leading, 30)
                                                .padding(.top)
                                                .foregroundColor(.gray)
                                            Image(systemName: "play.fill")
                                                .foregroundColor(.white)
                                                .padding(.top)
                                            Spacer()
                                        }
                                        .padding(.bottom, 4)
                                        HStack {
                                            Text("\(snakeCaseModifier("Die Punktzahl von EinsamerKrieger beträgt 10 Punkte."))")
                                                .foregroundStyle(.white)
                                                .padding(.leading, 30)
                                            Spacer()
                                        }
                                        .padding(.bottom, 30)
                                    }
                                }
                                .frame(width: geometry.size.width, height: 100)
                            } // Konsole
                            .padding(.bottom, 100)
                            
                            Text("Anstelle von \(snakeCaseModifier("userName")) oder \(snakeCaseModifier("userPunktzahl")), kann man auch den Namen des Tupels gefolgt von einem Punkt gefolgt vom Index des zu verwendenden Wertes schreiben. Auf den ersten Wert eines Tupels (von links nach rechts), wird mit dem Index \(numberModifier("0")) zugegriffen, auf den zweiten mit \(numberModifier("1")) usw., also z.B:")
                                .padding()
                            
                            ZStack {
                                HStack {
                                    Spacer(minLength: 20)
                                    ScrollView(.horizontal, showsIndicators: true) {
                                    Text("""
                                        
                                        \(funcModifier("print"))\(snakeCaseModifier("("))\(stringModifier("\"Die Punktzahl von "))\(snakeCaseModifier("\\(userInfo."))\(numberModifier("0"))\(snakeCaseModifier(")")) \(stringModifier("beträgt")) \(snakeCaseModifier("\\(userInfo."))\(numberModifier("1"))\(snakeCaseModifier(")")) \(stringModifier("Punkte.\""))\(snakeCaseModifier(")"))
                                        
                                        """)
                                        .foregroundColor(.white)
                                    }
                                        .padding(.leading,10)
                                        .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                        .padding(1)
                                        .background(.black)
                                        .cornerRadius(10)
                                    Spacer(minLength: 20)
                                }
                                
                            }
                            
                            Text("Man kann die Elemente eines Tupels auch direkt benennen:")
                                .padding()
                            
                            ZStack {
                                HStack {
                                    Spacer(minLength: 20)
                                    ScrollView(.horizontal, showsIndicators: true) {
                                    Text("""
                                        
                                        \(structModifier("let")) \(snakeCaseModifier("userInfo = (userPunktzahl: "))\(numberModifier("10")), \(snakeCaseModifier("userName: "))\(stringModifier("\"EinsamerKrieger\""))\(snakeCaseModifier(")"))
                                        
                                        """)
                                        .foregroundColor(.white)
                                    }
                                        .padding(.leading,10)
                                        .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                        .padding(1)
                                        .background(.black)
                                        .cornerRadius(10)
                                    Spacer(minLength: 20)
                                }
                                
                            }
                            
                            Text("Zugegriffen auf die Elemente, wird dann wieder mit der Punktnotation, gefolgt vom Name:")
                                .padding()
                            
                            ZStack {
                                HStack {
                                    Spacer(minLength: 20)
                                    ScrollView(.horizontal, showsIndicators: true) {
                                    Text("""
                                         
                                         \(funcModifier("print"))\(snakeCaseModifier("("))\(stringModifier("\"Die Punktzahl von "))\(snakeCaseModifier("\\(userInfo."))\(snakeCaseModifier("userPunktzahl"))\(snakeCaseModifier(")")) \(stringModifier("beträgt")) \(snakeCaseModifier("\\(userInfo."))\(snakeCaseModifier("userName"))\(snakeCaseModifier(")")) \(stringModifier("Punkte.\""))\(snakeCaseModifier(")"))
                                        
                                        """)
                                        .foregroundColor(.white)
                                    }
                                        .padding(.leading,10)
                                        .background(Color(hue: 1.0, saturation: 0.0,brightness: 0.6504, opacity: 1.0))
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                        .padding(1)
                                        .background(.black)
                                        .cornerRadius(10)
                                    Spacer(minLength: 20)
                                }
                                
                            }
                            .padding(.bottom, 30)
                        }
                        
                        NavigationLink {
                            QuizView()
                                .environmentObject(quizManager)
                        } label: {
                            HStack {
                                Spacer()
                                PrimaryButton(text: "Überprüfe dein Können")
                                    .padding(.top, 20)
                                    .padding(.bottom, 200)
                                Spacer()
                            }
                        }
                    }
                }
                .navigationTitle("Basics")
                .navigationBarTitleDisplayMode(.large)

            .onTapGesture {
                self.hideKeyboard()
            }
        }
    }
    private func hideKeyboard() {
        UIApplication.shared.endEditing()
    }
}

#Preview {
    Lesson1DetailView(lesson1: Lesson1(name: "x", imageName: "-", summary: "-"))
}
