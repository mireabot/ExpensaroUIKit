//
//  EXLargeSelector.swift
//  
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

public struct EXLargeSelector : View {
  @Binding var text: String
  @Binding var icon: Image
  var buttonText: String
  var action: () -> Void
  
  public init(text: Binding<String>, icon: Binding<Image>, buttonText: String, action: @escaping ()-> Void) {
    self._text = text
    self._icon = icon
    self.buttonText = buttonText
    self.action = action
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    HStack {
      HStack(spacing: 10) {
        icon
          .foregroundColor(.primaryGreen)
          .padding(10)
          .background(Color.backgroundGrey)
          .cornerRadius(12)
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
