//
//  EXSmallSelector.swift
//  
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

public struct EXSmallSelector: View {
  @Binding var activeText: String
  var icon: String
  
  public init(activeText: Binding<String>, icon: String) {
    self._activeText = activeText
    self.icon = icon
  }
  
  public var body: some View {
    EXBaseCard {
      HStack(spacing: 10) {
        Image(icon)
          .foregroundColor(.primaryGreen)
        Text(activeText)
          .font(.subheadlineMedium)
      }
      .frame(maxWidth: .infinity)
    }
  }
}

#Preview {
  HStack {
    EXSmallSelector(activeText: .constant("Every week"), icon: "")
    EXSmallSelector(activeText: .constant("Dec 25, 2023"), icon: "")
  }
  .padding([.leading,.trailing], 16)
}
