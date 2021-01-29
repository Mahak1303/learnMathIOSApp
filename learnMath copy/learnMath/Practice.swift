//
//  Practice.swift
//  learnMath
//
//  Created by Mahak Rathi on 8/3/20.
//  Copyright © 2020 Mahak Rathi. All rights reserved.
//

// make in random order
//when correct popup clicked it freezes
//not showing incorrect
//not stopping at 10

import SwiftUI


struct Practice: View {
    var word: String
    @State var number: Int
    
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
    
    @State private var input = ""
    @State private var showEverything = false
    @State private var offset = CGSize.zero
    @State var table: Int
    @State private var showAlert = false
    @State private var showAlert2 = false
    @State private var showCorrect = false
    @State private var showIncorrect = false
    @State private var done = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var shufflednum = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].shuffled()
    
    @State private var nums = [1,2,3,4,5,6,7,8,9]
    
    var body: some View {
        ZStack {
            VStack {
                if self.word == "Subtracting" {
                    Text("\(self.table) - \(self.number)")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding(4)
                } else if self.word == "Multiplying" {
                    Text("\(self.table) x \(self.number)")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding(4)
                } else if self.word == "Dividing" {
                    Text("\(self.table) ÷ \(self.number)")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding(4)
                } else {
                    Text("\(self.table) + \(self.number)")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding(4)
                }
                
                    TextField("Enter the answer here:", text: self.$input)
                        .padding(4)
                        .keyboardType(.decimalPad)
                    
                    Button("Submit") {
                        
                        if self.word == "Dividing" {
                            if self.table > self.number * 10 {
                                self.done = true
                            }
                        } else {
                            if self.table > 10 {
                                    self.done = true
                                }
                        }
                        
                        if self.input == "" {
                            self.showAlert = true
                        }
                        
                        self.showEverything = false
                        let intInput = Int(self.input)
                        
                        if self.word == "Dividing" {
                            if intInput == self.table / self.number {
                                self.showCorrect = true
                            } else {
                                self.showIncorrect = true
                            }
                        } else if self.word == "Multiplying" {
                            if intInput == self.number * self.table {
                                self.showCorrect = true
                            } else {
                                self.showIncorrect = true
                            }
                        } else if self.word == "Subtracting" {
                            if intInput == self.table - self.number {
                                self.showCorrect = true
                            } else {
                                self.showIncorrect = true
                            }
                        } else {
                            if intInput == self.number + self.table {
                                self.showCorrect = true
                            } else {
                                self.showIncorrect = true
                            }
                        }
                    }
                    .padding(8)
                    .background(Color.orange)
                    .foregroundColor(.black)
                    .clipShape(Capsule())
                    .padding(4)
                    .sheet(isPresented: $showIncorrect) {
                        Incorrect(word: self.word, number: self.number, table: self.table, input: self.input)
                }
                    
                    HStack {
                        Button("Back") {
                            self.input = ""
                            if self.table == self.number {
                                self.showAlert2 = true
                            } else {
                                if self.word == "Subtracting" {
                                    self.table -= 1
                                } else if self.word == "Multiplying" {
                                    self.table -= 1
                                } else if self.word == "Dividing" {
                                    self.table -= self.number
                                } else {
                                    self.table += 1
                                }
                            }
                        }
                        .padding()
                        .alert(isPresented: $showAlert2) {
                            Alert(title: Text("Oops!"), message: Text("You can't go further back."), dismissButton: .default(Text("Ok")))
                        }
                        
                        Spacer()
                        Button(action: {
                            if self.input == "" {
                                self.showAlert = true
                            } else {
                                if self.word == "Subtracting" {
                                    self.table = self.random2()
                                } else if self.word == "Multiplying" {
                                    self.table = self.random2()
                                } else if self.word == "Dividing" {
                                    self.table = self.table + self.number
                                } else {
                                    self.table = self.random2()

                                }
                            }
                            
                            self.input = ""
                            
                        }) {
                            Text("Next")
                        }
                                            }
                
            }
            .padding(20)
            .multilineTextAlignment(.center)
            
            VStack {
                if showCorrect {
                    ZStack {
                        Rectangle()
                        .frame(width: 300.0, height: 300.0)
                        .foregroundColor(.blue)
                        Text("Correct!")
                            .foregroundColor(.white)
                            .bold()
                            .font(.largeTitle)
                            .onAppear() {
                                withAnimation(Animation.easeInOut(duration: 1.25).delay(0)) {
                                    self.showCorrect = false
                                }
                        }
                    }
                }
                if random2() == 0 {
                    ZStack {
                        Rectangle()
                            .frame(width: 600, height: 300.0)
                            .foregroundColor(.blue)
                        VStack {
                            Text("Good Job, you finished practicing!")
                            Button("Practice 1 more Time") {
                                self.table = self.number
                            }
                            .foregroundColor(.black)
                            .onTapGesture() {
                                    withAnimation(Animation.easeInOut(duration: 1.25).delay(0)) {
                                        self.showCorrect = false
                                    }
                            }
                            
                            Button("Master \(word) by \(number)") {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
                }
            }
        }
    }
    
    func random2() -> Int {
        var randNum: Int = 0
        if nums.count > 0 {
            //get random key from array (gets the index)
            let arrayKey = Int(arc4random_uniform(UInt32(nums.count)))
            // your random number
            randNum = nums[arrayKey]
            
            // make sure the number isn't repeated
            nums.remove(at: arrayKey)
        } else {
            return 0
        }
        return randNum
    }
    
}




struct Practice_Previews: PreviewProvider {
    static var previews: some View {
        Practice(word: "Adding", number: 3, table: 3)
    }
}
