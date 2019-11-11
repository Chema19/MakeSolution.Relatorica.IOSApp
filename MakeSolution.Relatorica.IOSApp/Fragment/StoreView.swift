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
        List(self.historiesList.historiesResponseData, id:\.historiaId)
         { histories in
            NavigationLink(destination: DetailStoreView(historiesResponseViewModel: histories)){
                VStack(alignment: .center, spacing: 1){
                    URLImage(url: histories.imagen).shadow(radius: 10).frame(height: 200, alignment: .center).overlay(Rectangle().stroke(Color.white, lineWidth: 4)).padding(15)
                    Text("Precio: S/. " + String(histories.precio)).font(.title)
                    Text(histories.nombre)
                }
            }
         }
            .navigationBarTitle(Text("Store stories"))
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
