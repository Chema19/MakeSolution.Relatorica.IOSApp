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
        List(self.historiesList.historiesResponseData, id:\.historiaId)
         { histories in
             VStack(alignment: .leading){
                Text(histories.nombre).font(.title)
                Text(histories.argumento)
                Text("S/. " + String(histories.precio))
             }
         }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
