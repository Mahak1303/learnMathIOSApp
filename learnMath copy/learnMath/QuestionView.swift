//
//  QuestionView.swift
//  learnMath
//
//  Created by Mahak Rathi on 8/13/20.
//  Copyright © 2020 Mahak Rathi. All rights reserved.
//

/*import SwiftUI

struct Question: Codable {
    let question: String
    let answer: String
    static var example: Question {
        Question(question: "2 + 2", answer: "4")
    }
}
struct QuestionView: View {

    @EnvironmentObject var swipes: Swipes
    let card: Question
    @State private var input = ""
    var removal: (() -> Void)? = nil
    
    @State private var feedback = UINotificationFeedbackGenerator()
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    
    @State private var correct = false
    @State private var incorrect = false
    @State private var showEverything = true
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    Color.white
                        .opacity(1 - Double(abs(offset.width / 50)))
                    
            )
                .background(
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(offset.width > 0 ? Color.green : Color.red)
            )
                .shadow(radius: 10)
            
            VStack {
                Text(card.question)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding(4)
                
                TextField("Enter the answer here:", text: $input)
                    .padding(4)
                
                Button("Submit") {
                    self.showEverything = false
                    //if input ==
                }
                .padding(6)
                .background(Color.orange)
                .foregroundColor(.black)
                .clipShape(Capsule())
                .padding(4)
                
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .padding()
        .frame(width: 450, height: 300)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .gesture(
            DragGesture()
                .onChanged { offset in
                    self.offset = offset.translation
                    self.feedback.prepare()
            }
                
            .onEnded { _ in
                if abs(self.offset.width) > 100 {
                    if self.offset.width > 0 {
                        self.feedback.notificationOccurred(.success)
                        //self.swipes.correct += 1
                    } else {
                        self.feedback.notificationOccurred(.error)
                        //self.swipes.incorrect += 1
                    }
                    
                    self.removal?()
                } else {
                    self.offset = .zero
                }
            }
        )
        .onTapGesture {
            self.isShowingAnswer.toggle()
        }
        .animation(.spring())
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(card: Question.example)
    }
 }*/
