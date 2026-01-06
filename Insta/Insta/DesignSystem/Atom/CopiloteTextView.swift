//
//  CopiloteTextView.swift
//  Insta
//
//  Created by Ahmed Atia on 19/12/2025.
//

import SwiftUI

// MARK: - CopiloteTextStyle

enum CopiloteTextStyle {
    case title
    case subtitle
    case headline
    case body
    case caption
    case subheadline
    case caption2
    case custom(font: Font)

    // MARK: Internal

    var font: Font {
        switch self {
        case .headline: .headline
        case .subheadline: .subheadline
        case .caption2: .caption2
        case .title: .title2.bold()
        case .subtitle: .headline
        case .body: .body
        case .caption: .caption
        case let .custom(font): font
        }
    }
}

// MARK: - CopiloteTextView

struct CopiloteTextView: View {
    // MARK: Lifecycle

    init(
        text: String,
        style: CopiloteTextStyle
    ) {
        self.text = text
        self.style = style
    }

    // MARK: Internal

    let text: String
    let style: CopiloteTextStyle

    var body: some View {
        Text(text).font(style.font)
    }
}
