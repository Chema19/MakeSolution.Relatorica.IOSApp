//
//  ChildsView.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 10/19/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI
struct User:Identifiable{
    var id:Int
    var username,message:String
}
struct ChildsView: View {
    let preference = UserDefaults.standard
    @State var padreId: Int? = UserDefaults.standard.object(forKey:"PADREID") as? Int
    @State var token: String? = UserDefaults.standard.object(forKey:"TOKEN") as? String
    @ObservedObject private var childList = ChildListViewModel(fatherId: UserDefaults.standard.object(forKey:"PADREID") as? Int, token: UserDefaults.standard.object(forKey:"TOKEN") as? String)
    var body: some View {
        NavigationView{
        VStack {
        List(self.childList.childsResponseData, id:\.hijoId)
        { hijo in
                HStack{
                   //Image("algo")
                    VStack{
                        Text(hijo.nombreCompleto).font(.headline)
                        Text(hijo.fechaNacimiento).font(.subheadline)
                    }.padding(.leading,8)
                }.padding(.init(top:12,leading:0,bottom:8,trailing:0))
                
            }.navigationBarTitle(Text("Hijos"))
            NavigationLink(destination: AddChildView()){
                Text("Agregar Hijo")
            }
        }
        }
}
}

struct ChildsView_Previews: PreviewProvider {
    static var previews: some View {
        ChildsView()
    }
}
