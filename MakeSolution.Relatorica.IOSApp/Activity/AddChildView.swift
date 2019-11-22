//
//  AddChildView.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/15/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct AddChildView: View {
    let preference = UserDefaults.standard
    @State var padreId: Int? = UserDefaults.standard.object(forKey:"PADREID") as? Int
    @State var token: String? = UserDefaults.standard.object(forKey:"TOKEN") as? String
    @ObservedObject private var childList = ChildListViewModel(fatherId: UserDefaults.standard.object(forKey:"PADREID") as? Int, token: UserDefaults.standard.object(forKey:"TOKEN") as? String)
    @State var childName=""
    @State var birthDate="2017-11-12"
    @State var registerDate=DateFormatter().string(from: Date())
    @State var state=""
    var lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Child Name", text:$childName).padding(.all).background(lightGreyColor).cornerRadius(5.0)
            
                Button(action: {
                    let child:ChildModel = .init(nombreCompleto: self.childName, fechaNacimiento: self.birthDate, fechaRegistro: self.registerDate, estado: self.state, padreId: self.padreId)
                    AddChildViewModel().postChild(child: child, token: self.token!) { resulto in
                        if resulto!.addChildResponse.Error == false {
                            let preferences = UserDefaults.standard
                            preferences.set(self.padreId, forKey: "PADREID")
                            preferences.set("Bearer " + self.token!, forKey: "TOKEN")
                        }
                    }
                }) {
                    Text("Add")
                }
                }.padding(.horizontal,28).padding(.top,15).edgesIgnoringSafeArea([.top])
            }
        }
    }


struct AddChildView_Previews: PreviewProvider {
    static var previews: some View {
        AddChildView()
    }
}
