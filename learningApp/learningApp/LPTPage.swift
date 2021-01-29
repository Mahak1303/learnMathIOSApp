//
//  LPTPage.swift
//  learningApp
//
//  Created by Mahak Rathi on 10/31/20.
//

import SwiftUI

struct Links: View {
    var text: String
    var image: String
    var body: some View {
            ZStack {
                Capsule()
                    .overlay(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading))
                    .frame(width: 350, height: 100, alignment: .center)
                    .cornerRadius(20.0)
                HStack {
                    Text(text)
                    Image(systemName: image)
                }
                .foregroundColor(.black)
                .font(.headline)

            }
            .padding()
    }
}

struct LPTPage: View {
    var number: Int
    var word: String
    @State private var showNow = false
    var body: some View {
        NavigationView {
            VStack {
                Text("\(word) by \(number)")
                    .bold()
                    .font(.largeTitle)
                Spacer()
                
                Button(action: {
                            self.showNow.toggle()
                        }) {
                        Links(text: "Learn", image: "book")
                        }.sheet(isPresented: $showNow) {
                            Flashcards(word: word, number: number)
                        }
                
                Button(action: {
                            self.showNow.toggle()
                        }) {
                        Links(text: "Practice", image: "pencil")
                        }.sheet(isPresented: $showNow) {
                            Practice(word: word, number: number, table: number)
                        }

                Button(action: {
                            self.showNow.toggle()
                        }) {
                        Links(text: "Master", image: "star")
                        }.sheet(isPresented: $showNow) {
                            Master(word: word, number: number, table: number)
                        }
                Spacer()
            }
        }
    }
}

struct LPTPage_Previews: PreviewProvider {
    static var previews: some View {
        LPTPage(number: 1, word: "Adding")
    }
}
