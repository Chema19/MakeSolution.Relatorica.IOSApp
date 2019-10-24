//
//  ChildsView.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 10/19/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct ChildsView: View {
    var body: some View {
         ZStack {
                   Color.yellow
                       .edgesIgnoringSafeArea(.all)
                   Text("About View")
                       .font(.largeTitle)
               }
    }
}

struct ChildsView_Previews: PreviewProvider {
    static var previews: some View {
        ChildsView()
    }
}
