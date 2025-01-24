//
//  EXInfoCard.swift
//
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

/// A versatile card component that displays information with optional icon and customizable action button.
///
/// ### Usage Example
/// ```swift
/// // Basic info card
/// EXInfoCard(
///     title: "Free Delivery",
///     text: "Orders above $50 qualify for free delivery",
///     icon: .image(Image(systemName: "truck.fill"))
/// )
///
/// // Interactive info card with custom button
/// EXInfoCard(
///     title: "Earn Rewards",
///     text: "Learn how our points system works",
///     icon: .imageName("⭐"),
///     isButton: true,
///     buttonIcon: Image(systemName: "arrow.right"),
///     buttonText: "Learn More",
///     buttonAction: {
///         showRewardsInfo()
///     }
/// )
/// ```
///
/// ### Parameters
/// - `title`: Main heading text
/// - `text`: Supporting description text
/// - `icon`: Optional icon (.image or .imageName) displayed above title
/// - `isButton`: Whether to show action button
/// - `buttonIcon`: Icon displayed in action button when isButton is true
/// - `buttonText`: Custom text displayed in action button
/// - `buttonAction`: Callback triggered when button is tapped
///
/// ### Use Cases
/// - Feature explanations
/// - Promotional messages
/// - Help/FAQ sections
/// - Tutorial cards
/// - Service highlights
public struct EXInfoCard: View {
    var title: String
    var text: String
    var icon: IconType?
    var isButton: Bool
    var buttonIcon: Image?
    var buttonText: String? = nil
    var buttonAction: (() -> Void)?
    
    public init(
        title: String,
        text: String,
        icon: IconType? = nil,
        isButton: Bool = false,
        buttonIcon: Image? = nil,
        buttonText: String? = nil,
        buttonAction: (() -> Void)? = nil
    ) {
        self.title = title
        self.text = text
        self.icon = icon
        self.isButton = isButton
        self.buttonIcon = buttonIcon
        self.buttonText = buttonText
        self.buttonAction = buttonAction
    }
    
    public var body: some View {
        EXBase {
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
                
                if isButton, let buttonIcon = buttonIcon, let buttonText = buttonText, let buttonAction = buttonAction {
                    Button(action: {
                        buttonAction()
                    }) {
                        HStack {
                            Text(buttonText)
                                .font(.system(.subheadline, weight: .semibold))
                            buttonIcon
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
            title: "Earn Rewards",
            text: "Learn how our points system works",
            icon: .imageName("⭐"),
            isButton: true,
            buttonIcon: Image(systemName: "arrow.right"),
            buttonText: "Learn More",
            buttonAction: {}
        )
        
        // Example without button
        EXInfoCard(
            title: "Annual Plan",
            text: "Explore benefits of the annual subscription",
            icon: .imageName("📅"),
            isButton: false
        )
    }
    .padding(.horizontal, 16)
}
