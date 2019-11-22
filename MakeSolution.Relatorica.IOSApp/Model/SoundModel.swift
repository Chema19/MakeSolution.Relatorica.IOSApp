//
//  SonidoModel.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/20/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

struct SoundModel: Codable
{
    let SonidoId: Int
    let Nombre: String
    let Url: String
    let GeneroId: Int
    let UsuarioId: Int
    let FechaRegistro: String
    let Estado: String
}
