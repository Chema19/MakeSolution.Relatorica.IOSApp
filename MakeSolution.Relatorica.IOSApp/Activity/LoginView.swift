//
//  LoginView.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 10/19/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    let CapsuleButton = TokenButton(capsuleText: "Capsule")
    let TextButton = TokenButton(buttonText: "Text")
    
    var body: some View {
      
      
        NavigationView {
            VStack {
                       Image("login")
                           .clipShape(Rectangle()) .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                           .shadow(radius: 10).padding(.top,30)
                       
                       HStack {
                            Image("user").foregroundColor(.red)
                                .shadow(radius: 10).frame(width: 32.0, height: 32.0)
                        
                            TextField("Enter username", text:$username).padding(.all)
                                        .background(lightGreyColor).cornerRadius(5.0)
                       }.padding(.horizontal,28).padding(.top,30)
                
                       HStack {
                            Image("key").foregroundColor(.red)
                                .shadow(radius: 10).frame(width: 32.0, height: 32.0)
                            
                        TextField("Enter passsword", text:$password).padding(.all)
                                       .background(lightGreyColor).cornerRadius(5.0)
                       }.padding(.horizontal,28)
                 
                        Button(action: {
                        }) {
                            Text("Login") }.padding(.top,20).buttonStyle(self.CapsuleButton.buttonStyle)
                
                        Spacer()
                
            }.navigationBarTitle("Login")
            .navigationBarItems(trailing:
                HStack {
                    Button(action:{})
                    {
                        Text("about")
                    }.padding(.top,20).buttonStyle(self.TextButton.buttonStyle)
                }
            )
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct BackgroundButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
      configuration.label
        .padding()
        .foregroundColor(.white)
        .background(configuration.isPressed ? Color.red : Color.blue)
        .cornerRadius(8.0)
    }
}
