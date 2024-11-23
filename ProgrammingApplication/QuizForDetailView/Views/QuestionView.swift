//
//  QuestionView.swift
//  ProgrammingApplication
//
//  Created by user on 01.07.2024.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var quizManager: QuizManager
    
    var body: some View {
        VStack(spacing: 40) {
            
            HStack {
                Text("Basics-Quiz")
                    .bold()
                    .font(.title)
                Spacer()
                Text("Frage \(quizManager.index + 1) von \(quizManager.length)")
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: quizManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text(quizManager.question)
                        .font(.system(size: 20))
                        .bold()
                    Spacer()
                }
                ForEach(quizManager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(quizManager)
                }
                
                Spacer(minLength: 0)
                HStack {
                    Spacer()
                    
                    Button {
                        quizManager.goToNextQuestion()
                    } label: {
                        PrimaryButton(text: "Weiter", background: quizManager.answerSelected ? .blue : Color(hue: 1.0, saturation: 0.0,brightness: 0.564, opacity: 0.327))
                    }
                    .disabled(!quizManager.answerSelected)
                    .padding(.bottom)
                    
                    Spacer()
                }
            }
    
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background()
    }
}

#Preview {
    QuestionView()
        .environmentObject(QuizManager())
}
