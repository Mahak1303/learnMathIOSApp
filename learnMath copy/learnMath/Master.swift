//
//  Master.swift
//  learnMath
//
//  Created by Mahak Rathi on 8/3/20.
//  Copyright © 2020 Mahak Rathi. All rights reserved.
//

import SwiftUI

struct Master: View {
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

    
    @State private var isTapped = false
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Text("Master \(word) by \(number) by taking this quiz")
                    .font(.largeTitle)
                    .foregroundColor(.orange)
                    .multilineTextAlignment(.center)
                    .padding(40)
                HStack {
                    VStack {
                        ForEach(number..<11) {table in
                            VStack {
                                HStack {
                                    Text("What is")
                                    Text("\(table) \(self.sign) \(self.number)")
                                        .font(.title)
                                        .foregroundColor(.red)
                                    Text("?")
                                }
                                .font(.headline)
                                .padding()
                            }
                            HStack {
                                Button(action: {
                                    if self.isTapped {
                                        self.isTapped = false
                                    } else {
                                        self.isTapped = true
                                    }
                                }) {
                                    Image(systemName: "a.circle")
                                }
                                .background(self.isTapped ? Color.blue : Color.white)
                                .foregroundColor(Color.black)
                                
                                Text("\(table + self.number)")
                            }
                            HStack {
                                Image(systemName: "b.circle")
                                
                                Text("\(table + Int.random(in: 0..<self.number))")
                            }
                        }
                    }
                    .padding(18)
                    .font(.headline)
                }
                
            }
        }
    }
}

struct Master_Previews: PreviewProvider {
    static var previews: some View {
        Master(word: "Subtracting", number: 1)
    }
}

