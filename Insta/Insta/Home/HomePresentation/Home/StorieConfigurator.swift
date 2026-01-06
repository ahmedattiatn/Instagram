//
//  StorieConfigurator.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

import Foundation

enum StorieConfigurator {
    static func configureStorieView(
        with viewModel: HomeViewModel,
        initialFeedID: Int
    ) -> StoryView {
        StoryView(viewModel: viewModel, initialFeedID: initialFeedID)
    }
}
