//
//  EXSettingsCell.swift
//
//
//  Created by Mikhail Kolkov on 9/20/23.
//

import SwiftUI

/// A horizontal tile cell component that displays an icon alongside title and descriptive text.
///
/// ### Usage Example
/// ```swift
/// // With system icon
/// EXHTileCell(
///     title: "Secure Payment",
///     text: "Your transactions are protected",
///     icon: .image(Image(systemName: "lock.shield.fill"))
/// )
///
/// // With emoji icon
/// EXHTileCell(
///     title: "Cash Rewards",
///     text: "Earn 2% back on all purchases",
///     icon: .imageName("💰")
/// )
/// ```
///
/// ### Parameters
/// - `title`: Primary heading text
/// - `text`: Supporting description text
/// - `icon`: Icon type (.image for SF Symbols/custom images or .imageName for emoji)
///
/// ### Use Cases
/// - Feature highlights
/// - Setting options
/// - Menu items
/// - Information list items
/// - Benefits overview
public struct EXHTileCell: View {
    var title: String
    var text: String
    var icon: IconType
    
    public init(title: String, text: String, icon: IconType) {
        self.title = title
        self.text = text
        self.icon = icon
    }
    
    public var body: some View {
        EXBase {
            HStack(alignment: .center, spacing: 10) {
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
                        .frame(width: 20, height: 20)
                        .foregroundColor(.primaryGreen)
                        .padding(10)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.border, lineWidth: 1)
                        )
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .font(.headlineMedium)
                        .foregroundColor(.black)
                    
                    Text(text)
                        .font(.footnoteRegular)
                        .foregroundColor(.darkGrey)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

// MARK: - Examples
#Preview {
    VStack(spacing: 16) {
        // With system icon
        EXHTileCell(
            title: "Secure Payment",
            text: "Your transactions are protected",
            icon: .image(Image(systemName: "lock.shield.fill"))
        )
        
        // With emoji icon
        EXHTileCell(
            title: "Cash Rewards",
            text: "Earn 2% back on all purchases",
            icon: .imageName("💰")
        )
    }
    .padding(.horizontal, 16)
}
