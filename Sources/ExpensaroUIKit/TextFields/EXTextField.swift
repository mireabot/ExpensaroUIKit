//
//  EXTextField.swift
//  
//
//  Created by Mikhail Kolkov on 9/13/23.
//

import SwiftUI

public struct EXTextField: View {
  var text: Binding<String>
  var placeholder: String
  
  public init(text: Binding<String>, placeholder: String) {
    self.text = text
    self.placeholder = placeholder
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    TextField(placeholder, text: text)
      .tint(.primaryGreen)
      .font(.mukta(.regular, size: 17))
      .autocorrectionDisabled(true)
      .submitLabel(.return)
      .padding(.vertical, 10)
      .padding(.horizontal, 15)
      .cornerRadius(12)
      .overlay(
        RoundedRectangle(cornerRadius: 12)
          .inset(by: 0.5)
          .stroke(Color.border, lineWidth: 1)
      )
  }
}
