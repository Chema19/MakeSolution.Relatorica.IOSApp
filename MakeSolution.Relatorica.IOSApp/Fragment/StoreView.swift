//
//  StoreView.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 10/19/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct StoreView: View {
    var body: some View {
         ZStack {
                   Color.blue
                       .edgesIgnoringSafeArea(.all)
                   Text("About View")
                       .font(.largeTitle)
               }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
