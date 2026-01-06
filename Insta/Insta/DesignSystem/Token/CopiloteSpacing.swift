//
//  CopiloteSpacing.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

import Foundation

public enum CopiloteSpacing: CGFloat, CaseIterable {
    /// No spacing (0 pt)
    case none = 0
    /// xtiny spacing (4 pts)
    case xtiny = 4
    /// tiny spacing (8 pts)
    case tiny = 8
    /// medium spacing (16 pts)
    case medium = 16
    /// big spacing (18 pts)
    case big = 18

    // MARK: Public

    public func callAsFunction() -> CGFloat {
        rawValue
    }
}
