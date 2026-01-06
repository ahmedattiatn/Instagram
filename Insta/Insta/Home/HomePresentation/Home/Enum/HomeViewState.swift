//
//  HomeViewState.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

// MARK: - HomeViewState

enum HomeViewState: Equatable {
    case loading
    case empty
    case loadedContent
    case error(String)
}
