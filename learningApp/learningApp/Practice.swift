//
//  Practice.swift
//  learningApp
//
//  Created by Mahak Rathi on 10/31/20.
//

import SwiftUI

struct Practice: View {
    var word: String
    var number: Int
    @State var table: Int
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Practice_Previews: PreviewProvider {
    static var previews: some View {
        Practice(word: "Adding", number: 1, table: 1)
    }
}
