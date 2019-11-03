//
//  LoginFatherModel.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/2/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

struct LoginFatherModel: Codable
{
    let Credenciales: String
    let Contrasenia: String
    
    init(Credenciales :String?, Contrasenia: String?){
        self.Credenciales = Credenciales!
        self.Contrasenia = Contrasenia!
    }
}
