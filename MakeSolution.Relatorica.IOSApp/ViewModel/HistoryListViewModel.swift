//
//  HistoryListViewModel.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/2/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation


class HistoryListViewModel:ObservableObject {
    
    @Published var historiesResponseData = [HistoriesResponseViewModel]()
    
    init(token: String?){
        ApiNetworking().getHistoriesToBuy(token: token) {
            historiesResponseData in
            if let historiesResponseData = historiesResponseData{
                self.historiesResponseData = historiesResponseData.Data.map(HistoriesResponseViewModel.init)
            }
        }
    }
}


struct HistoriesResponseViewModel{
    
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
