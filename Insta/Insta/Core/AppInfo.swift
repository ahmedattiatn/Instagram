//
//  AppInfo.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

import Foundation

// MARK: - AppInfo

struct AppInfo {
    // MARK: Lifecycle

    private init() {}

    // MARK: Internal

    static var shared = AppInfo()

    var apiBaseUrl: String {
        readFromInfoPlist(withKey: "ApiBaseUrl") ?? "[Required] Info.plist missing ApiBaseUrl"
    }

    // MARK: Private

    /// lets hold a reference to the Info.plist of the app as Dictionary
    private let infoPlistDictionary = Bundle.main.infoDictionary
}

extension AppInfo {
    /// Retrieves and returns associated values (of Type String) from info.Plist of the app.
    private func readFromInfoPlist(withKey key: String) -> String? {
        infoPlistDictionary?[key] as? String
    }
}
