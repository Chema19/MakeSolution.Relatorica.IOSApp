//
//  SoundResponse.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/20/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

struct SoundResponse: Codable {
    var Data: SoundModel //ASI SE CREAN LAS LISTAS DE OBJETOS
    var Error: Bool
    var Message: String
}
