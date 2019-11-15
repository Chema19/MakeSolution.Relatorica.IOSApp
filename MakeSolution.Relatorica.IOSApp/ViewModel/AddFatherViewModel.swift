//
//  AddFatherViewModel.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/15/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

class AddFatherViewModel:ObservableObject {
    
    @Published var addFatherResponse:AddFatherResponseViewModel!
    
    func postAddFather(nombres: String?, apellidos: String?, credenciales: String?, contrasenia: String?, correo: String?, celular: String?, completion: @escaping(AddFatherResponseViewModel?)->()){
        
        LoginApiNetworking().postAddFather(nombres: nombres, apellidos: apellidos, credenciales: credenciales, contrasenia: contrasenia, correo: correo, celular: celular){
            fatherDataResponse in
            let fatherResponse = AddFatherResponseViewModel.init(addFatherResponse: fatherDataResponse)
            DispatchQueue.main.async{
                completion(fatherResponse)
            }
        }
    }
}

struct AddFatherResponseViewModel{
    var addFatherResponse: AddFatherResponse
    init(addFatherResponse:AddFatherResponse?){
        self.addFatherResponse = addFatherResponse!
    }
    var data: String {
        return self.addFatherResponse.Data
    }
    var message: String {
        return self.addFatherResponse.Message
    }
    
    var error: Bool {
        return self.addFatherResponse.Error
    }
}
