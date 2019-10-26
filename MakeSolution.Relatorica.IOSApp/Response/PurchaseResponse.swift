//
//  PurchaseResponse.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 10/23/19.
//  Copyright © 2019 UPC. All rights reserved.
//

struct PurchaseResponse: Decodable {
    var Data: [PurchaseModel]? = nil //ASI SE CREAN LAS LISTAS DE OBJETOS
    var Error: Bool = false
    var Message: String? = nil
}
