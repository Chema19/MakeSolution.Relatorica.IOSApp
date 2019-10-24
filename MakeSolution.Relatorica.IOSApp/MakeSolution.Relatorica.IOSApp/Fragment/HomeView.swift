//
//  HomeView.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 10/19/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.red
            .edgesIgnoringSafeArea(.all)
            Text("Home View")
                .font(.largeTitle)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
