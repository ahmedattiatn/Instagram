//
//  HomeRouter.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

import SwiftUI

// MARK: - HomeRouter

enum HomeRouter {
    static func destinationForTappedStory(
        viewModel: HomeViewModel,
        initialFeedID: Int
    ) -> some View {
        StorieConfigurator.configureStorieView(
            with: viewModel,
            initialFeedID: initialFeedID
        )
    }
}
