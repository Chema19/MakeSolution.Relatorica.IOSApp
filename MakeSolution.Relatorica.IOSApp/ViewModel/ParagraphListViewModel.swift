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

final class ParagraphListViewModel: ObservableObject, Identifiable{
    //@Published var parrafosResponseData = [ParagraphResponseViewModel]()
    
    public let didChange = PassthroughSubject<ParagraphListViewModel, Never>()
    
    var token: String? {
        didSet { didChange.send(self) }
    }
    var historyId: Int{
        didSet { didChange.send(self) }
    }
    var parrafosResponseData: [ParagraphModel]  = []{
        didSet { didChange.send(self) }
    }
    
    init(token: String?,historyId: Int){
        self.token = token
        self.historyId = historyId
            
        let direccion = ParagraphApiNetworking().urlParagraphByHistory(historyId: historyId)
        let url = URL(string: direccion)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(token!, forHTTPHeaderField: "Authorization")
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        session.dataTask(with: request){[weak self] (data, response, error) in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let wrapper = try! decoder.decode(ParagraphResponse.self, from: data!)
            self?.parrafosResponseData = wrapper.Data
        }.resume()
    }
    
    func fetch(){
        let direccion = ParagraphApiNetworking().urlParagraphByHistory(historyId: historyId)
        let url = URL(string: direccion)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(token!, forHTTPHeaderField: "Authorization")
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        session.dataTask(with: request){[weak self] (data, response, error) in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let wrapper = try! decoder.decode(ParagraphResponse.self, from: data!)
            self?.parrafosResponseData = wrapper.Data
        }.resume()
    }
    
}


