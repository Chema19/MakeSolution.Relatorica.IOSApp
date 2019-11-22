//
//  StoryRowView.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/20/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct StoryRowView: View {
        var image: String
        var heading: String
        var author: String
          
        @ObservedObject var imageLoader: ImageLoader = ImageLoader()
    
        var body: some View {
        ZStack(alignment: .bottomLeading) {
           if (imageLoader.image != nil) {
                GeometryReader { geometry in
                    Image(uiImage: self.imageLoader.image!)
                        .resizable(resizingMode: Image.ResizingMode.stretch)
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: geometry.size.width)
                        .clipped()
                }
            }
            VStack(alignment: .leading) {
                Text(heading)
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .lineLimit(1)
                Text("Cuento infantil")
                    .font(.subheadline)
                    .foregroundColor(Color.white)
                    .lineLimit(2)
                Text(author)
                    .font(.caption)
                    .foregroundColor(Color.white)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity, alignment: .bottomLeading)
            .padding(EdgeInsets.init(top: 16, leading: 16, bottom: 16, trailing: 16))
            .background(Rectangle().foregroundColor(Color.black).opacity(0.6).blur(radius: 2.5))
        }
        .background(Color.secondary)
        .cornerRadius(10)
        .shadow(radius: 20)
        .padding(EdgeInsets.init(top: 8, leading: 0, bottom: 8, trailing: 0))
        .frame(height: 300)
        .onAppear {
            if let url = URL(string: self.image) {
                self.imageLoader.downloadImage(url: url)
            }
        }
    }
}

