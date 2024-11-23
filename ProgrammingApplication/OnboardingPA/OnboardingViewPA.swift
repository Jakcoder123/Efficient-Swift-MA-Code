import SwiftUI

struct OnboardingView: View {
    

    @Environment(\.dismiss) var dismiss
    @State var pageIndex = 0
    
    var body: some View {
        ZStack {
            
            if pageIndex == 0 {
                Color(red: 204/255, green: 62/255, blue: 32/255)
            }
            else {
                Color(red: 241/255, green: 162/255, blue: 58/255)
            }
            
            TabView(selection: $pageIndex) {
                
                OnboardingDetailView(bgColor: Color(red: 241/255, green: 162/255, blue: 58/255), onboardingImage: "onboarding2", onboardingTitle: """
                                     Hey! Willkommen bei
                                     Efficient Swift
                                     """, onboardingSubTitle: "Efficient Swift, hilft dir dabei schnell einen klaren Überblick über die Sprache Swift zu gewinnen.") {
                    withAnimation {
                        pageIndex = 1
                    }
                }
                .tag(0)
                OnboardingDetailView(bgColor: Color(red: 241/255, green: 162/255, blue: 58/255), onboardingImage: "onboarding3", onboardingTitle: "Swift?", onboardingSubTitle: "Swift wurde 2014 von Apple unter der Leitung Chris Lattners entwickelt. Sein Team schuf eine modernere Alternative zu Objective-C für die Entwicklung von iOS- und macOS-Anwendungen."){
                    withAnimation {
                        pageIndex = 2
                    }
                }
                .tag(1)
                OnboardingDetailView(bgColor: Color(red: 241/255, green: 162/255, blue: 58/255), onboardingImage: "onboarding5", onboardingTitle: "Viel Spass!", onboardingSubTitle: "Nutze die Aufgabenfunktion um dein Wissen anzuwenden. Stelle dich zudem mit der Quizfunktion am Ende jedes Kurses auf die Probe."){
                    dismiss()
                }
                .tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            VStack {
                Spacer()
                HStack(spacing: 16) {
                    Spacer()
                    Circle()
                        .frame(height: 10)
                        .foregroundStyle(pageIndex == 0 ? .white : .gray)
                    Circle()
                        .frame(height: 10)
                        .foregroundStyle(pageIndex == 1 ? .white : .gray)
                    Circle()
                        .frame(height: 10)
                        .foregroundStyle(pageIndex == 2 ? .white : .gray)
                    Spacer()
                }
                .padding(.bottom, 190)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
