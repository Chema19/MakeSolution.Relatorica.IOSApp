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
    
    public lazy var buyUrlPost: String = { return "\(baseUrl)/purchasesapi/purchases"}()
    public lazy var fatherUrlPost: String = { return "\(baseUrl)/loginapi/fathers"}()

    func urlFatherProfile(padreId: Int?) -> String{
        return "\(baseUrl)/fatherapi/fathers/\(String(padreId!))"
    }

    func urlParagraph(historiaId: Int?) ->  String{
        return "\(baseUrl)/paragraphsapi/histories/\(String(historiaId!))/paragraphs"
    }

    func urlSonidoById(sonidoId: Int?) -> String{
        return "$\(baseUrl)/soundsapi/sounds/\(String(sonidoId!))"
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

