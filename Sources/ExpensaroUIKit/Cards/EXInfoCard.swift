//
//  EXInfoCard.swift
//  
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

public struct EXInfoCard: View {
  var type: InfoCardType
  var icon: Image
  var text: String
  
  public init(type: InfoCardType, icon: Image, text: String) {
    self.type = type
    self.icon = icon
    self.text = text
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      icon
        .resizable()
        .frame(width: 20, height: 20)
        .foregroundColor(.primaryGreen)
        .padding(8)
        .background(Color.backgroundGrey)
        .cornerRadius(40)
      Text(type.title)
        .font(.mukta(.semibold, size: 20))
      Text(text)
        .font(.mukta(.regular, size: 17))
        .foregroundColor(.darkGrey)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(20)
    .overlay(
      RoundedRectangle(cornerRadius: 12)
        .inset(by: 0.5)
        .stroke(Color.border, lineWidth: 1)
    )
  }
}
