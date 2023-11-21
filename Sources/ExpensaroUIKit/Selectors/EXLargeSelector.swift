//
//  EXLargeSelector.swift
//  
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

public struct EXLargeSelector : View {
  @Binding var text: String
  @Binding var icon: String
  var buttonText: String
  var action: () -> Void
  
  public init(text: Binding<String>, icon: Binding<String>, buttonText: String, action: @escaping ()-> Void) {
    self._text = text
    self._icon = icon
    self.buttonText = buttonText
    self.action = action
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    HStack {
      HStack(spacing: 10) {
        Image(icon)
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
      .buttonStyle(EXSmallButtonStyle())

    }
    .padding([.horizontal, .vertical], 12)
//    .padding([.horizontal, .vertical], 16)
    .overlay(
      RoundedRectangle(cornerRadius: 16)
        .inset(by: 0.5)
        .stroke(Color.border, lineWidth: 1)
    )
  }
}

#Preview {
  EXLargeSelector(text: .constant("Travel"), icon: .constant(""), buttonText: "Change", action: {}).padding([.leading,.trailing], 16)
}
