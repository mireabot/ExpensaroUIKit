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
        .font(.calloutMedium)
        .foregroundColor(.primaryGreen)
    }
    .padding(.horizontal, 10)
    .padding(.vertical, 5)
    .background(Color.backgroundGrey)
    .cornerRadius(12)
  }
}

#Preview {
  EXChip(icon: "globe", text: "Debit")
}
