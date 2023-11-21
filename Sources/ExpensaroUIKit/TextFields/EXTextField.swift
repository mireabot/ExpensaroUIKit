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
      .padding([.horizontal, .vertical], 12)
      .overlay(
        RoundedRectangle(cornerRadius: 16)
          .inset(by: 0.5)
          .stroke(Color.border, lineWidth: 1)
      )
  }
}

#Preview {
  EXTextField(text: .constant(""), placeholder: "Enter text").padding([.leading,.trailing], 16)
}
