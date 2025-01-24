//
//  EXBadge.swift
//
//
//  Created by Mikhail Kolkov on 12/13/23.
//

import SwiftUI

/// A reusable badge component for displaying short, styled text labels.
///
/// `EXBadge` is ideal for highlighting statuses, labels, or small bits of information
/// in a visually distinct manner. The badge uses a custom style with rounded corners
/// and a green background.
///
/// ### Usage Example
/// ```swift
/// EXBadge(text: "Coming soon")
/// ```
///
/// ### Parameters
/// - `text`: The string to be displayed inside the badge.
///
/// ### Customization
/// - The text style is set to `.footnoteMedium` with a white color.
/// - The background is styled with `Color.primaryGreen` and rounded corners with a radius of 12 points.
public struct EXBadge: View {
  var text: String
  
  public init(text: String) {
    self.text = text
  }
  
  public var body: some View {
    Text(text)
      .font(.footnoteMedium)
      .foregroundColor(.white)
      .padding(.horizontal, 10)
      .padding(.vertical, 5)
      .background(Color.primaryGreen)
      .cornerRadius(8)
  }
}

// MARK: - Examples
#Preview {
  EXBadge(text: "Coming soon")
}
