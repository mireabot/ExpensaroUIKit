//
//  EXSmallEmptyState.swift
//  
//
//  Created by Mikhail Kolkov on 9/13/23.
//

import SwiftUI

/// A reusable view for displaying a compact empty state with a title, description, and an optional action button.
///
/// `EXSmallEmptyState` is designed for smaller empty state views, providing a concise title, description, and an action button.
///
/// ### Usage Example
/// ```swift
/// EXSmallEmptyState(
///     title: "No Recurrent Payments",
///     text: "You don't have any recurrent payments set up.",
///     buttonText: "Add Now",
///     isActive: false,
///     action: {
///         print("Action button tapped")
///     }
/// )
/// ```
///
/// ### Parameters
/// - `title`: A `String` representing the title of the empty state.
/// - `text`: A `String` providing a description of the empty state.
/// - `buttonText`: A `String` for the label of the action button.
/// - `isActive`: A `Bool` indicating whether the button is enabled (`false`) or disabled (`true`).
/// - `action`: A closure executed when the action button is tapped.
public struct EXSmallEmptyState: View {
    var title: String
    var text: String
    var buttonText: String
    var isActive: Bool
    var action: () -> Void

    /// Initializes the `EXSmallEmptyState` view.
    /// - Parameters:
    ///   - title: The title text of the empty state.
    ///   - text: A descriptive message for the empty state.
    ///   - buttonText: The label text for the action button.
    ///   - isActive: Indicates whether the action button is enabled (`false`) or disabled (`true`).
    ///   - action: A closure executed when the action button is tapped.
    public init(title: String, text: String, buttonText: String, isActive: Bool, action: @escaping () -> Void) {
        self.title = title
        self.text = text
        self.buttonText = buttonText
        self.isActive = isActive
        self.action = action
    }

    public var body: some View {
        EXBaseCard {
            HStack {
                VStack(alignment: .leading, spacing: 3) {
                    Text(title)
                        .font(.bodyMedium)
                    Text(text)
                        .foregroundColor(.darkGrey)
                        .font(.footnoteRegular)
                }
                Spacer()
                Button {
                    action()
                } label: {
                    Text(buttonText)
                        .font(.subheadlineSemibold)
                }
                .buttonStyle(EXSmallPrimaryButtonStyle())
                .disabled(isActive)
            }
        }
    }
}

#Preview {
    EXSmallEmptyState(
        title: "No Recurrent Payments",
        text: "You don't have any recurrent payments set up.",
        buttonText: "Add Now",
        isActive: false,
        action: {
            print("Action triggered")
        }
    )
    .padding([.leading, .trailing], 16)
}
