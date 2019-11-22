//
//  SoundApiNetworking.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/20/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import Foundation


class SoundApiNetworking{
    
    public lazy var SoundUrlGet: String = { return "\(ApiNetworking().baseUrl)/soundsapi/sounds" }()
    
    func urlSoundById(soundId:Int?) -> String{
        return "\(ApiNetworking().baseUrl)/soundsapi/sounds/\(String(soundId!))"
    }
}
