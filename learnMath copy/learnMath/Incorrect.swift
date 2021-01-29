//
//  Incorrect.swift
//  learnMath
//
//  Created by Mahak Rathi on 8/17/20.
//  Copyright © 2020 Mahak Rathi. All rights reserved.
//

import SwiftUI

struct Incorrect: View {
    var word: String
    var number: Int
    var table: Int
    var input: String
    var body: some View {
        VStack {
            Spacer()
            Text("Incorrect!")
                .fontWeight(.black)
                .foregroundColor(Color.black)
                .bold()
                .font(.system(size: 60.0))
            Spacer()
            Text("\(number) + \(table) = \(number + table)")
                .fontWeight(.bold)
            .padding()
                .foregroundColor(.green)
            .font(.largeTitle)
            Text("NOT \(input)")
                .font(.title)
                .foregroundColor(Color.red)
                .padding()
            Spacer()
            Text("Please take a minute to review this problem before continuing.")
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
    }
}

struct Incorrect_Previews: PreviewProvider {
    static var previews: some View {
        Incorrect(word: "Adding", number: 3, table: 2, input: "6")
    }
}
