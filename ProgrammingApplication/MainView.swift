import SwiftUI

struct MainView: View {
    
    @State private var showSplash = true
    @AppStorage("onboardingKey") var needsOnboarding = true
    
    var body: some View {
        ZStack {
            if showSplash {
                SplashScreenView()
                    .transition(.opacity)
                    .animation(.easeOut(duration: 1.5))
            } else {
                TabView {
                    
                    LessonView().tabItem {
                        VStack {
                            Image(systemName: "books.vertical")
                            Text("Kurse")
                        }
                    }
                    
                    SettingsView().tabItem {
                        VStack {
                            Image(systemName: "gearshape")
                            Text("Einstellungen")
                        }
                    }
                }
                .fullScreenCover(isPresented: $needsOnboarding) {
                    // On dismiss
                    needsOnboarding = false
                } content: {
                    OnboardingView()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.showSplash = false
                }
            }
        }
    }
}

#Preview {
    MainView()
}
