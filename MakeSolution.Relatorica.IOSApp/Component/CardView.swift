//
//  CardView.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/12/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    var image: String
    var heading: String
    var author: String
    
    var body: some View {
        VStack{
            URLImage(url: image).shadow(radius: 10).frame(height: 200, alignment: .center).overlay(Rectangle().stroke(Color.white, lineWidth: 4))
            HStack {
               VStack(alignment: .leading) {
                   Text("Cuento Infantil")
                       .font(.headline)
                       .foregroundColor(.secondary)
                   Text(heading)
                       .font(.title)
                       .fontWeight(.black)
                       .foregroundColor(.primary)
                       .lineLimit(3)
                   Text(author.uppercased())
                       .font(.caption)
                       .foregroundColor(.secondary)
               }
               .layoutPriority(100)
        
               Spacer()
            }.padding()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: "", heading: "", author: "")
    }
}
