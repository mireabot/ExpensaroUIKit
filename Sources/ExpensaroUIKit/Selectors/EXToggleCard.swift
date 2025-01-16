//
//  EXToggleCard.swift
//  
//
//  Created by Mikhail Kolkov on 9/23/23.
//

import SwiftUI

/// A customizable toggle card component with a title and descriptive text.
///
/// `EXToggleCard` provides a reusable UI component for toggling a setting or feature with a descriptive label.
///
/// ### Usage Example
/// ```swift
/// VStack {
///     EXToggleCard(title: "Notifications", text: "Enable push notifications for updates", isOn: .constant(true))
///     EXToggleCard(title: "Dark Mode", text: "Switch to dark theme", isOn: .constant(false))
/// }
/// .padding(16)
/// ```
///
/// ### Parameters
/// - `title`: A `String` representing the main title of the toggle card.
/// - `text`: A `String` providing a description or label for the toggle.
/// - `isOn`: A `Binding<Bool>` representing the toggle state.
public struct EXToggleCard: View {
    @Binding var isOn: Bool
    var title: String
    var text: String
    
    public init(title: String, text: String, isOn: Binding<Bool>) {
        self.title = title
        self.text = text
        self._isOn = isOn
    }
    
    public var body: some View {
        EXBaseCard {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(title)
                        .font(.headlineSemibold)
                        .foregroundColor(.black)
                    
                    Toggle(text, isOn: $isOn)
                        .tint(.primaryGreen)
                        .font(.footnoteRegular)
                        .foregroundColor(.darkGrey)
                }
            }
            .padding(4)
        }
    }
}

// MARK: Examples
#Preview {
    VStack {
        EXToggleCard(title: "Notifications", text: "Enable push notifications for updates", isOn: .constant(true))
        EXToggleCard(title: "Dark Mode", text: "Switch to dark theme", isOn: .constant(false))
        EXToggleCard(title: "Auto Updates", text: "Allow automatic updates", isOn: .constant(true))
    }
    .padding([.leading, .trailing], 16)
}
