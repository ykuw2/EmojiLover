//
//  ContentView.swift
//  EmojiLover
//
//  Created by Yuki Kuwahara on 9/11/25.
//

import SwiftUI

// List of emojis
// enum is a list of cases
enum Emoji : String, CaseIterable {
    case 💀, 😹, 😈, 👀 // Emoji is technically a string - hence the String type
}
// Note that CaseIterable here created "Emoji.allCases" which will be used below
// This created the array of all cases, which is perfect for looping

struct ContentView: View {
    @State var selection: Emoji = .💀 // Reference emoji
    // @State marks a propert as "source of truth" for the view's state
    // Basically, if this changes then rerender the view
    
    var body: some View {
        NavigationView{
            VStack{ // VStack is a layout container that stacks its child views vertically
                Text(selection.rawValue) // rawValue makes it a String
                    .font(.system(size:150))
                
                Picker("Select Emoji", selection: $selection) {
                    ForEach(Emoji.allCases, id: \.self) { emoji in
                        Text(emoji.rawValue)
                    }
                    // For each creates a view for all the cases
                    // .\self just means to use the emoji itself as its unique ID
                }
                // $selection creates a binding to the @State variable
                // without the "$", it would just be passing the value, not the ability to update
                .pickerStyle(.segmented)
            }
            .navigationTitle("EmojiLover")
            .padding()
        }
    }
}

// The code below is what renders the app we wrote on the right
#Preview {
    ContentView()
}
