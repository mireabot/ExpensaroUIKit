//
//  EXLargeSelector.swift
//
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

public struct EXLargeSelector : View {
  @Binding var text: String
  @Binding var icon: IconType
  var header: String
  var rightIcon: String
  
  public init(text: Binding<String>, icon: Binding<IconType>, header: String, rightIcon: String) {
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
        Image(rightIcon)
          .foregroundColor(.black)
      }
    }
  }
}

#Preview {
  HStack {
    EXLargeSelector(text: .constant("Shopping"), icon: .constant(.image(.init(systemName: "globe"))), header: "Category", rightIcon: "Change")
  }
  .padding([.leading,.trailing], 16)
}
