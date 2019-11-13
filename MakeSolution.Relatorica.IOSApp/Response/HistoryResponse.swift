//
//  HistoryResponse.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/1/19.
//  Copyright © 2019 UPC. All rights reserved.
//

struct HistoryResponse: Codable {
    var Data: HistoryModel
    var Error: Bool
    var Message: String
}
