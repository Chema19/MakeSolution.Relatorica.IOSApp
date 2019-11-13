//
//  RemoteImageURL.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/7/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI
import Combine

class ImageDownloader: ObservableObject{
    @Published var downloadedData: Data? = nil
    
    func downloadImage(url: String){
        guard let imageURL = URL(string: url) else {
            fatalError("Invalid URL")
        }
        DispatchQueue.global().async{
            let data = try? Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }
    }
}
