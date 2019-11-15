//
//  AddChildResponse.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/15/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

struct AddChildResponse: Codable {
    var Data: ChildModel
    var Error: Bool
    var Message: String
}
