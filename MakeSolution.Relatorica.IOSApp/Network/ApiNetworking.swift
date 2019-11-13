//
//  ApiNetworking.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 10/23/19.
//  Copyright © 2019 UPC. All rights reserved.
//
import Foundation

class ApiNetworking {
    public lazy var baseUrl: String = "http://18.188.102.230/Relatorica"
    public lazy var historiaUrlGet: String = { return "\(baseUrl)/historiaapi/histories" }()
    public lazy var loginUrlPost: String = { return "\(baseUrl)/loginapi/logins/fathers"}()
    public lazy var buyUrlPost: String = { return "\(baseUrl)/purchasesapi/purchases"}()
    public lazy var fatherUrlPost: String = { return "\(baseUrl)/loginapi/fathers"}()
    public lazy var childUrlPost:String={return "\(baseUrl)/childapi/childs"}()

    func urlPurchasesByFather(padreId: Int?) -> String {
        return "\(baseUrl)/purchasesapi/fathers/\(String(padreId!))/purchases"
    }
    
    func urlHistory(historyId:Int?) -> String{
        return "\(historiaUrlGet)/\(String(historyId!))"
    }
    
    func urlFatherProfile(padreId: Int?) -> String{
        return "\(baseUrl)/fatherapi/fathers/\(String(padreId!))"
    }

    func urlParagraph(historiaId: Int?) ->  String{
        return "\(baseUrl)/paragraphsapi/histories/\(String(historiaId!))/paragraphs"
    }

    func urlSonidoById(sonidoId: Int?) -> String{
        return "$\(baseUrl)/soundsapi/sounds/\(String(sonidoId!))"
    }
    func urlChildsByFather(fatherId:Int?)->String{
        return "\(baseUrl)/childapi/fathers/\(String(fatherId!))/childs"
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
    
    func postLoginFather(username: String?, password: String?, completion: @escaping(LoginResponse?)->()){
        let direccion = self.loginUrlPost
        let url = URL(string: direccion)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let json: [String: Any] = ["Credenciales": username!, "Contrasenia":  password!]
        
        request.httpBody = json.percentEscaped().data(using: .utf8)
        
        URLSession.shared.dataTask(with: request){data, response, error in
            guard let json = data, error == nil else{
                DispatchQueue.main.sync {
                    completion(nil)
                }
                return
            }
            do {
                let purchaseResponse = try JSONDecoder().decode(LoginResponse.self, from: json)
                DispatchQueue.main.async{
                    completion(purchaseResponse)
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }.resume()
    }
    func getChildByFather(fatherId:Int?,token: String?,  completion: @escaping(ChildsResponse?)->()){
        let direccion = urlChildsByFather(fatherId: fatherId)
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
                let childsResponse = try JSONDecoder().decode(ChildsResponse.self, from: json)
                DispatchQueue.main.async{
                    completion(childsResponse)
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }.resume()
    }
    func postChild(child:ChildModel?,token:String?, completion: @escaping(AddChildResponse?)->()){
        let direccion = self.childUrlPost
        let url = URL(string: direccion)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let json: [String: Any] = ["HijoId": child!.HijoId, "NombreCompleto":  child!.NombreCompleto,
                                   "Estado": child!.Estado,"FechaRegistro":child!.FechaRegistro,
                                   "FechaNacimiento":child!.FechaNacimiento,"PadreId":child!.PadreId]
        print(json)
        request.httpBody = json.percentEscaped().data(using: .utf8)
        request.addValue(token!, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request){data, response, error in
            guard let json = data, error == nil else{
                DispatchQueue.main.sync {
                    completion(nil)
                }
                return
            }
            do {
                let childsResponse = try JSONDecoder().decode(AddChildResponse.self, from: json)
                DispatchQueue.main.async{
                    completion(childsResponse)
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }.resume()
    }
    
}

extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
    }
}
extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
//https://learnappmaking.com/urlsession-swift-networking-how-to/

