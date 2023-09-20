//
//  EXSettingsCell.swift
//  
//
//  Created by Mikhail Kolkov on 9/20/23.
//

import SwiftUI

public struct EXSettingsCell: View {
  @Binding var selectedCategory: String
  var type: SettingsType
  
  public init(category: Binding<String>, type: SettingsType) {
    self._selectedCategory = category
    self.type = type
    MuktaFont.registerFonts()
  }
  public var body: some View {
    Button {
      selectedCategory = type.title
    } label: {
      VStack(spacing: 5) {
        type.image
          .resizable()
          .frame(width: 25, height: 25)
          .foregroundColor(.white)
          .padding(8)
          .background(type.color)
          .cornerRadius(10)
        VStack(alignment: .center, spacing: 0) {
          Text(type.title)
            .font(.mukta(.regular, size: 15))
            .foregroundColor(.black)
          
          Text(type.text)
            .font(.mukta(.regular, size: 13))
            .foregroundColor(.darkGrey)
            .multilineTextAlignment(.center)
            .padding([.leading,.trailing], 5)
            .frame(maxWidth: .infinity, alignment: .center)
        }
      }
      .padding(.vertical, 20)
      .padding(.horizontal, 10)
      .background(.white)
      .cornerRadius(12)
      .shadowXS()
    }
    .buttonStyle(PlainButtonStyle())

  }
}
