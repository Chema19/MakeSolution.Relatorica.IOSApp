//
//  CardViewChild.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/22/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct CardViewChild: View {
    
    var image: String
    var name: String
    var fechaNacimiento: String
    
    var body: some View {
        VStack{
            Image(image).shadow(radius: 10).frame(width:280, height: 250, alignment: .center).padding(.top,20)
            HStack {
               VStack(alignment: .leading) {
                    Text(name)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text(fechaNacimiento.components(separatedBy: "T")[0])
                       .fontWeight(.black)
                       .foregroundColor(.primary)
                       .lineLimit(3)
               }
               .layoutPriority(140)
        
               Spacer()
            }.padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 2)).padding([.top, .horizontal])
    }
}
