//
//  ChildModel.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/2/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

struct ChildModel: Codable
{
    let HijoId: Int?
    let NombreCompleto: String
    let FechaNacimiento: String
    let FechaRegistro: String
    let Estado: String
    let PadreId: Int
    init(nombreCompleto:String?,fechaNacimiento:String?,fechaRegistro:String?,estado:String?,padreId:Int?){
        self.HijoId=nil
        self.NombreCompleto=nombreCompleto!
        self.FechaNacimiento=fechaNacimiento!
        self.FechaRegistro=fechaRegistro!
        self.Estado=estado!
        self.PadreId=padreId!
    }
}
    
