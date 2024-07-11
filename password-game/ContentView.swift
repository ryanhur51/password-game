import SwiftUI

struct ContentView: View {
    @State var boolArray = Array(repeating: false, count: 3)
    @State var ruleArray = ["Rule 1: Password must be at least 5 characters.", "Rule 2: Password must have a number.", "Rule 3: Password must contain a capital letter"]
    @State var password = ""
    @State var counter = 0
    
    @State var r1Color = Color.primary
    @State var r2Color = Color.primary
    @State var r3Color = Color.primary
    
    @State var flag = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Password Game")
                    .font(.title)
                    .padding()
                Text("Please choose a password")
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
                TextEditor(text: $password)
                    .frame(width: 350, height: 50, alignment: .center)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black, lineWidth: 10)
                    )
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .onChange(of: password) {
                        if rule1() == true{
                            boolArray[0] = true
                        }
                    }
                VStack{
                    Text(ruleArray[0])
                        .foregroundColor(r1Color)
                        .padding()
                    
                    if boolArray[0] == true {
                        Text(ruleArray[1])
                            .foregroundColor(r2Color)
                            .padding()
                    }
                    if boolArray[1] == true {
                        Text(ruleArray[2])
                            .foregroundColor(r2Color)
                            .padding()
                    }
                    
                }
                Spacer()
            }
        }
    }
    
    func rule1() -> Bool { // Password must be at least 5 characters
        if password.count < 5 {
            r1Color = Color.red
            return false
        } else {
            r1Color = Color.green
            rule2()
            return true
        }
    }
    
    func rule2(){ // Password must have a number
        for character in password {
            if character.isNumber{
                r2Color = Color.green
                boolArray[1] = true
                rule3()
            } else {
                r2Color = Color.red
            }
        }
    }
    
    func rule3(){ // Password must have
        for character in password {
            if character.isLetter{
                if character.isUppercase {
                    r3Color = Color.green
                    boolArray[2] = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
