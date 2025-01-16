//
//  EXInfoCard.swift
//
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

/// A customizable information card with an optional icon, title, description, and an action button.
///
/// `EXInfoCard` is a flexible UI component for displaying informative content, such as titles and descriptions,
/// accompanied by an optional icon and an action button. This card is styled to fit various contexts, such as presenting
/// promotional messages, tips, or feature highlights.
///
/// ### Usage Example
/// ```swift
/// // Example with button
/// EXInfoCard(
///     title: "Monthly Plan",
///     text: "Learn more about our month-to-month plan.",
///     icon: .imageName("📦"),
///     isButton: true,
///     buttonIcon: .init(systemName: "info.circle"),
///     buttonAction: {
///         print("Button tapped")
///     }
/// )
///
/// // Example without button
/// EXInfoCard(
///     title: "Annual Plan",
///     text: "Explore benefits of the annual subscription.",
///     icon: .imageName("📅"),
///     isButton: false
/// )
/// ```
public struct EXInfoCard: View {
    var title: String
    var text: String
    var icon: IconType?
    var isButton: Bool
    var buttonIcon: Image?
    var buttonAction: (() -> Void)?
    
    public init(
        title: String,
        text: String,
        icon: IconType? = nil,
        isButton: Bool = false,
        buttonIcon: Image? = nil,
        buttonAction: (() -> Void)? = nil
    ) {
        self.title = title
        self.text = text
        self.icon = icon
        self.isButton = isButton
        self.buttonIcon = buttonIcon
        self.buttonAction = buttonAction
    }
    
    public var body: some View {
        EXBaseCard {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    if let icon = icon {
                        switch icon {
                        case .imageName(let imageName) where !imageName.isEmpty:
                            Text(imageName)
                        case .image(let image):
                            image
                                .foregroundColor(.primaryGreen)
                        default:
                            EmptyView()
                        }
                    }
                    Text(title)
                        .font(.system(.headline, weight: .semibold))
                    Text(text)
                        .font(.system(.subheadline, weight: .regular))
                        .foregroundColor(.darkGrey)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                if isButton, let buttonIcon = buttonIcon, let buttonAction = buttonAction {
                    Button(action: {
                        buttonAction()
                    }) {
                        HStack {
                            buttonIcon
                            Text("How it works")
                                .font(.system(.subheadline, weight: .semibold))
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(EXPrimaryButtonStyle(showLoader: .constant(false)))
                    .padding(.top, 5)
                }
            }
        }
    }
}

// MARK: Examples
#Preview {
    VStack(spacing: 16) {
        // Example with button
        EXInfoCard(
            title: "Monthly Plan",
            text: "Learn more about our month-to-month plan.",
            icon: .imageName("📦"),
            isButton: true,
            buttonIcon: .init(systemName: "info.circle"),
            buttonAction: {
                print("Button tapped")
            }
        )
        .padding([.leading, .trailing], 16)
        
        // Example without button
        EXInfoCard(
            title: "Annual Plan",
            text: "Explore benefits of the annual subscription.",
            icon: .imageName("📅"),
            isButton: false
        )
        .padding([.leading, .trailing], 16)
    }
}
