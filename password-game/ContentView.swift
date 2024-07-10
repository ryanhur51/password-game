//
//  ContentView.swift
//  password-game
//
//  Created by Ryan Hur on 7/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var password = "Enter your password here"
    var body: some View {
        NavigationView {
            VStack{
                Text("Password Game")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                    
                TextEditor(text: $password)
                    .opacity(0.5)
                    .frame(width: 350, height: 100, alignment: .top)
                    .background(Color.red)
                    .cornerRadius(10)
                    .position(x: 200, y: 75)
            }
        }
    }
}

#Preview {
    ContentView()
}
