//
//  EXSmallSelector.swift
//  
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

public struct EXSmallSelector: View {
  var activeText: String
  var icon: Image
  var type: SmallSelectorType
  
  public init(activeText: String, icon: Image, type: SmallSelectorType) {
    self.activeText = activeText
    self.icon = icon
    self.type = type
    MuktaFont.registerFonts()
  }
  
  
  public var body: some View {
    HStack(alignment: .top) {
      VStack(alignment: .leading, spacing: 5) {
        Text(type.title)
          .font(.mukta(.regular, size: 17))
        Text(activeText)
          .font(.mukta(.semibold, size: 20))
      }
      .frame(maxWidth: .infinity,alignment: .leading)
    }
    .padding(.vertical, 5)
    .padding(.horizontal, 10)
    .overlay(
      RoundedRectangle(cornerRadius: 12)
        .inset(by: 0.5)
        .stroke(Color.border, lineWidth: 1)
    )
  }
}
