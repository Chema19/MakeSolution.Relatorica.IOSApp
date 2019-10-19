//
//  ContentView.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Developer on 10/18/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            Text("Home")
                .tabItem {
                    Image("home")
                    Text("Home")
                }.tag(0)
            Text("Store")
                .tabItem {
                    Image("store")
                    Text("Store")
                }.tag(1)
            Text("Childs")
            .tabItem {
                Image("childs")
                Text("Childs")
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
