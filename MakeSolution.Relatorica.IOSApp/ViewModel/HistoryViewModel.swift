//
//  HistoriyViewModel.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/11/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

class HistoryViewModel:ObservableObject {
    
    @Published var historyResponseDataVM: HistoryResponseViewModel!
    
    init(historyId: Int, token: String?){
        PurchaseApiNetworking().getHistoryById(idHistory: historyId, token: token) {
            historyResponseData in
            let history = HistoryResponseViewModel.init(historyModel: historyResponseData!)
            self.historyResponseDataVM = history
        }
    }
}

struct HistoryResponseViewModel{
    
     var historyModel: HistoryModel
       
       init(historyModel:HistoryModel){
           self.historyModel = historyModel
       }
       
       var historiaId: Int {
           return self.historyModel.HistoriaId
       }
       var nombre: String {
           return self.historyModel.Nombre
       }
       var usuarioId: Int {
           return self.historyModel.UsuarioId
       }
       var nombreUsuario: String {
           return self.historyModel.NombreUsuario
       }
       var argumento: String {
           return self.historyModel.Argumento
       }
       var fechaRegistro: String {
           return self.historyModel.FechaRegistro
       }
       var estado: String {
           return self.historyModel.Estado
       }
       var precio: Double {
           return self.historyModel.Precio
       }
       var editorial: String {
           return self.historyModel.Editorial
       }
       var imagen: String {
           return self.historyModel.Imagen
       }
}
