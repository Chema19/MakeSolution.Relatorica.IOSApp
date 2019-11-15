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
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }.tag(0)
            StoreView()
                .tabItem {
                    Image("store")
                    Text("Store")
                }.tag(1)
            ChildsView()
            .tabItem {
                Image("childs")
                Text("Childs")
            }.tag(2)
        }.navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
