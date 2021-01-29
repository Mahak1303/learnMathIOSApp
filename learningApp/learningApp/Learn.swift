//
//  Learn.swift
//  learningApp
//
//  Created by Mahak Rathi on 10/31/20.
//

import SwiftUI


struct Learn: View {
    var word: String
    var number: Int
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Learn_Previews: PreviewProvider {
    static var previews: some View {
        Learn(word: "Adding", number: 1)
    }
}
