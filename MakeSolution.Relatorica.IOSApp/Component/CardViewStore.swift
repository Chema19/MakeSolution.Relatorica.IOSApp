//
//  CardViewStore.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 11/12/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct CardViewStore: View {
    var image: String
    var nombre: String
        var precio: String
    var autor: String
    var CapsuleButton = TokenButton(capsuleText: "Capsule")
        
        var body: some View {
            VStack{
                URLImage(url: image).shadow(radius: 10).frame(height: 200, alignment: .center).overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                HStack {
                   VStack(alignment: .leading) {
                       Text(nombre)
                           .font(.headline)
                           .foregroundColor(.primary)
                        
                        Text(precio)
                           .font(.title)
                           .fontWeight(.black)
                           .foregroundColor(.primary)
                           .lineLimit(2)
                       Text(autor.uppercased())
                           .font(.caption)
                           .foregroundColor(.secondary)
                        VStack(alignment: .center) {
                            Button(action: { }) {
                                Text("GET")
                            }.padding(.top,10)
                        }
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


struct CardViewStore_Previews: PreviewProvider {
    static var previews: some View {
        CardViewStore(image: "", nombre: "",precio: "", autor: "")
    }
}
