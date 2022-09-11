//
//  ContentView.swift
//  Art App
//
//  Created by Quint DeNiro Fain on 9/7/22.
//

import SwiftUI

struct ContentView: View {
    @State var signInSuccess = false
    var body: some View {
        return Group {
                    if signInSuccess {
                        AppHome()
                    }
                    else {
                        LoginFormView(signInSuccess: $signInSuccess)
                    }
                }
    
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}

struct LoginFormView: View {
    @State private var userName: String = ""
    @State var greeting: String = ""
    @Binding var signInSuccess: Bool
    var body: some View {
        VStack {
            Text(greeting)
            Spacer()
            Image("login-background")
                .resizable()
                .ignoresSafeArea()
                .scaledToFit()
            Spacer()
            HStack(spacing: 50) {
                Spacer()
                TextField(
                    "Enter Username",
                    text:$userName).disableAutocorrection(true).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(TextAlignment.center)
                Spacer()
            }
            Button(action: {
                greeting = "Welcome " + userName + "!"
                signInSuccess = true
            }, label: {
                Text("Submit")
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.green)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black, lineWidth: 2)
                        )
            }).cornerRadius(25)
        }
    }
}
