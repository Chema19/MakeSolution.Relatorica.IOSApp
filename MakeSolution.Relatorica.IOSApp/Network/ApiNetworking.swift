//
//  ApiNetworking.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 10/23/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct ApiNetworking {
    public var baseUrl: String = "http://18.188.102.230/Relatorica";
    
    func getPurchasesByFather(padreId: Int) -> String {
        return "\(baseUrl)/purchasesapi/fathers/\(padreId)/purchases"
    }
}

