//
//  ContentView.swift
//  learningApp
//
//  Created by Mahak Rathi on 10/30/20.
//

import SwiftUI

struct Block: View {
    var word: String
    var number: Int
    @State var progress: Float
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 10))
                    .frame(width: 120, height: 120)
                    .padding()
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                    .stroke(
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading),
                        style: StrokeStyle(lineWidth: 10, lineCap: .round)
                    )
                    .frame(width: 120, height: 120)
                    .rotationEffect(Angle(degrees: 270))
                    .shadow(color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 3, x: 0, y: 3)
                    .animation(.linear)
                
                Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                    .padding()
                
            }
            Text("\(self.word) by \(number)")
                .foregroundColor(.black)
        }
    }
}

struct ContentView: View {
    
    @State private var pickermath = 0
    var pickeroptions = ["Add", "Subtract", "Multiply", "Divide"]
    
    var color: Int {
        var color = 0
        
        if pickeroptions[pickermath] == "Add" {
            color = 1
        } else if pickeroptions[pickermath] == "Subtract" {
            color = 2
        } else if pickeroptions[pickermath] == "Multiply" {
            color = 3
        } else {
            color = 4
        }
        
        return color
    }
    
    var word: String {
        var word = ""
        
        if pickeroptions[pickermath] == "Add" {
            word = "Adding"
        } else if pickeroptions[pickermath] == "Subtract" {
            word = "Subtracting"
        } else if pickeroptions[pickermath] == "Multiply" {
            word = "Multiplying"
        } else {
            word = "Dividing"
        }
        
        return word
    }
    
    @State var progressValue: Float = 0
    
    var body: some View {
        NavigationView{
            
            ZStack{
                Rectangle()
                    .overlay(changeBkColor(color: self.color))
                    .animation(.default)
                    .ignoresSafeArea()
                ScrollView(showsIndicators: false){
                    VStack{
                        Spacer()
                        Text("Learn to...")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding(.top, 70.0)
                            .padding()
                        
                        
                        Picker(selection: $pickermath, label: Text("won't show")) {
                            ForEach(0 ..< pickeroptions.count) {
                                Text(self.pickeroptions[$0])
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                        Spacer()
                        
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 10){
                                ForEach(0..<6) {number in
                                    NavigationLink(destination: LPTPage(number: number, word: self.word)) {
                                        HStack {
                                            Block(word: self.word, number: number,  progress: Float(0.3))
                                        }
                                    }
                                }
                            }
                            .padding(20)
                        }
                        Spacer()
                        Button("Review 1-5"){
                            //todo
                        }
                        .foregroundColor(.black)
                        .padding()
                        .cornerRadius(100)
                        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .cornerRadius(20)
                        .font(.body)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 10){
                                ForEach(6..<11) {number in
                                    NavigationLink(destination: LPTPage(number: number, word: self.word)) {
                                        HStack {
                                            Block(word: self.word, number: number,  progress: 0.3)
                                        }
                                    }
                                }
                            }
                            .padding(20)
                        }
                        Spacer()
                        
                        HStack{
                            Spacer()
                            Button("Review 6-10"){
                                //todo
                            }
                            .foregroundColor(.black)
                            .padding()
                            .cornerRadius(100)
                            .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .cornerRadius(20)
                            .font(.body)
                            Spacer()
                            
                            Button(" Review All "){
                                //todo
                            }
                            .foregroundColor(.black)
                            .padding()
                            .cornerRadius(100)
                            .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .cornerRadius(20)
                            .font(.body)
                            Spacer()
                        }
                        .padding()
                        
                    }

                }            }
            
            .ignoresSafeArea()
            /*.navigationBarItems(trailing:
             Button("Help") {
             print("Help tapped!")
             }
             )*/
        }
    }
    
    func changeBkColor(color: Int) -> LinearGradient
    {
        if(color == 1)
        {
            return                             LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading)
            
        }
        else if(color == 2)
        {
            return LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), Color(#colorLiteral(red: 0.7113366127, green: 0.6500637531, blue: 0.9567331672, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading)
        }
        else if(color == 3)
        {
            return LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading)
        }
        else
        {
            return LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.7113366127, green: 0.6500637531, blue: 0.9567331672, alpha: 1)), Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
