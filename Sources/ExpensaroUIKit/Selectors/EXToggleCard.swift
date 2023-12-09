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
        .font(.headlineSemibold)
        .foregroundColor(.black)
      Text(type.text)
        .font(.footnoteRegular)
        .foregroundColor(.darkGrey)
        .multilineTextAlignment(.leading)
      
      Toggle(type.toggleTitle, isOn: $isOn)
        .tint(.primaryGreen)
        .font(.footnoteRegular)
        .padding(15)
        .background(Color.backgroundGrey)
        .cornerRadius(16)
        .padding(.top, 10)
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
