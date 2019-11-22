//
//  AddFatherView.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/15/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

enum ActiveAlert {
    case first, second
}

struct AddFatherView: View {
    @State private var nombres: String = ""
    @State private var apellidos: String = ""
    @State private var credenciales: String = ""
    @State private var contrasenia: String = ""
    @State private var correo: String = ""
    @State private var celular: String = ""
    
    @State var showLoginView: Bool = false
    @State private var showingAlert: Bool = false
    @State private var activeAlert: ActiveAlert = .first
    
    
    var lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    var CapsuleButton = TokenButton(capsuleText: "Capsule")
    //var TextButton = TokenButton(buttonText: "Text")
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Add User").padding(.top,75).font(Font.title.weight(.bold))
                VStack {
                    Text("Name")
                    TextField("Enter name", text:$nombres).padding(.all).background(lightGreyColor).cornerRadius(5.0)
                }.padding(.horizontal,28).padding(.top,30)
                VStack {
                    Text("Last name")
                    TextField("Enter last name", text:$apellidos).padding(.all).background(lightGreyColor).cornerRadius(5.0)
                }.padding(.horizontal,28).padding(.top,30)
                VStack {
                    Text("Username")
                    TextField("Enter username", text:$credenciales).padding(.all).background(lightGreyColor).cornerRadius(5.0)
                }.padding(.horizontal,28).padding(.top,30)
                VStack {
                    Text("Password")
                    TextField("Enter password", text:$contrasenia).padding(.all).background(lightGreyColor).cornerRadius(5.0)
                }.padding(.horizontal,28).padding(.top,30)
                VStack {
                    Text("Email")
                    TextField("Enter email", text:$correo).padding(.all).background(lightGreyColor).cornerRadius(5.0)
                }.padding(.horizontal,28).padding(.top,30)
                VStack {
                    Text("Phone")
                    TextField("Enter phone", text:$celular).padding(.all).background(lightGreyColor).cornerRadius(5.0)
                }.padding(.horizontal,28).padding(.top,30)
                
                
                Button(action: {
                    if self.nombres != "" && self.apellidos != "" && self.credenciales != "" && self.contrasenia != "" && self.correo != "" && self.celular != "" {
                        AddFatherViewModel().postAddFather(nombres: self.nombres, apellidos: self.apellidos, credenciales: self.credenciales, contrasenia: self.contrasenia, correo: self.correo, celular: self.celular){
                            resulto in
                            if resulto!.addFatherResponse.Error == false {
                                //let preferences = UserDefaults.standard
                                //preferences.set(resulto!.loginResponse.Data.PersonId, forKey: "PADREID")
                                //preferences.set("Bearer " + resulto!.loginResponse.Data.Token, forKey: "TOKEN")
                                self.showLoginView = false
                            }
                        }
                    }else{
                        self.activeAlert = .first
                        self.showingAlert = true
                    }
                }) {
                    Text("Register")
                }.padding(.top,20).buttonStyle(self.CapsuleButton.buttonStyle).alert(isPresented: $showingAlert){
                    switch activeAlert {
                        case .first:
                            return Alert(title: Text("Error"), message: Text("Complete all the fields"), dismissButton: .default(Text("Got it!")))
                        case .second:
                            return Alert(title: Text("Error"), message: Text("error"), dismissButton: .default(Text("Got it!")))
                    }
                }
            }
        }.edgesIgnoringSafeArea([.top])
    }
}

struct AddFatherView_Previews: PreviewProvider {
    static var previews: some View {
        AddFatherView()
    }
}



