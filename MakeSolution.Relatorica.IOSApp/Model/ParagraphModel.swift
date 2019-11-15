//
//  ParagraphModel.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/14/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

struct ParagraphModel: Codable
{
    let ParrafoId: Int
    let Texto: String
    let Orden: Int
    let HistoriaId: Int
    let SonidoId: Int
    let FechaRegistro: String
    let Estado: String
}
