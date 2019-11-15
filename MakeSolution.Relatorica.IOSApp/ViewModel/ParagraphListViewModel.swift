//
//  ParagraphListViewModel.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/14/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ParagraphListViewModel: ObservableObject, Identifiable{
    @Published var parrafosResponseData = [ParagraphResponseViewModel]()
    init(token: String?,historyId: Int){
        ParagraphApiNetworking().getParagraphByHistory(token: token, historyId: historyId) {
            parrafosResponseData in
            if let parrafosResponseData = parrafosResponseData{
                self.parrafosResponseData = parrafosResponseData.Data.map(ParagraphResponseViewModel.init)
            }
        }
    }
}


