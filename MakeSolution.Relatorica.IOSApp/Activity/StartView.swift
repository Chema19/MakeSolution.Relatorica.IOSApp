//
//  StartView.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 10/21/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct StartView: View {
    
     @State var showLoginView: Bool = false
    
    var body: some View {
       VStack {
            if showLoginView {
                ContentView()
            } else {
                LoginView()
                
                Button("Login") {
                    self.showLoginView = true
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView().environmentObject(ViewRouter())
    }
}
