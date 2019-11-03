//
//  LoginResponse.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/2/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation


struct LoginResponse: Codable {
    var Data: LoginModel
    var Error: Bool
    var Message: String
}
