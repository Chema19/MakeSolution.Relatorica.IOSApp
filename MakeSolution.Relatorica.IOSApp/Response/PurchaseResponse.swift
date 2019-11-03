//
//  PurchaseResponse.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 10/23/19.
//  Copyright © 2019 UPC. All rights reserved.
//

struct PurchaseResponse: Codable {
    var Data: [PurchaseModel] //ASI SE CREAN LAS LISTAS DE OBJETOS
    var Error: Bool
    var Message: String
}
