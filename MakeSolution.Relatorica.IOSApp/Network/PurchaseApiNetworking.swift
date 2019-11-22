//
//  PurchaseApiNetworking.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/11/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

class PurchaseApiNetworking{
    
    
    public lazy var historiaUrlGet: String = { return "\(ApiNetworking().baseUrl)/historiaapi/histories" }()
    
    func urlHistory(historyId:Int?) -> String{
           return "\(historiaUrlGet)/\(String(historyId!))"
       }
    
    func urlPurchasesPost() -> String {
        return "\(ApiNetworking().baseUrl)/purchasesapi/purchases"
    }
    
    func urlPurchasesByFather(padreId: Int?) -> String {
           return "\(ApiNetworking().baseUrl)/purchasesapi/fathers/\(String(padreId!))/purchases"
       }
    
    func getPurchasesByFather(idPadre: Int?, token: String?, completion: @escaping(PurchaseResponse?)->()){
        let direccion = urlPurchasesByFather(padreId: idPadre)
        let url = URL(string: direccion)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(token!, forHTTPHeaderField: "Authorization")
              //let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])//ENN CASO DE POST ASI
        URLSession.shared.dataTask(with: request){data, response, error in
            guard let json = data, error == nil else{
                DispatchQueue.main.sync {
                    completion(nil)
                }
                return
            }
            do {
                let purchaseResponse = try JSONDecoder().decode(PurchaseResponse.self, from: json)
                DispatchQueue.main.async{
                    completion(purchaseResponse)
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func getHistoryById(idHistory: Int?, token: String?, completion: @escaping(HistoryModel?)->()){
       let direccion = urlHistory(historyId: idHistory)
       let url = URL(string: direccion)!
       var request = URLRequest(url: url)
       request.httpMethod = "GET"
       request.addValue("application/json", forHTTPHeaderField: "Content-Type")
       request.addValue(token!, forHTTPHeaderField: "Authorization")
       URLSession.shared.dataTask(with: request){data, response, error in
           guard let json = data, error == nil else{
               DispatchQueue.main.sync {
                   completion(nil)
               }
               return
           }
           do {
               let historyResponse = try JSONDecoder().decode(HistoryResponse.self, from: json)
               //let posts = try JSONDecoder().decode(PurchaseResponse.self,from:json)
               DispatchQueue.main.async{
                   completion(historyResponse.Data)
               }
           } catch {
               print("JSON error: \(error.localizedDescription)")
           }
       }.resume()
   }
    
    func postPurchase(padreId: Int?,historiaId: Int?, costo: Double?, token: String?, completion: @escaping(AddPurchaseResponse?)->()){
        let direccion = urlPurchasesPost()
        let url = URL(string: direccion)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue(token!, forHTTPHeaderField: "Authorization")
        let compraId: Int? = nil
        
        let jsonResult: [String: Any] = ["CompraId": compraId as Any, "PadreId":  padreId!,"HistoriaId": historiaId!, "FechaCompra":  "09/18/2019", "Costo":  costo!,"Estado": "ACT", ]
        
        request.httpBody = jsonResult.percentEscaped().data(using: .utf8)
        
        URLSession.shared.dataTask(with: request){data, response, error in
            guard let json = data, error == nil else{
                DispatchQueue.main.sync {
                    completion(nil)
                }
                return
            }
            do {
                let purchaseResponse = try JSONDecoder().decode(AddPurchaseResponse.self, from: json)
                //let posts = try JSONDecoder().decode(PurchaseResponse.self,from:json)
                DispatchQueue.main.async{
                    completion(purchaseResponse)
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }.resume()
    }
}