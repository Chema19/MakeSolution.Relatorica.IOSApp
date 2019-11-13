//
//  HistoriesResponse.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/2/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

struct HistoriesResponse: Codable {
    var Data: [HistoryModel]
    var Error: Bool
    var Message: String
}
