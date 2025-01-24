//
//  EXCategoryCell.swift
//  
//
//  Created by Mikhail Kolkov on 9/22/23.
//

import SwiftUI

/// A list cell component with a leading icon, title, and optional trailing icon.
///
/// ### Usage Example
/// ```swift
/// // Basic list cell with emoji
/// EXStackedListCell(
///     icon: .imageName("🔔"),
///     title: "Notifications"
/// )
///
/// // List cell with system icons
/// EXStackedListCell(
///     icon: .image(Image(systemName: "gear")),
///     title: "Settings",
///     leftIcon: Image(systemName: "chevron.right")
/// )
/// ```
///
/// ### Parameters
/// - `icon`: Leading icon (.image for SF Symbols/custom images or .imageName for emoji)
/// - `title`: Cell title text
/// - `leftIcon`: Optional trailing icon (typically used for navigation indicators)
///
/// ### Use Cases
/// - Navigation menu items
/// - Settings options
/// - Feature list items
/// - Action menus
/// - Preference toggles
public struct EXStackedListCell: View {
    var icon: IconType
    var title: String
    var leftIcon: Image?
    
    public init(icon: IconType, title: String, leftIcon: Image? = nil) {
        self.icon = icon
        self.title = title
        self.leftIcon = leftIcon
    }
    
    public var body: some View {
        HStack {
            switch icon {
            case .imageName(let imageName):
                Text(imageName)
                    .font(.headline)
                    .padding(10)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.border, lineWidth: 1)
                    )
            case .image(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.primaryGreen)
                    .padding(10)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.border, lineWidth: 1)
                    )
            }
            
            Text(title)
                .font(.headlineRegular)
            
            Spacer()
            
            if let leftIcon = leftIcon {
                leftIcon
                    .foregroundColor(.black)
            }
        }
        .background(Color.white)
    }
}

// MARK: - Examples
#Preview {
    List {
        EXStackedListCell(icon: .imageName("🧠"), title: "Travel")
            .listRowSeparator(.hidden)
        EXStackedListCell(icon: .image(.init(systemName: "car.fill")), title: "Transport")
            .listRowSeparator(.hidden)
        EXStackedListCell(icon: .imageName("💻"), title: "Work", leftIcon: .init(systemName: "chevron.right"))
            .listRowSeparator(.hidden)
    }
    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
    .listStyle(.plain)
    .background(Color.white)
}
