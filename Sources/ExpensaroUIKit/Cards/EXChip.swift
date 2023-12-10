//
//  EXChip.swift
//
//
//  Created by Mikhail Kolkov on 12/10/23.
//

import SwiftUI

public struct EXChip: View {
  var icon: String
  var text: String
  
  public init(icon: String, text: String) {
    self.icon = icon
    self.text = text
  }
  
  public var body: some View {
    HStack {
      Image(icon)
        .foregroundColor(.primaryGreen)
      Text(text)
        .font(.headlineMedium)
        .foregroundColor(.primaryGreen)
    }
    .padding(.horizontal, 15)
    .padding(.vertical, 10)
    .background(Color.backgroundGrey)
    .clipShape(Capsule())
  }
}

#Preview {
  EXChip(icon: "globe", text: "Debit")
}
