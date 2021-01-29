//
//  Learn.swift
//  learnMath
//
//  Created by Mahak Rathi on 8/3/20.
//  Copyright © 2020 Mahak Rathi. All rights reserved.
//

//add start again button when cards are gone to review again



import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(position - total)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}

struct Learn: View {
    
    @State private var cards = [Card]()
    var word: String
    var number: Int
    var sign: String {
        var sign: String
        
        if word == "Adding" {
            sign = "+"
        } else if word == "Subtracting" {
            sign = "-"
        } else if word == "Multiplying" {
            sign = "×"
        } else {
            sign = "÷"
        }
        return sign
    }
    @State private var correct = 0
    @State private var incorrect = 0
    
    @State private var showinghelp = false
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                Text("Here are some flashcards to help you learn!")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()
                if incorrect + correct == 11 - number {
                    
                    VStack {
                        Flashcards2(word: self.word, number: self.number)
                    }
                    Button("Start Over") {
                        Flashcards2(word: self.word, number: self.number)
                     }
                     .padding()
                     .background(Color.orange)
                     .foregroundColor(.black)
                     .clipShape(Capsule())
                
                } else {
                    ZStack {
                        if self.word == "Subtracting" {
                            ForEach(number..<10) {table in
                                CardView(correct: self.$correct, incorrect: self.$incorrect, card: self.cardssub(num1: self.number, num2: table))
                                    .stacked(at: table, in: self.cards.count)
                            }
                        } else if self.word == "Multiplying" {
                            ForEach(number..<11) {table in
                                CardView(correct: self.$correct, incorrect: self.$incorrect, card: self.cardsmul(num1: self.number, num2: table))
                                    .stacked(at: table, in: self.cards.count)
                            }
                        } else if self.word == "Dividing" {
                            ForEach(number..<11) {table in
                                CardView(correct: self.$correct, incorrect: self.$incorrect, card: self.cardsdiv(num1: self.number, num2: self.number * table))
                                    .stacked(at: table, in: self.cards.count)
                            }
                        } else {
                            ForEach((number..<11).reversed(), id: \.self) {table in
                                CardView(correct: self.$correct, incorrect: self.$incorrect, card: self.cardsadd(num1: self.number, num2: table))
                                    .stacked(at: table, in: self.cards.count)
                            }
                        }
                    }
                }
                Spacer()
                HStack {
                    Spacer()
                    ZStack {
                        
                        Text("Incorrect: \(incorrect)")
                            .foregroundColor(.black)
                        
                    }
                    Spacer()
                    Text("Correct: \(correct)")
                        .padding()
                    Spacer()
                }
                Spacer()
                
                Button("How do these flashcards work?") {
                    self.showinghelp = true
                }
                .font(.footnote)
                .foregroundColor(.red)
                .alert(isPresented: $showinghelp) {
                    Alert(title: Text("How do these flashcards work?"), message: Text("To reveal the answer tap on the flashcard. After, swipe right if you got the answer correct and swipe left if not. When you are done see your score and press 'Start Again' to practice one more time!"), dismissButton: .default(Text("Ok, I am ready to learn!")))
                }
            }
        }
    }
    
    
    
    func cardsadd(num1: Int, num2: Int) -> Card {
        let card = Card(prompt: "\(num2) + \(num1)", answer: "\(num1 + num2)")
        return card
    }
    
    func cardssub(num1: Int, num2: Int) -> Card {
        let card = Card(prompt: "\(num2) - \(num1)", answer: "\(num2 - num1)")
        return card
    }
    
    func cardsmul(num1: Int, num2: Int) -> Card {
        let card = Card(prompt: "\(num2) x \(num1)", answer: "\(num2 * num1)")
        return card
    }
    
    func cardsdiv(num1: Int, num2: Int) -> Card {
        let card = Card(prompt: "\(num2) ÷ \(num1)", answer: "\(num2 / num1)")
        return card
    }
}

struct Learn_Previews: PreviewProvider {
    static var previews: some View {
        Learn(word: "Adding", number: 2)
    }
}
