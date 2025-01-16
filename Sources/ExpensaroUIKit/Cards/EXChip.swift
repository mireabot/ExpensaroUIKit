//
//  EXChip.swift
//
//
//  Created by Mikhail Kolkov on 12/10/23.
//

import SwiftUI

/// A customizable chip component for displaying an icon and a text label.
///
/// `EXChip` is a flexible UI component that combines an icon and a text label in a compact design.
/// It supports various icon types and customizable text, making it ideal for tags, categories, or
/// any small informational display.
///
/// ### Usage Example
/// ```swift
/// HStack {
///     EXChip(icon: .imageName("🧠"), text: "Debit")
///     EXChip(icon: .image(.init(systemName: "globe")), text: "World")
/// }
/// ```
///
/// ### Parameters
/// - `icon`: The icon to display. It supports two types:
///     - `.imageName(String)`: Pass a string to use an emoji or a custom text-based icon.
///     - `.image(Image)`: Pass a SwiftUI `Image` for system or custom images.
/// - `text`: The text to display next to the icon.
///
/// ### Styling
/// - The chip has a grey background (`Color.backgroundGrey`) with rounded corners (radius: 12).
/// - The icon and text use `Color.primaryGreen` for their foreground color.
/// - The text font is styled with `.calloutMedium`.
///
/// ### Customization
/// You can adjust the colors, font, or padding by modifying the component directly.
///
/// ### Notes
/// - For `.imageName`, ensure the provided string is non-empty; otherwise, an empty view will be displayed.
/// - The component supports emojis and SwiftUI images for flexibility in icon representation.
public struct EXChip: View {
  var icon: IconType
  var text: String
  
  public init(icon: IconType, text: String) {
    self.icon = icon
    self.text = text
  }
  
  public var body: some View {
    HStack {
      switch icon {
      case .imageName(let imageName) where !imageName.isEmpty:
        Text(imageName)
        
      case .image(let image):
        image
          .foregroundColor(.primaryGreen)
        
      default:
        EmptyView()
      }
      Text(text)
        .font(.calloutMedium)
        .foregroundColor(.primaryGreen)
    }
    .padding(.horizontal, 10)
    .padding(.vertical, 5)
    .background(Color.backgroundGrey)
    .cornerRadius(12)
  }
}

#Preview {
  HStack {
    EXChip(icon: .imageName("🧠"), text: "Debit")
    EXChip(icon: .image(.init(systemName: "globe")), text: "Debit")
  }
}
