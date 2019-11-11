//
//  StoreApiNetworking.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/11/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation


class StoreApiNetworking{
    
    public lazy var historiaUrlGet: String = { return "\(ApiNetworking().baseUrl)/historiaapi/histories" }()
    
    func urlHistory(historyId:Int?) -> String{
           return "\(historiaUrlGet)/\(String(historyId!))"
    }
    
    func getHistoriesToBuy(token: String?, completion: @escaping(HistoriesResponse?)->()){
              let direccion = historiaUrlGet
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
                      let historiesResponse = try JSONDecoder().decode(HistoriesResponse.self, from: json)
                      DispatchQueue.main.async{
                          completion(historiesResponse)
                      }
                  } catch {
                      print("JSON error: \(error.localizedDescription)")
                  }
              }.resume()
    }
     
}
