//
//  EXCategoryCell.swift
//  
//
//  Created by Mikhail Kolkov on 9/18/23.
//

import SwiftUI

public struct EXCategoryCell: View {
  var icon: Image
  var title: String
  
  public init(icon: Image, title: String) {
    self.icon = icon
    self.title = title
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    VStack(spacing: 5) {
      icon
        .font(.title2)
        .foregroundColor(.primaryGreen)
      Text(title)
        .font(.mukta(.regular, size: 17))
        .multilineTextAlignment(.center)
      
    }
    .padding(.vertical, 15)
    .frame(maxWidth: .infinity, alignment: .center)
    .background(Color.backgroundGrey)
    .cornerRadius(12)
  }
}
