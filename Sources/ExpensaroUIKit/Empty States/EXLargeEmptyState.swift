//
//  EXLargeEmptyState.swift
//  
//
//  Created by Mikhail Kolkov on 9/13/23.
//

import SwiftUI

/// A reusable view for displaying a large empty state with an icon, title, description, and a call-to-action button.
///
/// `EXLargeEmptyState` is designed to visually communicate empty or unavailable states in the application,
/// providing an icon, informative text, and an optional action button for user engagement.
///
/// ### Usage Example
/// ```swift
/// EXLargeEmptyState(
///     title: "No Data Available",
///     text: "You currently have no data to display.",
///     icon: .imageName("📊"),
///     isActive: false,
///     action: {
///         print("Retry button tapped")
///     }
/// )
/// ```
///
/// ### Parameters
/// - `title`: A `String` representing the main title of the empty state.
/// - `text`: A `String` providing a detailed description or context about the empty state.
/// - `icon`: An `IconType` representing the icon to display. It can be:
///     - `.imageName(String)`: A string-based icon, such as an emoji.
///     - `.image(Image)`: A SwiftUI `Image`, like a system or custom image.
/// - `isActive`: A `Bool` that determines whether the action button is enabled (`false`) or disabled (`true`).
/// - `action`: A closure executed when the action button is tapped.
public struct EXLargeEmptyState: View {
    var title: String
    var text: String
    var icon: IconType
    var isActive: Bool
    var action: () -> Void

    /// Initializes the `EXLargeEmptyState` view.
    /// - Parameters:
    ///   - title: The main title of the empty state.
    ///   - text: A detailed description or context about the empty state.
    ///   - icon: The icon to display (`IconType`).
    ///   - isActive: Indicates whether the action button is enabled (`false`) or disabled (`true`).
    ///   - action: A closure executed when the action button is tapped.
    public init(title: String, text: String, icon: IconType, isActive: Bool, action: @escaping () -> Void) {
        self.title = title
        self.text = text
        self.icon = icon
        self.isActive = isActive
        self.action = action
    }

    public var body: some View {
        EXBaseCard {
            VStack {
                VStack(spacing: 5) {
                    switch icon {
                    case .imageName(let imageName):
                        Text(imageName)
                            .foregroundColor(.primaryGreen)
                            .padding(.bottom, 5)
                    case .image(let image):
                        image
                            .foregroundColor(.primaryGreen)
                            .padding(.bottom, 5)
                    }
                    Text(title)
                        .font(.headlineBold)
                    Text(text)
                        .multilineTextAlignment(.center)
                        .font(.subheadlineRegular)
                        .foregroundColor(.darkGrey)
                }

                Button {
                    action()
                } label: {
                    Text("Retry") // Button text can be adjusted here if needed
                        .font(.subheadlineSemibold)
                }
                .buttonStyle(EXSmallPrimaryButtonStyle())
                .disabled(isActive)
                .padding(.top, 5)
            }
            .frame(maxWidth: .infinity)
        }
    }
}


// MARK: - Examples
#Preview {
    VStack {
        EXLargeEmptyState(
            title: "No Budget",
            text: "You haven't set up a budget yet. Create one to start tracking your expenses.",
            icon: .image(.init(systemName: "globe")),
            isActive: true,
            action: {}
        )
        EXLargeEmptyState(
            title: "No Expenses",
            text: "You currently have no expenses recorded. Start adding your expenses to see insights.",
            icon: .imageName("📊"),
            isActive: false,
            action: {}
        )
    }
    .padding([.leading, .trailing], 16)
}
