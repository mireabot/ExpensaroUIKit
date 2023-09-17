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
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      icon?
        .resizable()
        .frame(width: 20, height: 20)
        .foregroundColor(.primaryGreen)
        .padding(8)
        .background(Color.backgroundGrey)
        .cornerRadius(40)
      Text(type.title)
        .font(.mukta(.semibold, size: 17))
      Text(type.text)
        .font(.mukta(.regular, size: 15))
        .foregroundColor(.darkGrey)
      Button {
        buttonAction()
      } label: {
        HStack {
          buttonIcon
            .resizable()
            .frame(width: 16, height: 16)
          Text("How it works")
            .font(.mukta(.semibold, size: 15))
        }.frame(maxWidth: .infinity)
      }
      .buttonStyle(SmallButtonStyle())
      .padding(.top, 5)

    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(15)
    .overlay(
      RoundedRectangle(cornerRadius: 12)
        .inset(by: 0.5)
        .stroke(Color.border, lineWidth: 1)
    )
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    EXInfoCardWithButton(type: .monthToMonth, icon: .init(systemName: "globe"), buttonIcon: .init(systemName: "globe"), buttonAction: {}).padding([.leading,.trailing])
  }
}
