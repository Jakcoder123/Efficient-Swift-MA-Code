//
//  SplashScreenView.swift
//  ProgrammingApplication
//
//  Created by user on 31.10.2024.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive = true
    @State private var isAnimated = false
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                Image(systemName: "figure.mind.and.body")
                    .foregroundStyle(.white)
                    .font(.system(size: 60))
                HStack {
                    Text("Waiting for the App to load")
                        .foregroundStyle(.white)
                    HStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 5, height: 5)
                            .scaleEffect(isAnimated ? 1.0 : 0.5)
                            .animation(Animation.easeInOut(duration: 0.5).repeatForever())
                            .padding(.leading,-2)
                            
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 5, height: 5)
                            .scaleEffect(isAnimated ? 1.0 : 0.5)
                            .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.3))
                            .padding(.leading,-2)
                        
                        Circle()
                            .fill(Color.white)
                            .frame(width: 5, height: 5)
                            .scaleEffect(isAnimated ? 1.0 : 0.5)
                            .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.6))
                            .padding(.leading,-2)
                    }
                    .padding(.top,10)
                    .onAppear{
                        self.isAnimated = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
