import SwiftUI

struct ContentView: View {
    @State var password = ""
    
    @State var r1 = "Rule 1: Password must be at least 5 characters."
    @State var r1Color = Color.primary
    @State var r2 = "Rule 2: Password must have a number."
    @State var r2Color = Color.primary
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
                    .onChange(of: password) {
                        if rule1() == true{
                            flag = true
                        }
                    }
                
                Text(r1)
                    .foregroundColor(r1Color)
                    .padding()
                
                if flag == true {
                    Text(r2)
                        .foregroundColor(r2Color)
                }
                

                
                Spacer()
            }
        }
    }
    
    func rule1() -> Bool {
        if password.count < 5 {
            r1Color = Color.red
            return false
        } else {
            r1Color = Color.green
            rule2()
            return true
        }
    }
    
    func rule2(){
        for character in password {
            if character.isNumber{
                r2Color = Color.green
            } else {
                r2Color = Color.red
            }
        }
    }
}

#Preview {
    ContentView()
}
