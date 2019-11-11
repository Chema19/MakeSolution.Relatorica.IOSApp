//
//  LoginViewModel.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/2/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation

class LoginViewModel{
    
    @Published var loginResponse: LoginResponseViewModel!
    
    func postLogin(username: String?, password: String?, completion: @escaping(LoginResponseViewModel?)->()){
        LoginApiNetworking().postLoginFather(username: username, password: password){
            loginDataResponse in
            let loginResponse = LoginResponseViewModel.init(loginResponse: loginDataResponse)
            DispatchQueue.main.async{
                completion(loginResponse)
            }
        }
    }
}

struct LoginResponseViewModel{
    
    var loginResponse: LoginResponse
    
    init(loginResponse:LoginResponse?){
        self.loginResponse = loginResponse!
    }
    
    var data: LoginModel {
        return self.loginResponse.Data
    }
    var message: String {
        return self.loginResponse.Message
    }
    
    var error: Bool {
        return self.loginResponse.Error
    }
}

