//
//  Factory+Autoregistering.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

import Factory

extension Container: @retroactive AutoRegistering {
    public func autoRegister() {
        HomeDependencies.autoRegister(self)
    }
}
