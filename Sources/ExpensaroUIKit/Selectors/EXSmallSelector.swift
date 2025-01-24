//
//  EXSmallSelector.swift
//  
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

/// A compact selector component with a leading icon and text.
///
/// `EXSmallSelector` provides a simple UI for displaying a selectable option with a leading icon and descriptive text.
/// The `icon` supports flexible types, including emojis or SwiftUI `Image`.
///
/// ### Usage Example
/// ```swift
/// EXSmallSelector(
///     activeText: .constant("Every week"),
///     icon: .image(.init(systemName: "calendar"))
/// )
/// ```
///
/// ### Parameters
/// - `activeText`: A `Binding<String>` representing the text displayed in the selector.
/// - `icon`: An `IconType` representing the leading icon. It supports:
///     - `.imageName(String)`: An emoji or text-based icon.
///     - `.image(Image)`: A SwiftUI `Image` for system or custom icons.
public struct EXSmallSelector: View {
    @Binding var activeText: String
    var icon: IconType

    public init(activeText: Binding<String>, icon: IconType) {
        self._activeText = activeText
        self.icon = icon
    }

    public var body: some View {
        EXBase {
            HStack(spacing: 10) {
                switch icon {
                case .imageName(let imageName):
                    Text(imageName)
                        .foregroundColor(.primaryGreen)

                case .image(let image):
                    image
                        .foregroundColor(.primaryGreen)
                }

                Text(activeText)
                    .font(.subheadlineMedium)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

// MARK: - Examples
#Preview {
    HStack {
        EXSmallSelector(activeText: .constant("Every week"), icon: .imageName("📅"))
        EXSmallSelector(activeText: .constant("Dec 25, 2023"), icon: .image(.init(systemName: "calendar")))
    }
    .padding([.leading, .trailing], 16)
}
