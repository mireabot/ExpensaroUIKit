//
//  EXSettingsCell.swift
//
//
//  Created by Mikhail Kolkov on 9/20/23.
//

import SwiftUI

/// A customizable settings cell with an icon, title, description text, and an action button.
///
/// `EXSettingsCell` displays a settings option with a leading icon, a title, descriptive text, and an action that executes when the cell is tapped. The icon supports both emoji and SwiftUI `Image`.
///
/// ### Usage Example
/// ```swift
/// EXSettingsCell(
///     title: "Categories",
///     text: "Manage your categories",
///     icon: .imageName("📂"),
///     action: {
///         print("Categories tapped")
///     }
/// )
/// ```
///
/// ### Parameters
/// - `title`: A `String` representing the title of the settings option.
/// - `text`: A `String` representing the description or subtitle text for the settings option.
/// - `icon`: An `IconType` representing the leading icon. It can be:
///     - `.imageName(String)`: A string-based icon (e.g., emoji or text).
///     - `.image(Image)`: A SwiftUI `Image`, such as a system or custom image.
/// - `action`: A closure executed when the cell is tapped.
public struct EXSettingsCell: View {
    var title: String
    var text: String
    var icon: IconType
    var action: () -> Void

    /// Initializes the `EXSettingsCell`.
    /// - Parameters:
    ///   - title: The title text of the settings option.
    ///   - text: The description or subtitle text of the settings option.
    ///   - icon: The leading icon for the cell (`IconType`).
    ///   - action: A closure executed when the cell is tapped.
    public init(title: String, text: String, icon: IconType, action: @escaping () -> Void) {
        self.title = title
        self.text = text
        self.icon = icon
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack(alignment: .center, spacing: 10) {
                switch icon {
                case .imageName(let imageName):
                    Text(imageName)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.primaryGreen)
                        .cornerRadius(10)
                case .image(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.primaryGreen)
                        .cornerRadius(10)
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .font(.headlineMedium)
                        .foregroundColor(.black)

                    Text(text)
                        .font(.footnoteRegular)
                        .foregroundColor(.darkGrey)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            .background(Color.backgroundGrey)
            .cornerRadius(20)
        }
        .buttonStyle(EXPlainButtonStyle())
    }
}

// MARK: - Examples
#Preview {
    VStack(spacing: 16) {
        // Example with emoji icon
        EXSettingsCell(
            title: "Categories",
            text: "Manage your categories",
            icon: .imageName("📂"),
            action: {
                print("Categories tapped")
            }
        )
        
        // Example with SwiftUI Image icon
        EXSettingsCell(
            title: "Settings",
            text: "Adjust your preferences",
            icon: .image(.init(systemName: "gear")),
            action: {
                print("Settings tapped")
            }
        )
    }
    .padding(.horizontal, 16)
}
