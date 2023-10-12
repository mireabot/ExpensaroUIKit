//
//  EXLargeCurrencyTextField.swift
//  
//
//  Created by Mikhail Kolkov on 9/13/23.
//

import SwiftUI

public struct EXLargeCurrencyTextField: View {
  var value: Binding<Double>
  var bottomView: any View
  
  public init(value: Binding<Double>, bottomView: any View) {
    self.value = value
    self.bottomView = bottomView
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    VStack(spacing: 0) {
      HStack(alignment: .center, spacing: 2) {
        Text("$")
          .font(.mukta(.medium, size: 24))
        TextField("", value: value, formatter: NumberFormatter())
          .font(.mukta(.medium, size: 40))
          .tint(.primaryGreen)
          .keyboardType(.decimalPad)
          .multilineTextAlignment(.leading)
      }
      AnyView(bottomView)
        .frame(maxWidth: .infinity,alignment: .trailing)
    }
    .padding(.horizontal, 14)
    .padding(.vertical, 10)
    .background(.white)
    .cornerRadius(12)
    .shadowXS()
  }
}
