//
//  EXLargeSelector.swift
//
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

/// A customizable selector component with an icon, text, header, and a trailing icon.
///
/// `EXLargeSelector` provides an interactive UI for selection scenarios, featuring customizable icons and labels.
///
/// ### Usage Example
/// ```swift
/// EXLargeSelector(
///     text: .constant("Shopping"),
///     icon: .constant(.image(.init(systemName: "cart"))),
///     header: "Category",
///     rightIcon: .image(.init(systemName: "chevron.right"))
/// )
/// ```
///
/// ### Parameters
/// - `text`: A `Binding<String>` representing the text to display.
/// - `icon`: A `Binding<IconType>` representing the leading icon.
/// - `header`: A `String` for the header text.
/// - `rightIcon`: An `IconType` representing the trailing icon.
public struct EXLargeSelector: View {
    @Binding var text: String
    @Binding var icon: IconType
    var header: String
    var rightIcon: IconType

    public init(text: Binding<String>, icon: Binding<IconType>, header: String, rightIcon: IconType) {
        self._text = text
        self._icon = icon
        self.header = header
        self.rightIcon = rightIcon
    }

    public var body: some View {
        EXBaseCard {
            HStack {
                HStack(spacing: 10) {
                    switch $icon.wrappedValue {
                    case .imageName(let imageName) where !imageName.isEmpty:
                        Text(imageName)
                            .padding(12)
                            .background(.white)
                            .cornerRadius(12)

                    case .image(let image):
                        image
                            .foregroundColor(.primaryGreen)
                            .padding(12)
                            .background(.white)
                            .cornerRadius(12)

                    default:
                        EmptyView()
                    }

                    VStack(alignment: .leading, spacing: 3) {
                        Text(header)
                            .font(.footnoteRegular)
                            .foregroundColor(.darkGrey)
                        Text(text)
                            .font(.headlineRegular)
                    }
                }
                Spacer()
                switch rightIcon {
                case .imageName(let imageName):
                    Text(imageName)
                        .foregroundColor(.black)

                case .image(let image):
                    image
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    HStack {
        EXLargeSelector(
            text: .constant("Shopping"),
            icon: .constant(.image(.init(systemName: "cart"))),
            header: "Category",
            rightIcon: .image(.init(systemName: "chevron.right"))
        )
    }
    .padding([.leading, .trailing], 16)
}
