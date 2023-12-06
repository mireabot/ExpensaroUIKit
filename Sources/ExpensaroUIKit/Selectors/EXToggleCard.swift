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
  }
  
  public var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      Text(type.title)
        .font(.system(.headline, weight: .semibold))
        .foregroundColor(.black)
      Text(type.text)
        .font(.system(.footnote, weight: .regular))
        .foregroundColor(.darkGrey)
        .multilineTextAlignment(.leading)
      
      Toggle(type.toggleTitle, isOn: $isOn)
        .tint(.primaryGreen)
        .font(.system(.footnote, weight: .regular))
        .padding(.horizontal, 15)
        .padding(.vertical, 15)
        .background(Color.backgroundGrey)
        .cornerRadius(16)
        .padding(.top, 15)
    }
    .padding(16)
    .background(Color.white)
    .overlay(
      RoundedRectangle(cornerRadius: 16)
        .inset(by: 0.5)
        .stroke(Color.border, lineWidth: 1)
    )
  }
}

#Preview {
  EXToggleCard(type: .notifications, isOn: .constant(false)).padding([.leading,.trailing], 16)
}
