//
//  QuizView.swift
//  ProgrammingApplication
//
//  Created by user on 01.07.2024.
//

import SwiftUI

struct QuizView: View {
    @EnvironmentObject var quizManager: QuizManager
    
    var body: some View {
        NavigationView {
            if quizManager.reachedEnd {
                VStack(spacing: 20) {
                    
                    Spacer()
                    
                    Spacer()
                   
                        Text("""
Basics-Quiz
abgeschlossen 🥳
""")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .bold()
                    
                        Text("Deine Punktzahl ist \(quizManager.score) von \(quizManager.length) möglichen Punkten.")
                        .multilineTextAlignment(.center)
                    
                    if quizManager.score < 10 {
                        Text("Das braucht noch ein wenig Übung, aber du schaffst das!")
                            .multilineTextAlignment(.center)
                    } else {
                        Text("Sehr gut, weiter so!")
                    }
                    
                    Spacer()
                    
                    Button {
                        Task.init {
                            await quizManager.fetchQuiz()
                        }
                    } label: {
                        PrimaryButton(text: "Wiederholen")
                    }
                    
                    NavigationLink {
                        LessonView()
                    } label: {
                        Text("Zurück") // wenn Zeit überarbeiten.
                            .foregroundStyle(.blue)
                    }
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
       } else {
            QuestionView()
                .environmentObject(quizManager)
       }
    }
    }
}

#Preview {
    QuizView()
        .environmentObject(QuizManager())
}
