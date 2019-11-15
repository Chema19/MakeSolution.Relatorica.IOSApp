//
//  ParagraphNetworking.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/14/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

class ParagraphApiNetworking{
    
    public lazy var paragraphUrlGet: String = { return "\(ApiNetworking().baseUrl)/paragraphsapi/paragraphs" }()
    
    func urlParagraphByHistory(historyId:Int?) -> String{
        return "\(ApiNetworking().baseUrl)/paragraphsapi/histories/\(String(historyId!))/paragraphs"
    }
    
    func getParagraphByHistory(token: String?,historyId: Int, completion: @escaping(ParagraphResponse?)->()){
        let direccion = urlParagraphByHistory(historyId: historyId)
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
                      let paragraphsResponse = try JSONDecoder().decode(ParagraphResponse.self, from: json)
                      DispatchQueue.main.async{
                          completion(paragraphsResponse)
                      }
                  } catch {
                      print("JSON error: \(error.localizedDescription)")
                  }
              }.resume()
    }
     
}


