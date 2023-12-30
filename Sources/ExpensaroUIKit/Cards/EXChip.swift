//
//  EXChip.swift
//
//
//  Created by Mikhail Kolkov on 12/10/23.
//

import SwiftUI

public struct EXChip: View {
  var icon: IconType
  var text: String
  
  public init(icon: IconType, text: String) {
    self.icon = icon
    self.text = text
  }
  
  public var body: some View {
    HStack {
      switch icon {
      case .imageName(let imageName) where !imageName.isEmpty:
        Text(imageName)
        
      case .image(let image):
        image
          .foregroundColor(.primaryGreen)
        
      default:
        EmptyView()
      }
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
  HStack {
    EXChip(icon: .imageName("🧠"), text: "Debit")
    EXChip(icon: .image(.init(systemName: "globe")), text: "Debit")
  }
}
