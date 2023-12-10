//
//  EXTextField.swift
//  
//
//  Created by Mikhail Kolkov on 9/13/23.
//

import SwiftUI

public struct EXTextField: View {
  var text: Binding<String>
  var header: String
  var placeholder: String
  
  public init(text: Binding<String>, header: String, placeholder: String) {
    self.text = text
    self.header = header
    self.placeholder = placeholder
  }
  
  public var body: some View {
    EXBaseCard {
      VStack(alignment: .leading, spacing: 5) {
        Text(header)
          .font(.footnoteRegular)
          .foregroundColor(.darkGrey)
        TextField(placeholder, text: text)
          .tint(.primaryGreen)
          .font(.headlineRegular)
          .autocorrectionDisabled(true)
      }
    }
  }
}

#Preview {
  EXTextField(text: .constant(""), header: "Transaction name", placeholder: "What did you spend money on?").padding([.leading,.trailing], 16)
}
