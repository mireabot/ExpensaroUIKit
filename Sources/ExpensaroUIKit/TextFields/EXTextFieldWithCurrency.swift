//
//  SwiftUIView.swift
//  
//
//  Created by Mikhail Kolkov on 9/11/23.
//

import SwiftUI

public struct EXTextFieldWithCurrency: View {
  var value: Binding<Double>
  
  public init(value: Binding<Double>) {
    self.value = value
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    HStack {
      Text("USD")
        .font(.mukta(.semibold, size: 17))
      Spacer()
      HStack {
        Spacer()
        TextField("0", value: value, formatter: NumberFormatter())
          .tint(.primaryGreen)
          .font(.mukta(.regular, size: 17))
          .keyboardType(.numberPad)
          .multilineTextAlignment(.trailing)
      }
    }
    .padding(.vertical, 14)
    .padding(.horizontal, 20)
    .overlay(
      RoundedRectangle(cornerRadius: 12)
        .inset(by: 0.5)
        .stroke(Color.border, lineWidth: 1)
    )
  }
}
