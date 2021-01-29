//
//  ContentView.swift
//  learnMath
//
//  Created by Mahak Rathi on 8/2/20.
//  Copyright © 2020 Mahak Rathi. All rights reserved.
//
//make the lines into squares

import SwiftUI

struct Block: View {
    var word: String
    var number: Int
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [.orange, .yellow]), startPoint: .top, endPoint: .bottom))
                    
                    .cornerRadius(20)
                    
                    
                
                Text("\(self.word) by \(number)")
                    .foregroundColor(.white)
            }
        }
    }
}
struct ContentView: View {
    
    @State private var pickermath = 0
    var pickeroptions = ["Addition", "Subtraction", "Multipication", "Division"]
    
    var word: String {
        var word = ""
        
        if pickeroptions[pickermath] == "Addition" {
            word = "Adding"
        } else if pickeroptions[pickermath] == "Subtraction" {
            word = "Subtracting"
        } else if pickeroptions[pickermath] == "Multipication" {
            word = "Multiplying"
        } else {
            word = "Dividing"
        }
        
        return word
    }
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("What do you want to learn?")
                
                Picker(selection: $pickermath, label: Text("won't show")) {
                    ForEach(0 ..< pickeroptions.count) {
                        Text(self.pickeroptions[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Spacer()
                Text("Let's learn \(pickeroptions[pickermath])!")
                    .font(.title)
                    .foregroundColor(Color.blue)
                    .padding(.all)
                
                ForEach(0..<11) {number in
                    NavigationLink(destination: LPTPage(number: number, word: self.word)) {
                        HStack {
                            Block(word: self.word, number: number)
                        }
                    }
                }
                Spacer()
            }
            .navigationBarTitle(Text("Learn Math Facts"), displayMode: .inline)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
