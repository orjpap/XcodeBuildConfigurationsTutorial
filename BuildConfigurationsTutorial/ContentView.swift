//
//  ContentView.swift
//  BuildConfigurationsTutorial
//
//  Created by Orestis on 20/4/20.
//  Copyright © 2020 Orestis Papadopoulos. All rights reserved.
//

import SwiftUI
#if DEVELOPMENT
import CryptoSwift
#endif

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Hello, World!")
            Text("Backend URL: \(API.backendURL)")


            #if DEVELOPMENT
            Text(getKey() ?? "").padding()
            #endif
        }
    }

    #if DEVELOPMENT
    private func getKey() -> String? {
        let password: Array<UInt8> = Array("s33krit".utf8)
        let salt: Array<UInt8> = Array("nacllcan".utf8)

        return try! PKCS5.PBKDF2(password: password, salt: salt, iterations: 4096, keyLength: 32, variant: .sha256).calculate().toBase64()
    }
    #endif
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
