//
//  Master.swift
//  learningApp
//
//  Created by Mahak Rathi on 10/31/20.
//

import SwiftUI

struct Master: View {
    var word: String
    var number: Int
    @State var table: Int
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Master_Previews: PreviewProvider {
    static var previews: some View {
        Master(word: "Adding", number: 1, table: 1)
    }
}
