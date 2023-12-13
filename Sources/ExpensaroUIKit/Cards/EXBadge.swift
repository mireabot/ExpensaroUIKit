//
//  EXBadge.swift
//
//
//  Created by Mikhail Kolkov on 12/13/23.
//

import SwiftUI

public struct EXBadge: View {
  var text: String
  
  public init(text: String) {
    self.text = text
  }
  
  public var body: some View {
    Text(text)
      .font(.footnoteMedium)
      .foregroundColor(.white)
      .padding(.horizontal, 10)
      .padding(.vertical, 5)
      .background(Color.primaryGreen)
      .cornerRadius(12)
  }
}

#Preview {
  EXBadge(text: "Coming soon")
}
