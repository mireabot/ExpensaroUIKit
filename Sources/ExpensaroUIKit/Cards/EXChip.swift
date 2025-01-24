//
//  EXChip.swift
//
//
//  Created by Mikhail Kolkov on 12/10/23.
//

import SwiftUI

/// A chip component that displays an icon or emoji alongside text in a compact, pill-shaped container.
///
/// ### Usage Example
/// ```swift
/// // With emoji
/// EXChip(
///     icon: .imageName("🌟"),
///     text: "New Feature"
/// )
///
/// // With system icon
/// EXChip(
///     icon: .image(Image(systemName: "tag.fill")),
///     text: "On Sale"
/// )
/// ```
///
/// ### Parameters
/// - `icon`: Icon type (.imageName for emoji or .image for SF Symbols/custom images)
/// - `text`: Label text displayed next to the icon
///
/// ### Use Cases
/// - Status indicators
/// - Category tags
/// - Feature badges
/// - Filter selections
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
          .frame(width: 20, height: 20)
        
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
    .cornerRadius(8)
  }
}

#Preview {
  HStack {
    EXChip(icon: .imageName("🧠"), text: "Debit")
    EXChip(icon: .image(.init(systemName: "globe")), text: "Debit")
  }
}
