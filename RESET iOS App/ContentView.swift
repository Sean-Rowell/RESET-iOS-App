//
//  ContentView.swift
//  RESET iOS App
//
//  Created by Sean Rowell on 9/17/24.
//

import SwiftUI

struct ContentView: View {
    // State variable to hold the number
    @State private var count: Int = 0
    @State private var highScore: Int = 0
    @State private var resetChance: Float = 0.0
    
    var body: some View {
        ZStack {
            Color(red: 245 / 255, green: 245 / 255, blue: 220 / 255)
                            .ignoresSafeArea()
            
            VStack {
                //Title
                HStack(spacing: 0) {
                    Text("R")
                    Text("∃")
                        .font(.system(size: 50)) // Adjust the size of the backwards E
                    Text("S")
                    Text("∃")
                        .font(.system(size: 50)) // Adjust the size of the second backwards E
                    Text("T")
                }
                .font(.system(size: 40)).foregroundColor(.black)
                
                // Label showing the High Score
                Text("High Score: \(highScore)")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.black)
                
                // Label showing the current number
                Text("Current Number: \(count)")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.black)
                
                // Button that increments the number
                Button(action: {
                    // Increment the number when the button is clicked
                    @State var rand = Int.random(in: 1...100)
                    if resetChance > Float(rand) {
                        count = 0
                        resetChance = 0.0
                    } else {
                        count += 1
                        resetChance += 0.66
                    }
                    
                    if count > highScore {
                        highScore = count
                    }
                }) {
                    Text("")
                        .padding(EdgeInsets(top: 10, leading: 150, bottom: 500, trailing: 150))   .background(Color(red: 245 / 255, green: 245 / 255, blue: 220 / 255))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .accentColor(.black)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
