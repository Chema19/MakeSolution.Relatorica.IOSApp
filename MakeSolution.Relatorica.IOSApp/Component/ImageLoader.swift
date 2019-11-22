//
//  ImageLoader.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/20/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

class ImageLoader: ObservableObject {
    
    private static let imageCache = NSCache<AnyObject, AnyObject>()
    
    @Published var image: UIImage? = nil
    
    public func downloadImage(url: URL) {
        let urlString = url.absoluteString

        if let imageFromCache = ImageLoader.imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }

        URLSession.shared.dataTask(with: url) { (data, res, error) in
            guard let data = data, let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                ImageLoader.imageCache.setObject(image, forKey: urlString  as AnyObject)
                self?.image = image
            }
        }.resume()
    }
}
