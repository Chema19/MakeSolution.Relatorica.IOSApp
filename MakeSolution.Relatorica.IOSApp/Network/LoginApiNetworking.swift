//
//  LoginApiNetworking.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/11/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

class LoginApiNetworking{
    
    public lazy var loginUrlPost: String = { return "\(ApiNetworking().baseUrl)/loginapi/logins/fathers"}()
    public lazy var fatherUrlPost: String = { return "\(ApiNetworking().baseUrl)/loginapi/fathers"}()
    
    func postLoginFather(username: String?, password: String?, completion: @escaping(LoginResponse?)->()){
        let direccion = self.loginUrlPost
        let url = URL(string: direccion)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let jsonResult: [String: Any] = ["Credenciales": username!, "Contrasenia":  password!]
        
        request.httpBody = jsonResult.percentEscaped().data(using: .utf8)
        
        URLSession.shared.dataTask(with: request){data, response, error in
            guard let json = data, error == nil else{
                DispatchQueue.main.async {
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
                return
            }
        }.resume()
    }
    
    
    func postAddFather(nombres: String?, apellidos: String?, credenciales: String?, contrasenia: String?, correo: String?, celular: String?,completion: @escaping(AddFatherResponse?)->()){
         let direccion = self.fatherUrlPost
         let url = URL(string: direccion)!
         var request = URLRequest(url: url)
         request.httpMethod = "POST"
         request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let jsonResult: [String: Any] = ["Nombres": nombres!, "Apellidos":  apellidos!,"Credenciales": credenciales!, "Contrasenia":  contrasenia!,"Correo": correo!, "Celular":  celular!,"Estado": "ACT", "FechaNacimiento":"09/18/2019"]
         
         request.httpBody = jsonResult.percentEscaped().data(using: .utf8)
         
         URLSession.shared.dataTask(with: request){data, response, error in
             guard let json = data, error == nil else{
                 DispatchQueue.main.async {
                     completion(nil)
                 }
                 return
             }
             
             do {
                 let purchaseResponse = try JSONDecoder().decode(AddFatherResponse.self, from: json)
                 DispatchQueue.main.async{
                     completion(purchaseResponse)
                 }
             } catch {
                 print("JSON error: \(error.localizedDescription)")
                 return
             }
         }.resume()
     }
}
