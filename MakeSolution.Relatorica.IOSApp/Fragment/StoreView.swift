//
//  StoreView.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 10/19/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct StoreView: View {
    
    let preference = UserDefaults.standard
    @State var padreId: Int? = UserDefaults.standard.object(forKey:"PADREID") as? Int
    @State var token: String? = UserDefaults.standard.object(forKey:"TOKEN") as? String
     
    @ObservedObject private var historiesList = HistoryListViewModel(token: UserDefaults.standard.object(forKey:"TOKEN") as? String)
    
    var body: some View {
        NavigationView{
            List(self.historiesList.historiesResponseData, id:\.historiaId){ histories in
                NavigationLink(destination: DetailStoreView(historiesResponseVM: histories)){
                    VStack(alignment: .center, spacing: 1){
                        CardViewStore(image: histories.imagen, nombre: histories.nombre, precio: "Precio: S/. " + String(describing:  histories.precio) , autor: histories.editorial)
                    }
                }
            }
            .navigationBarTitle(Text("Store stories"))
        }//.edgesIgnoringSafeArea([.all])
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
