//
//  ChildListViewModel.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/2/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation


class ChildListViewModel:ObservableObject {
    
    @Published var childsResponseData = [ChildsResponseViewModel]()
    
    init(token: String?){
        StoreApiNetworking().getHistoriesToBuy(token: token) {
            historiesResponseData in  
            if let historiesResponseData = historiesResponseData{
                //self.historiesResponseData = historiesResponseData.Data.map(HistoriesResponseViewModel.init)
            }
        }
    }
}

struct ChildsResponseViewModel{
    
  
}
