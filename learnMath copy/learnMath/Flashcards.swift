//
//  Flashcards.swift
//  learnMath
//
//  Created by Mahak Rathi on 9/3/20.
//  Copyright © 2020 Mahak Rathi. All rights reserved.
//

import SwiftUI

struct Flashcards: View {
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
        ZStack {
        if self.word == "Subtracting" {
        ForEach(self.number..<10) {table in
        CardView(correct: self.$correct, incorrect: self.$incorrect, card: self.cardssub(num1: self.number, num2: table))
        .stacked(at: table, in: self.cards.count)
        }
        } else if self.word == "Multiplying" {
        ForEach(self.number..<11) {table in
        CardView(correct: self.$correct, incorrect: self.$incorrect, card: self.cardsmul(num1: self.number, num2: table))
        .stacked(at: table, in: self.cards.count)
        }
        } else if self.word == "Dividing" {
        ForEach(self.number..<11) {table in
        CardView(correct: self.$correct, incorrect: self.$incorrect, card: self.cardsdiv(num1: self.number, num2: self.number * table))
        .stacked(at: table, in: self.cards.count)
        }
        } else {
        ForEach((self.number..<11).reversed(), id: \.self) {table in
        CardView(correct: self.$correct, incorrect: self.$incorrect, card: self.cardsadd(num1: self.number, num2: table))
        .stacked(at: table, in: self.cards.count)
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

struct Flashcards_Previews: PreviewProvider {
    static var previews: some View {
        Flashcards(word: "Adding", number: 3)
    }
}
