//
//  EXLargeSelector.swift
//  
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

public struct EXLargeSelector : View {
  var text: String
  var icon: Image
  var buttonText: String
  var action: () -> Void
  
  public init(text: String, icon: Image, buttonText: String, action: @escaping ()-> Void) {
    self.text = text
    self.icon = icon
    self.buttonText = buttonText
    self.action = action
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    HStack {
      HStack(spacing: 10) {
        icon
          .resizable()
          .frame(width: 20, height: 20)
          .foregroundColor(.primaryGreen)
          .padding(10)
          .background(Color.backgroundGrey)
          .cornerRadius(48)
        Text(text)
          .font(.mukta(.regular, size: 17))
      }
      Spacer()
      
      Button {
        action()
      } label: {
        Text(buttonText)
          .font(.mukta(.medium, size: 15))
      }
      .buttonStyle(SmallButtonStyle())

    }
    .padding(.horizontal, 12)
    .padding(.vertical, 12)
    .overlay(
      RoundedRectangle(cornerRadius: 12)
        .inset(by: 0.5)
        .stroke(Color.border, lineWidth: 1)
    )
  }
}
