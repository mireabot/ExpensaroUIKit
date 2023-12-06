//
//  EXInfoCardWithButton.swift
//  
//
//  Created by Mikhail Kolkov on 9/17/23.
//

import SwiftUI

public struct EXInfoCardWithButton: View {
  var type: InfoCardType
  var icon: Image?
  var buttonIcon: Image
  var buttonAction: () -> Void
  
  /// Init for card with icon, buttonIcon and action
  /// - Parameters:
  ///   - type: type of info card
  ///   - icon: custom icon
  public init(type: InfoCardType, icon: Image, buttonIcon: Image, buttonAction: @escaping ()-> Void) {
    self.type = type
    self.icon = icon
    self.buttonIcon = buttonIcon
    self.buttonAction = buttonAction
  }
  
  public var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      icon?
        .font(.title)
        .foregroundColor(.primaryGreen)
      Text(type.title)
        .font(.system(.headline, weight: .semibold))
      Text(type.text)
        .font(.system(.subheadline, weight: .regular))
        .foregroundColor(.darkGrey)
      Button {
        buttonAction()
      } label: {
        Text("How it works")
          .font(.system(.subheadline, weight: .semibold))
          .frame(maxWidth: .infinity)
      }
      .buttonStyle(EXSmallButtonStyle())
      .padding(.top, 10)

    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(15)
    .overlay(
      RoundedRectangle(cornerRadius: 16)
        .inset(by: 0.5)
        .stroke(Color.border, lineWidth: 1)
    )
  }
}

#Preview {
  EXInfoCardWithButton(type: .topCategory, icon: .init(systemName: "globe"), buttonIcon: .init(systemName: "globe"), buttonAction: {}).padding([.leading,.trailing], 16)
}
