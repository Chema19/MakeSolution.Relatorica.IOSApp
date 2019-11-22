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
                    Image(systemName: "cart.fill")
                    Text("Store")
            }.tag(1)
            ChildsView()
                .tabItem {
                    Image(systemName: "person.3.fill")
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
