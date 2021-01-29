//
//  Learn.swift
//  learnMath
//
//  Created by Mahak Rathi on 8/3/20.
//  Copyright © 2020 Mahak Rathi. All rights reserved.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}

struct Learn: View {
    
    @State private var cards = [CardView]()
    
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

    var body: some View {
        VStack {
            ZStack {
                ForEach(number..<10) {table in
                    CardView(card: self.cards(num1: self.number, num2: table))
                        .stacked(at: table, in: self.cards.count)
                }
            }
            
            if cards.isEmpty {
                Button("Start Again", action: reset)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.black)
                    .clipShape(Capsule())
            }
        }
    }
    func reset() {
        ForEach(number..<10) {table in
            CardView(card: self.cards(num1: self.number, num2: table))
                .stacked(at: table, in: self.cards.count)
        }
    }
    
    func cards(num1: Int, num2: Int) -> Card {
        let card = Card(prompt: "\(num1) + \(num2)", answer: "\(num1 + num2)")
        return card
    }
}

struct Learn_Previews: PreviewProvider {
    static var previews: some View {
        Learn(word: "Adding", number: 4)
    }
}
