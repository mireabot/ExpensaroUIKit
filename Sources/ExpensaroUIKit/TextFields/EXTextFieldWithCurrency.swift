//
//  SwiftUIView.swift
//  
//
//  Created by Mikhail Kolkov on 9/11/23.
//

import SwiftUI

public struct EXTextFieldWithCurrency: View {
  var value: Binding<String>
  
  public init(value: Binding<String>) {
    self.value = value
  }
  
  public var body: some View {
    HStack {
      Text("USD")
        .font(.headlineSemibold)
      Spacer()
      HStack {
        Spacer()
        TextField("0", text: value)
          .tint(.clear)
          .font(.headlineRegular)
          .multilineTextAlignment(.trailing)
      }
    }
    .padding(.vertical, 16)
    .padding(.horizontal, 20)
    .overlay(
      RoundedRectangle(cornerRadius: 16)
        .inset(by: 0.5)
        .stroke(Color.border, lineWidth: 1)
    )
  }
}

#Preview {
  EXTextFieldWithCurrency(value: .constant("")).padding([.leading,.trailing], 16)
}
