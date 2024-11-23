import SwiftUI

struct OnboardingDetailView: View {
    
    var bgColor: Color
    var onboardingImage: String
    var onboardingTitle: String
    var onboardingSubTitle: String
    var onboardingButton: () -> Void
    
    var body: some View {
            ZStack {
                Color(bgColor)
                VStack(spacing: 0) {
                    
                    Spacer()
                    Spacer()
                    
                    Image(onboardingImage)
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 60)
                    
                    
                    Text(onboardingTitle)
                        .font(Font.system(size: 22))
                        .bold()
                        .padding(.top, 32)
                        .padding(.bottom, 10)
                        .multilineTextAlignment(.center)
                    
                    Text(onboardingSubTitle)
                        .padding(.top, 4)
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                    
                    
                    Spacer()
                    
                    Button {
                        onboardingButton()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(height: 50)
                                .foregroundColor(Color.white)
                            Text("Weiter")
                                .foregroundStyle(.black)
                                .bold()
                        }
                    }
                    .padding(.bottom, 115)
                    .padding(.horizontal)
                }
                .foregroundStyle(.white)
            }
            .ignoresSafeArea()
        }
}

#Preview {
    OnboardingDetailView(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255), onboardingImage: "onboarding", onboardingTitle: "heeeello", onboardingSubTitle: "Hi") {
        // function for Button
    }
}
