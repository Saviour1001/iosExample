//
//  Web3AuthiOSExampleApp.swift
//  Web3AuthiOSExample
//
//  Created by Harsh Ghodkar on 17/11/22.
//

import SwiftUI
import Web3Auth

@main
struct MainApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(vm: ViewModel())
        }
    }
}

