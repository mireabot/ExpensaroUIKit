//
//  EXBaseCard.swift
//
//
//  Created by Mikhail Kolkov on 12/8/23.
//

import SwiftUI

/// A reusable base card component for consistent styling across the application.
///
/// `EXBaseCard` serves as a wrapper for content, providing padding, a background color, and rounded corners.
/// It simplifies creating consistently styled card-like containers throughout the UI.
///
/// ### Usage Example
/// ```swift
/// EXBaseCard {
///     VStack(alignment: .leading) {
///         Text("$400")
///             .font(.title3Semibold)
///             .foregroundColor(.primaryGreen)
///         Text("Budget remaining")
///             .font(.footnoteRegular)
///             .foregroundColor(.darkGrey)
///     }
///     .frame(maxWidth: .infinity, alignment: .leading)
/// }
/// .padding([.leading, .trailing], 16)
/// ```
///
/// ### Parameters
/// - `content`: A closure that provides the content to display within the card. This can be any SwiftUI view.
///
/// ### Features
/// - **Padding**: Adds 12 points of padding around the content.
/// - **Background Color**: Uses a predefined `backgroundGrey` color for the card's background.
/// - **Rounded Corners**: Applies a corner radius of 12 points for a modern and clean appearance.
///
/// ### Notes
/// - `EXBaseCard` is designed to be highly reusable. It acts as a container for any content and standardizes
///   the visual appearance of cards in the application.
/// - Use this component for cards, panels, or any UI elements that require a consistent style.
///
/// ### Customization
/// While `EXBaseCard` provides default styling, you can wrap it with additional modifiers for further customization,
/// such as shadows, borders, or animations.
public struct EXBaseCard<Content: View>: View {
  let content: () -> Content
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }
  public var body: some View {
    content()
      .padding(12)
      .background(Color.backgroundGrey)
      .cornerRadius(12)
  }
}

#Preview {
  EXBaseCard {
    VStack(alignment: .leading) {
      Text("$400")
        .font(.title3Semibold)
        .foregroundColor(.primaryGreen)
      Text("Budget remaining")
        .font(.footnoteRegular)
        .foregroundColor(.darkGrey)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
  .padding([.leading,.trailing], 16)
}
