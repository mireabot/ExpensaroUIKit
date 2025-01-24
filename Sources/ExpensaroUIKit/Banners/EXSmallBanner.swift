//
//  EXSmallBanner.swift
//  
//
//  Created by Mikhail Kolkov on 9/13/23.
//

import SwiftUI

/// A compact banner component for displaying action prompts or empty states.
///
/// ### Usage Example
/// ```swift
/// // Call-to-action
/// EXSmallBanner(
///     title: "Enable Location",
///     text: "For better service discovery",
///     buttonText: "Enable",
///     isActive: true
/// ) {
///     requestLocation()
/// }
///
/// // Empty state
/// EXSmallBanner(
///     title: "No History",
///     text: "Start making transactions",
///     buttonText: "New Payment"
/// ) {
///     showPayment()
/// }
/// ```
///
/// ### Parameters
/// - `title`: Header text
/// - `text`: Description text
/// - `buttonText`: Action button label
/// - `isActive`: Button state
/// - `action`: Button callback
///
/// ###  Use Cases
/// - Compact CTAs
/// - Section empty states
/// - Quick actions
public struct EXSmallBanner: View {
    var title: String
    var text: String
    var buttonText: String
    var isActive: Bool
    var action: () -> Void

    public init(title: String, text: String, buttonText: String, isActive: Bool, action: @escaping () -> Void) {
        self.title = title
        self.text = text
        self.buttonText = buttonText
        self.isActive = isActive
        self.action = action
    }

    public var body: some View {
        EXBase {
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
    EXSmallBanner(
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
