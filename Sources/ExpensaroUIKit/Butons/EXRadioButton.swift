//
//  EXRadioButton.swift
//
//
//  Created by Mikhail Kolkov on 1/23/25.
//

import SwiftUI

/// A radio button component that displays selectable options with icons and labels.
///
/// ### Usage Example
/// ```swift
/// // With system image
/// EXRadioButton(
///     icon: .image(Image(systemName: "star.fill")),
///     title: "Premium Plan",
///     isSelected: true
/// )
///
/// // With custom image as emoji
/// EXRadioButton(
///     icon: .imageName("👀"),
///     title: "Basic Plan",
///     isSelected: false
/// )
/// ```
///
/// ### Parameters
/// - `icon`: Icon type (.image for SF Symbols/custom images or .imageName for emoji names)
/// - `title`: Text label for the radio button
/// - `isSelected`: Selection state of the radio button
///
/// ### Use Cases
/// - Plan selection interfaces
/// - Settings preferences
/// - Multiple choice forms
/// - Configuration options
///
/// - Note: Uses `EXBase` for consistent styling and layout
public struct EXRadioButton: View {
    var icon: IconType
    var title: String
    var isSelected: Bool
    
    public init(icon: IconType, title: String, isSelected: Bool) {
        self.icon = icon
        self.title = title
        self.isSelected = isSelected
    }
    public var body: some View {
        EXBase {
            HStack {
                HStack(alignment: .center, spacing: 8) {
                    switch icon {
                    case .imageName(let imageName):
                        Text(imageName)
                            .font(.headline)
                            .padding(8)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.border, lineWidth: 1)
                            )
                    case .image(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.primaryGreen)
                            .padding(8)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.border, lineWidth: 1)
                            )
                    }

                    Text(title)
                        .font(.headlineRegular)
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(isSelected ? .primaryGreen : .border)
            }
        }
    }
}

#Preview {
    VStack {
        EXRadioButton(icon: .imageName("👀"), title: "Public", isSelected: true)
        EXRadioButton(icon: .image(.init(systemName: "lock")), title: "Private", isSelected: false)
    }
    .padding(.horizontal, 16)
}
