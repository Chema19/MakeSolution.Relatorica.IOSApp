//
//  AudioPlayer.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/20/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import AVFoundation
import Combine
import SwiftUI

class SoundViewModel: ObservableObject {

    var sound: AVAudioPlayer?
    //var soundId: Int
    //var token: String

    let didChange = PassthroughSubject<SoundViewModel, Never>()

    var isPlaying: Bool = false {
         willSet {
            didChange.send(self)
        }
    }
    
    /*var SonidoResponseData: SoundModel? = nil {
        didSet {
            didChange.send(self)
        }
    }*/
    
    /*init(token: String,soundId: Int){
        self.token = token
        self.soundId = soundId
        
        let direccion = SoundApiNetworking().urlSoundById(soundId: soundId)
        let url = URL(string: direccion)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(token, forHTTPHeaderField: "Authorization")
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        session.dataTask(with: request){[weak self] (data, response, error) in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let wrapper = try! decoder.decode(SoundResponse.self, from: data!)
            self?.SonidoResponseData = wrapper.Data
        }.resume()
    }*/
    
    //@Published var soundResponse: SoundResponseViewModel!
    
    func getSoundData(token: String,soundId: Int, completion: @escaping(SoundResponseViewModel?)->()){
        //self.token = token
        //elf.soundId = soundId
        
        let direccion = SoundApiNetworking().urlSoundById(soundId: soundId)
        let url = URL(string: direccion)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(token, forHTTPHeaderField: "Authorization")
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        session.dataTask(with: request){[weak self] (data, response, error) in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let wrapper = try! decoder.decode(SoundResponse.self, from: data!)
            //self?.SonidoResponseData = wrapper
            
            let sonidoResponse = SoundResponseViewModel.init(soundResponse: wrapper)
            
            DispatchQueue.main.async{
                           completion(sonidoResponse)
                       }
        }.resume()
    }

    func playSound() {
        if let path = Bundle.main.path(forResource: "https://www.pacdv.com/sounds/preview/oh-yeah-1.mp3", ofType: "wav") {
            do {
                sound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                print("Playing sound")
                sound!.play()
            } catch {
                print( "Could not find file")
            }
        }
    }
}


struct SoundResponseViewModel{
    
    var soundResponse: SoundResponse
    
    init(soundResponse: SoundResponse?){
        self.soundResponse = soundResponse!
    }
    
    var data: SoundModel {
        return self.soundResponse.Data
    }
    var message: String {
        return self.soundResponse.Message
    }
    
    var error: Bool {
        return self.soundResponse.Error
    }
}
