//
//  EXCheckmarkSelector.swift
//  
//
//  Created by Mikhail Kolkov on 9/26/23.
//

import SwiftUI

public struct EXCheckmarkSelector : View {
  @Binding var isSelected: Bool
  var type: ToggleType
  
  public init(type: ToggleType, isSelected: Binding<Bool>) {
    self.type = type
    self._isSelected = isSelected
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    HStack(alignment: .center, spacing: 25) {
      Image(systemName: "checkmark")
        .foregroundColor(isSelected ? .black : .clear)
        .font(.callout)
        .background(
          Rectangle()
            .frame(width: 30, height: 30)
            .foregroundColor(.backgroundGrey)
            .cornerRadius(8)
        )
        .onTapGesture {
          isSelected.toggle()
        }
      VStack(alignment: .leading, spacing: 0) {
        Text(type.title)
          .font(.mukta(.medium, size: 15))
          .foregroundColor(.black)
        Text(type.text)
          .font(.mukta(.regular, size: 13))
          .foregroundColor(.darkGrey)
          .multilineTextAlignment(.leading)
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}
