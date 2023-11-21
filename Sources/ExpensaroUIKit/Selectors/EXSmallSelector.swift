//
//  EXSmallSelector.swift
//  
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

public struct EXSmallSelector: View {
  @Binding var activeText: String
  var type: SmallSelectorType
  
  public init(activeText: Binding<String>, type: SmallSelectorType) {
    self._activeText = activeText
    self.type = type
    MuktaFont.registerFonts()
  }
  
  
  public var body: some View {
    HStack(alignment: .top) {
      VStack(alignment: .leading, spacing: 5) {
        Text(type.title)
          .font(.mukta(.regular, size: 15))
        Text(activeText)
          .font(.mukta(.semibold, size: 17))
      }
      .frame(maxWidth: .infinity,alignment: .leading)
    }
    .padding(.vertical, 7)
    .padding(.horizontal, 12)
    .overlay(
      RoundedRectangle(cornerRadius: 16)
        .inset(by: 0.5)
        .stroke(Color.border, lineWidth: 1)
    )
  }
}

#Preview {
  EXSmallSelector(activeText: .constant("text"), type: .date).padding([.leading,.trailing], 16)
}
