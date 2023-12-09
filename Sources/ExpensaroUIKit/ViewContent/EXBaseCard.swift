//
//  EXBaseCard.swift
//
//
//  Created by Mikhail Kolkov on 12/8/23.
//

import SwiftUI

public struct EXBaseCard<Content: View>: View {
  let content: () -> Content
  public init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }
  public var body: some View {
    content()
      .padding(12)
      .background(Color.backgroundGrey)
      .cornerRadius(12)
  }
}

#Preview {
  EXBaseCard {
    VStack(alignment: .leading) {
      Text("$400")
        .font(.title3Semibold)
        .foregroundColor(.primaryGreen)
      Text("Budget remaining")
        .font(.footnoteRegular)
        .foregroundColor(.darkGrey)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
  .padding([.leading,.trailing], 16)
}
