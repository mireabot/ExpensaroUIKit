//
//  EXCategoryListCell.swift
//  
//
//  Created by Mikhail Kolkov on 9/22/23.
//

import SwiftUI

public struct EXCategoryListCell: View {
  var icon: Image
  var title: String
  
  public init(icon: Image, title: String) {
    self.icon = icon
    self.title = title
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    HStack {
      icon
        .font(.title3)
        .foregroundColor(.primaryGreen)
      Text(title)
        .font(.mukta(.regular, size: 17))
      Spacer()
    }
    .padding(.horizontal, 20)
    .padding(.vertical, 12)
    .background(Color.white)
    .cornerRadius(12)
    .shadowXS()
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}
