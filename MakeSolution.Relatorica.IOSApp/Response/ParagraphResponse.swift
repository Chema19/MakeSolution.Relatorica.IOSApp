//
//  ParagraphResponse.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/14/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

struct ParagraphResponse: Codable {
    var Data: [ParagraphModel]
    var Error: Bool
    var Message: String
}
