//
//  AddPurchaseViewModel.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/22/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

class AddPurchaseViewModel:ObservableObject {
    
    @Published var addPurchaseResponse:AddPurchaseResponseViewModel!
    
    func postAddPurchase(padreId: Int?, historiaId: Int?, costo: Double?, token: String?, completion: @escaping(AddPurchaseResponseViewModel?)->()){
        
        PurchaseApiNetworking().postPurchase(padreId: padreId, historiaId: historiaId, costo: costo, token: token){
            purchaseDataResponse in
            let PurchaseResponse = AddPurchaseResponseViewModel.init(addPurchaseResponse: purchaseDataResponse)
            DispatchQueue.main.async{
                completion(PurchaseResponse)
            }
        }
    }
}

struct AddPurchaseResponseViewModel{
    var addPurchaseResponse: AddPurchaseResponse
    init(addPurchaseResponse:AddPurchaseResponse?){
        self.addPurchaseResponse = addPurchaseResponse!
    }
    var data: String {
        return self.addPurchaseResponse.Data
    }
    var message: String {
        return self.addPurchaseResponse.Message
    }
    
    var error: Bool {
        return self.addPurchaseResponse.Error
    }
}
