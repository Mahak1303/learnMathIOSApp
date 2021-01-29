//
//  TestResults.swift
//  learnMath
//
//  Created by Mahak Rathi on 8/24/20.
//  Copyright © 2020 Mahak Rathi. All rights reserved.
//

import SwiftUI

struct Test: View {
    var word: String
    var body: some View {
        Text("Score: \(word)%")
    }
}
struct TestResults: View {
    var word: String
    var number: Int
    var table: Int
    var correct: Int
    var incorrect: Int
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Spacer() 
            if score(correct: correct, incorrect: incorrect) > 70 {
                Test(word: stringscore(correct: correct, incorrect: incorrect))
                    .foregroundColor(.green)
                    .font(.largeTitle)
                    .padding()
                Text("CONGRATS! You have mastered \(word.lowercased()) by \(number)!")
                .padding()
                    .font(.title)
                    .multilineTextAlignment(.center)
                Spacer()
                Text("You had got \(correct) answers incorrect and \(incorrect) answers correct.")
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                Button("GO HOME") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.white)
                .font(.body)
                .padding()
                .background(Color.orange)
                .clipShape(Capsule())
                
                
                Spacer()
                
                HStack {
                    Text("ALWAYS REMEMBER :")
                        .padding()
                    Spacer()
                }
                
                Text("YOU ARE AMAZING!")
                    .foregroundColor(.orange)
                    .font(.title)
                    
            } else {
                Test(word: stringscore(correct: correct, incorrect: incorrect))
                    .foregroundColor(.gray)
                    .font(.largeTitle)
                    .padding()

                Text("Nice Try! Unfortunalty, you haven't mastered \(word.lowercased()) by \(number). If you put in some more practice, I am sure you'll be able to master this level with just a little more practice.")
                    .padding()
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                Spacer()
                Text("You had got \(correct) answers correct and \(incorrect) answers incorrect.")
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                Button("GO HOME") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.white)
                .font(.body)
                .padding()
                .background(Color.orange)
                .clipShape(Capsule())
                
                
                Spacer()
                
                /*HStack {
                    Text("ALWAYS REMEMBER :")
                        .padding()
                    Spacer()
                }
                
                Text("YOU ARE AMAZING!")
                    .foregroundColor(.orange)
                    .font(.title)*/
            }
            Spacer()
        }
    }
    func score(correct: Int, incorrect: Int) -> Int {
        let total = correct + incorrect
        let score = correct / total
        let finalscore = score * 100
        return finalscore
    }
    
    func stringscore(correct: Int, incorrect: Int) -> String {
        let total = correct + incorrect
        let score = total / correct
        let finalscore = score 
        let stringscore = String(finalscore)
        return stringscore
    }
}

struct TestResults_Previews: PreviewProvider {
    static var previews: some View {
        TestResults(word: "Adding", number: 3, table: 3, correct: 8, incorrect: 1)
    }
}
