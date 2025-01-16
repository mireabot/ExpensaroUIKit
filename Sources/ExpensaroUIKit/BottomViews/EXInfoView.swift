//
//  EXBottomInfoView.swift
//
//
//  Created by Mikhail Kolkov on 9/25/23.
//

import SwiftUI

/// A reusable  information view with a title, description, optional button, and customizable content.
///
/// `EXInfoView` provides a flexible layout for displaying information with optional interactivity through a button
/// and a customizable content view.
///
/// ### Usage Example
/// ```swift
/// EXInfoView(
///     title: "Important Update",
///     text: "Your subscription will expire soon. Renew now to continue enjoying premium features.",
///     isButton: true,
///     buttonText: "Renew Now",
///     action: {
///         print("Renew button tapped")
///     }
/// ) {
///     Text("Custom Content View")
///         .frame(maxWidth: .infinity, alignment: .center)
///         .background(Color.backgroundGrey)
/// }
///
/// // Example without button
/// EXInfoView(
///     title: "Notice",
///     text: "This is a read-only message.",
///     isButton: false
/// ) {
///     Text("Additional Content")
///         .frame(maxWidth: .infinity, alignment: .center)
///         .background(Color.backgroundGrey)
/// }
/// ```
public struct EXInfoView<ContentView: View>: View {
    var title: String
    var text: String
    var isButton: Bool
    var buttonText: String?
    let action: (() -> Void)?
    let contentView: ContentView?
    
    /// Initializes the `EXInfoView`.
    /// - Parameters:
    ///   - title: The main title text to display at the top.
    ///   - text: The description or informative text to display below the title.
    ///   - isButton: A Boolean indicating whether to display a button.
    ///   - buttonText: The text for the button. Required if `isButton` is `true`.
    ///   - action: A closure executed when the button is tapped. Optional if `isButton` is `false`.
    ///   - contentView: A closure returning a custom SwiftUI view displayed at the top of the layout.
    public init(
        title: String,
        text: String,
        isButton: Bool = false,
        buttonText: String? = nil,
        action: (() -> Void)? = nil,
        @ViewBuilder contentView: () -> ContentView? = {nil}
    ) {
        self.title = title
        self.text = text
        self.isButton = isButton
        self.buttonText = buttonText
        self.action = action
        self.contentView = contentView()
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            contentView
                .padding(.vertical, 10)
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.headlineSemibold)
                Text(text)
                    .multilineTextAlignment(.leading)
                    .font(.subheadlineRegular)
                    .foregroundColor(.darkGrey)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if isButton, let buttonText = buttonText {
                Button(action: {
                    action?()
                }) {
                    Text(buttonText).font(.headlineSemibold)
                }
                .buttonStyle(EXPrimaryButtonStyle(showLoader: .constant(false)))
                .padding(.top, 10)
            }
        }
    }
}

// MARK: Examples
#Preview {
    ScrollView {
        VStack(spacing: 16) {
            // Example with button
            EXInfoView(
                title: "Update Required",
                text: "Please update your app to the latest version to access new features.",
                isButton: true,
                buttonText: "Update Now",
                action: {
                    print("Update button tapped")
                }
            ) {
                Text("Custom Content View")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(height: 120)
                    .background(Color.backgroundGrey)
            }
            
            // Example without button and content
            EXInfoView<EmptyView>(
                title: "Notice",
                text: "This is a read-only message.",
                isButton: false
            )
            
            // Example without button
            EXInfoView(
                title: "Notice",
                text: "This is a read-only message.",
                isButton: false, contentView:  {
                    Text("Custom Content View")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(height: 120)
                        .background(Color.backgroundGrey)
                })
        }
    }
    .padding([.leading, .trailing], 16)
}
