//
//  URLImage.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/8/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct URLImage: View {
    
    let url: String
    
    @ObservedObject private var imageDownloader = ImageDownloader()
    
    init(url: String){
        self.url = url
        self.imageDownloader.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let imageData = self.imageDownloader.downloadedData{
            let img = UIImage(data: imageData)
            return VStack{
                Image(uiImage: img!).resizable()
            }
        }else{
            return VStack{
                Image("Login")
            }
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: Constants.imageURL)
    }
}
