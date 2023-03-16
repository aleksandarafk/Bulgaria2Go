//
//  PlacesApp.swift
//  Places
//
//  Created by Aleksandar Karamirev on 20/02/2023.
//

import SwiftUI

@main
struct PlacesApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
