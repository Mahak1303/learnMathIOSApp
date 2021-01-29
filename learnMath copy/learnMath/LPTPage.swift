//
//  LPTPage.swift
//  learnMath
//
//  Created by Mahak Rathi on 8/3/20.
//  Copyright © 2020 Mahak Rathi. All rights reserved.
//

import SwiftUI

struct Links: View {
    var text: String
    var image: String
    var body: some View {
            ZStack {
                Circle()
                    .foregroundColor(.orange)
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
    var hi = true
    var body: some View {
        NavigationView {
            VStack {

                NavigationLink(destination: Learn(word: word, number: number)) {
                    Links(text: "Learn", image: "book")
                }
                NavigationLink(destination: Practice(word: word, number: number, table: number)) {
                    Links(text: "Practice", image: "pencil")
                }
                NavigationLink(destination: Master_2(word: word, number: number, table: number)) {
                    Links(text: "Master", image: "star")
                }
            }
            .navigationBarTitle(Text("\(word) by \(number)"), displayMode: .large)
        }
    }
}

struct LPTPage_Previews: PreviewProvider {
    static var previews: some View {
        LPTPage(number: 0, word: "Adding")
    }
}
