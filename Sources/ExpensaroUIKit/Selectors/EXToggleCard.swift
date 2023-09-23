//
//  EXToggleCard.swift
//  
//
//  Created by Mikhail Kolkov on 9/23/23.
//

import SwiftUI

public struct EXToggleCard: View {
  @Binding var isOn: Bool
  var type: ToggleType
  
  public init(type: ToggleType, isOn: Binding<Bool>) {
    self.type = type
    self._isOn = isOn
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      Text(type.title)
        .font(.mukta(.semibold, size: 17))
        .foregroundColor(.black)
      Text(type.text)
        .font(.mukta(.regular, size: 13))
        .foregroundColor(.darkGrey)
        .multilineTextAlignment(.leading)
      
      Toggle(type.toggleTitle, isOn: $isOn)
        .tint(.primaryGreen)
        .font(.mukta(.regular, size: 13))
        .padding(.horizontal, 10)
        .padding(.vertical, 15)
        .background(Color.backgroundGrey)
        .cornerRadius(12)
        .padding(.top, 10)
    }
    .padding(15)
    .background(Color.white)
    .cornerRadius(12)
    .shadowXS()
  }
}
