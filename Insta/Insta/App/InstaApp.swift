//
//  InstaApp.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

import SwiftUI

@main
struct InstaApp: App {
    var body: some Scene {
        WindowGroup {
            HomeConfigurator.configureHomeView()
            // .preferredColorScheme(.light) // the app handle the dark mode but we can force the light mode also
        }
    }
}
