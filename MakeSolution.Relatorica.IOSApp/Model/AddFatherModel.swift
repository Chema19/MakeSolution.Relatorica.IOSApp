//
//  FatherModel.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/15/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

struct AddFatherModel: Codable
{
    let Nombres: String
    let Apellidos: String
    let Credenciales: String
    let Contrasenia: String
    let Correo: String
    let Celular: String
    let Estado: String
    let FechaNacimiento: String
}
