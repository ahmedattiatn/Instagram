//
//  HomeDependencies.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

import Factory

public enum HomeDependencies {
    public static func autoRegister(_ container: Container) {
        container.homeRepository.register {
            HomeRepository()
        }

        container.getFeedsUseCase.register {
            GetFeedsUseCase()
        }
    }
}
