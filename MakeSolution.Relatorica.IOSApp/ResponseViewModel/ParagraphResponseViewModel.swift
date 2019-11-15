//
//  ParagraphResponseViewModel.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/14/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

struct ParagraphResponseViewModel:  Codable, Identifiable{
    
    var id = UUID()
    
    
    var paragraphModel: ParagraphModel
       
    init(paragraphModel:ParagraphModel){
        self.paragraphModel = paragraphModel
    }
    
    var parrafoId: Int {
        return self.paragraphModel.ParrafoId
    }
    var texto: String {
        return self.paragraphModel.Texto
    }
    var orden: Int {
        return self.paragraphModel.Orden
    }
    var estado: String {
        return self.paragraphModel.Estado
    }
    var fechaRegistro: String {
        return self.paragraphModel.FechaRegistro
    }
    var historiaId: Int {
        return self.paragraphModel.HistoriaId
    }
    var sonidoId: Int {
        return self.paragraphModel.SonidoId
    }
}
