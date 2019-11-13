//
//  HistoryModel.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/1/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

struct HistoryModel: Codable
{
    let HistoriaId: Int
    let Nombre: String
    let UsuarioId: Int
    let NombreUsuario: String
    let Argumento: String
    let FechaRegistro: String
    let Estado: String
    let Precio: Double
    let Editorial: String
    let Imagen: String
    
    init(HistoriaId: Int?,Nombre: String?,UsuarioId: Int?,NombreUsuario: String?,Argumento: String?, FechaRegistro: String?, Estado: String?, Precio: Double?, Editorial: String?, Imagen: String?){
        self.HistoriaId = HistoriaId!
        self.Nombre = Nombre!
        self.UsuarioId = UsuarioId!
        self.NombreUsuario = NombreUsuario!
        self.Argumento = Argumento!
        self.FechaRegistro = FechaRegistro!
        self.Estado = Estado!
        self.Precio = Precio!
        self.Editorial = Editorial!
        self.Imagen = Imagen!
    }
    
}


