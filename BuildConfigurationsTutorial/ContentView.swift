//
//  ContentView.swift
//  BuildConfigurationsTutorial
//
//  Created by Orestis on 20/4/20.
//  Copyright © 2020 Orestis Papadopoulos. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Hello, World!")
            Text("Backend URL: \(API.backendURL)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
