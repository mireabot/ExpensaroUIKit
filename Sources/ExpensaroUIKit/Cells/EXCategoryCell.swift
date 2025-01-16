//
//  EXCategoryCell.swift
//  
//
//  Created by Mikhail Kolkov on 9/22/23.
//

import SwiftUI

/// A customizable category cell with an optional icon and title.
///
/// `EXCategoryCell` displays a category with a leading icon, a title, and an optional trailing icon.
/// This component is ideal for use in lists or category-based UIs.
///
/// ### Usage Example
/// ```swift
/// List {
///     EXCategoryCell(icon: .imageName("🧠"), title: "Travel")
///     EXCategoryCell(icon: .image(.init(systemName: "car.fill")), title: "Transport", leftIcon: .init(systemName: "checkmark"))
/// }
/// .listStyle(.plain)
/// ```
///
/// ### Parameters
/// - `icon`: An `IconType` representing the category's leading icon. It can be:
///     - `.imageName(String)`: A string-based icon (e.g., emoji or text).
///     - `.image(Image)`: A SwiftUI `Image`, such as a system or custom image.
/// - `title`: A `String` representing the title of the category.
/// - `leftIcon`: An optional `Image` displayed on the trailing side of the cell, typically used for selection or status.
public struct EXCategoryCell: View {
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
                    .foregroundColor(.primaryGreen)
                    .padding(10)
                    .background(Color.backgroundGrey)
                    .cornerRadius(8)
            case .image(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.primaryGreen)
                    .padding(10)
                    .background(Color.backgroundGrey)
                    .cornerRadius(8)
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
        EXCategoryCell(icon: .imageName("🧠"), title: "Travel")
            .listRowSeparator(.hidden)
        EXCategoryCell(icon: .image(.init(systemName: "car.fill")), title: "Transport")
            .listRowSeparator(.hidden)
        EXCategoryCell(icon: .imageName("💻"), title: "Work")
            .listRowSeparator(.hidden)
    }
    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
    .listStyle(.plain)
    .background(Color.white)
}
