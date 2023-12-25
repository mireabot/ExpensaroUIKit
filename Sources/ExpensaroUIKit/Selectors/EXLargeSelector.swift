//
//  EXLargeSelector.swift
//  
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

public struct EXLargeSelector : View {
  @Binding var text: String
  @Binding var icon: String
  var header: String
  var rightIcon: String
  
  public init(text: Binding<String>, icon: Binding<String>, header: String, rightIcon: String) {
    self._text = text
    self._icon = icon
    self.header = header
    self.rightIcon = rightIcon
  }
  
  public var body: some View {
    EXBaseCard {
      HStack {
        HStack(spacing: 10) {
          if icon != "" {
            Image(icon)
              .foregroundColor(.primaryGreen)
              .padding(12)
              .background(.white)
              .cornerRadius(12)
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
    EXLargeSelector(text: .constant("Shopping"), icon: .constant(""), header: "Category", rightIcon: "Change")
  }
  .padding([.leading,.trailing], 16)
}
