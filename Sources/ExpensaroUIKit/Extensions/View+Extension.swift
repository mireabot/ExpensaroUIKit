//
//  View+Extension.swift
//
//
//  Created by Mikhail Kolkov on 9/13/23.
//

import SwiftUI

/// An extension for `View` to apply a small shadow effect.
///
/// `shadowXS` provides a reusable and consistent shadow style with specific color, opacity, and offset values.
/// This can be used to add subtle depth to your UI components.
///
/// ### Usage Example
/// ```swift
/// Text("Hello, World!")
///     .padding()
///     .background(Color.white)
///     .cornerRadius(10)
///     .shadowXS()
/// ```
///
/// ### Creating Custom Shadows
/// You can create your own shadow styles by following this pattern:
/// ```swift
/// public extension View {
///     func customShadow(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) -> some View {
///         self.shadow(color: color.opacity(0.1), radius: radius, x: x, y: y)
///     }
/// }
///
/// // Example Usage
/// Text("Custom Shadow Example")
///     .padding()
///     .background(Color.white)
///     .cornerRadius(10)
///     .customShadow(color: .black, radius: 8, x: 0, y: 4)
/// ```
///
/// ### Notes
/// - Use `shadowXS` for consistent small shadows across your app.
/// - Customize shadow parameters to suit specific design needs by creating your own extensions.
public extension View {
    func shadowXS() -> some View {
        self.shadow(color: Color(red: 0.7, green: 0.72, blue: 0.73).opacity(0.09), radius: 12, x: 0, y: 12)
    }
    
    func expanding() -> some View {
        modifier(ExpandingModifier())
    }
}
