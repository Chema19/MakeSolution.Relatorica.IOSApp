//
//  StartView.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 10/21/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct StartView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
       VStack {
            if viewRouter.currentPage == "login" {
                LoginView()
            } else if viewRouter.currentPage == "main" {
                ContentView()
                    .transition(.scale)
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView().environmentObject(ViewRouter())
    }
}
