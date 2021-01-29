//
//  Master 2.swift
//  learnMath
//
//  Created by Mahak Rathi on 8/24/20.
//  Copyright © 2020 Mahak Rathi. All rights reserved.
//
//make random


import SwiftUI

struct Master_2: View {
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
    @State private var offset = CGSize.zero
    @State var table: Int
    @State private var showAlert = false
    @State private var showAlert2 = false
    @State private var isCorrect = 0
    @State private var isIncorrect = 0
    @State private var done = false
    @State private var result = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showresult = false
    
    @State private var nums = [1,2,3,4,5,6,7,8,9]
    var body: some View {
        VStack {
            if result == false {
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
                            .multilineTextAlignment(.center)
                        
                        Button("Submit") {
                            if self.random2() == 0 {
                                self.result = true
                            }
                            /*if self.word == "Dividing" {
                                if self.table > self.number * 10 {
                                    self.result = true
                                }
                            } else {
                                if self.number >= 10 {
                                    self.result = true
                                }
                            }*/
                            
                            if self.input == "" {
                                self.showAlert = true
                            }
                            
                            let intInput = Int(self.input)
                            
                            if self.word == "Dividing" {
                                if intInput == self.table / self.number {
                                    self.isCorrect += 1
                                } else {
                                    self.isIncorrect += 1
                                }
                            } else if self.word == "Multiplying" {
                                if intInput == self.number * self.table {
                                    self.isCorrect += 1
                                } else {
                                    self.isIncorrect += 1
                                }
                            } else if self.word == "Subtracting" {
                                if intInput == self.table - self.number {
                                    self.isCorrect += 1
                                } else {
                                    self.isIncorrect += 1
                                }
                            } else {
                                if intInput == self.number + self.table {
                                    self.isCorrect += 1
                                } else {
                                    self.isIncorrect += 1
                                }
                            }
                            
                            if self.input == "" {
                                self.showAlert = true
                            } else {
                                if self.word == "Subtracting" {
                                    self.table = self.random2()
                                } else if self.word == "Multiplying" {
                                    self.table = self.random2()
                                } else if self.word == "Dividing" {
                                    //todo
                                } else {
                                    self.table = self.random2()
                                }
                            }
                            
                            self.input = ""
                        }
                        .padding(8)
                        .background(Color.orange)
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                        .padding(4)
                        .sheet(isPresented: $result) {
                            TestResults(word: self.word, number: self.number, table: self.table, correct: self.isCorrect, incorrect: self.isIncorrect)
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Oops!"), message: Text("You have to enter the answer in the textbox."), dismissButton: .default(Text("Ok")))
                        }
                    }
                }
            } else {
                TestResults(word: word, number: number, table: number, correct: isCorrect, incorrect: isIncorrect)
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
    struct Master_2_Previews: PreviewProvider {
        static var previews: some View {
            Master_2(word: "Adding", number: 9, table: 9)
        }
    }

