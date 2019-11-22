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
    var CapsuleButton = TokenButton(capsuleText: "Capsule")
    let image = ["hero1", "hero2", "hero3","hero4", "hero5", "hero6","hero7", "hero8", "hero9","hero10", "hero11", "hero12"]
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: AddChildView()){
                    Text("Add Child")
                }.padding(.top,10).buttonStyle(self.CapsuleButton.buttonStyle)
                List(self.childList.childsResponseData, id:\.hijoId){ hijo in
                    CardViewChild(image: self.image.randomElement()!, name: hijo.nombreCompleto, fechaNacimiento: hijo.fechaNacimiento)
                }
            }.navigationBarTitle(Text("Hijos"))
        }//.edgesIgnoringSafeArea([.all])
    }
}

/*struct ChildsView_Previews: PreviewProvider {
    static var previews: some View {
        ChildsView()
    }
}*/
