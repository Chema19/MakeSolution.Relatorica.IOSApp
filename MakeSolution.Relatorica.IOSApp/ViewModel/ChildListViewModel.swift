//
//  ChildListViewModel.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/2/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation


class ChildListViewModel:ObservableObject {
    
   @Published var childsResponseData = [ChildListResponseViewModel]()
    
    init(fatherId:Int?,token: String?){
        ApiNetworking().getChildByFather(fatherId: fatherId,token: token) {
            childsResponseData in
            if let childsResponseData = childsResponseData{
                self.childsResponseData = childsResponseData.Data.map(ChildListResponseViewModel.init)
                
            }
        }
    }
}

struct ChildListResponseViewModel{
    var childModel:ChildModel
    init(childModel:ChildModel){
        self.childModel=childModel
    }

    var hijoId:Int{
        self.childModel.HijoId!
    }
    var nombreCompleto:String{
        self.childModel.NombreCompleto
    }
    var fechaNacimiento:String{
        self.childModel.FechaNacimiento
    }
    var fechaRegistro:String{
        self.childModel.FechaRegistro
    }
    var estado:String{
        self.childModel.Estado
    }
    var padreId:Int{
        self.childModel.PadreId
    }
}
