//
//  EXLargeBanner.swift
//  
//
//  Created by Mikhail Kolkov on 9/13/23.
//

import SwiftUI

/// A prominent banner component with icon, text content, and an action button, designed for key user actions and empty states.
///
/// ### Usage Example
/// ```swift
/// // Call-to-action banner
/// EXLargeBanner(
///     title: "Enable Notifications",
///     text: "Stay updated with latest news and offers",
///     buttonText: "Enable",
///     icon: .image(Image(systemName: "bell.badge")),
///     isActive: false
/// ) {
///     requestNotifications()
/// }
///
/// // Empty state banner
/// EXLargeBanner(
///     title: "No Messages",
///     text: "Your inbox is currently empty",
///     buttonText: "Refresh",
///     icon: .imageName("📬"),
///     isActive: true
/// ) {
///     refreshInbox()
/// }
/// ```
///
/// ### Parameters
/// - `title`: Primary heading text
/// - `text`: Supporting description text
/// - `buttonText`: Action button label
/// - `icon`: Banner icon (.image for SF Symbols/custom images or .imageName for emoji)
/// - `isActive`: Button enabled/disabled state
/// - `action`: Callback triggered when button is tapped
///
/// ### Use Cases
/// - Empty state indicators
/// - Feature onboarding
/// - Permission requests
/// - Status messages
/// - Call-to-action prompts
public struct EXLargeBanner: View {
    var title: String
    var text: String
    var buttonText: String
    var icon: IconType
    var isActive: Bool
    var action: () -> Void

    public init(title: String, text: String, buttonText: String, icon: IconType, isActive: Bool, action: @escaping () -> Void) {
        self.title = title
        self.text = text
        self.buttonText = buttonText
        self.icon = icon
        self.isActive = isActive
        self.action = action
    }

    public var body: some View {
        EXBase {
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
                    Text(buttonText)
                        .font(.subheadlineSemibold)
                }
                .buttonStyle(EXSmallPrimaryButtonStyle())
                .disabled(!isActive)
                .padding(.top, 5)
            }
            .frame(maxWidth: .infinity)
        }
    }
}


// MARK: - Examples
#Preview {
    VStack {
         EXLargeBanner(
             title: "Enable Notifications",
             text: "Stay updated with latest news and offers",
             buttonText: "Enable",
             icon: .image(Image(systemName: "bell.badge")),
             isActive: true,
             action: {}
         )
        
         EXLargeBanner(
             title: "No Messages",
             text: "Your inbox is currently empty",
             buttonText: "Refresh",
             icon: .imageName("📬"),
             isActive: true,
             action: {}
         )
    }
    .padding([.leading, .trailing], 16)
}
