//
//  CardView.swift
//  Project17
//
//  Created by Paul Hudson on 17/02/2020.
//  Copyright © 2020 Paul Hudson. All rights reserved.
//

import SwiftUI




struct Card: Codable {
    let prompt: String
    let answer: String
    static var example: Card {
        Card(prompt: "2 + 2", answer: "4")
    }
}
struct CardView: View {

    @Binding var correct: Int
    @Binding var incorrect: Int
    
    let card: Card
    
    var removal: (() -> Void)? = nil
    
    @State private var feedback = UINotificationFeedbackGenerator()
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    
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
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                
                if isShowingAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .padding()
        .frame(width: 450, height: 250)
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
                        self.correct += 1
                    } else {
                        self.feedback.notificationOccurred(.error)
                        self.incorrect += 1
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

struct CardView_Previews: PreviewProvider {
    @State static var number = 2 //just for preview
    static var previews: some View {
        CardView(correct: $number, incorrect: $number, card: Card.example)
    }
}
