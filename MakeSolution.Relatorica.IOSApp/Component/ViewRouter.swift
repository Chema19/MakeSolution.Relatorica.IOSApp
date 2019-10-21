//
//  ViewRouter.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 10/21/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    var currentPage: String = "login" {
        didSet {
            withAnimation() {
                objectWillChange.send(self)
            }
        }
    }
}
