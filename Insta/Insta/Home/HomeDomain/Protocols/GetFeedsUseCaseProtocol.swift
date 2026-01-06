//
//  GetFeedsUseCaseProtocol.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

import Combine
import Factory

// MARK: - GetFeedsUseCaseProtocol

protocol GetFeedsUseCaseProtocol {
    func callAsFunction() async throws -> [Feed]?
}

extension Container {
    var getFeedsUseCase: Factory<GetFeedsUseCaseProtocol> {
        Factory(self) { GetFeedsUseCase() }
    }
}
