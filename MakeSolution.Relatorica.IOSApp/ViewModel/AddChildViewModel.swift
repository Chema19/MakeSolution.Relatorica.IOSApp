//
//  AddChildViewModel.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/15/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

class AddChildViewModel:ObservableObject {
    
    @Published var addChildResponse:AddChildResponseViewModel!
    
    func postChild(child:ChildModel,token:String?, completion: @escaping(AddChildResponseViewModel?)->()){
        ApiNetworking().postChild(child:child,token:token){
            childDataResponse in
            let childResponse = AddChildResponseViewModel.init(addChildResponse: childDataResponse)
            DispatchQueue.main.async{
                completion(childResponse)
            }
        }
    }
}

struct AddChildResponseViewModel{
    var addChildResponse: AddChildResponse
    init(addChildResponse:AddChildResponse?){
        self.addChildResponse = addChildResponse!
    }
    var data: ChildModel {
        return self.addChildResponse.Data
    }
    var message: String {
        return self.addChildResponse.Message
    }
    
    var error: Bool {
        return self.addChildResponse.Error
    }
}
