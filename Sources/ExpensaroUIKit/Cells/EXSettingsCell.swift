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
  var action: ()-> Void
  public init(category: Binding<String>, type: SettingsType, action: @escaping () -> Void) {
    self._selectedCategory = category
    self.type = type
    self.action = action
    MuktaFont.registerFonts()
  }
  public var body: some View {
    Button {
      selectedCategory = type.title
      action()
    } label: {
      VStack(spacing: 5) {
        type.image
          .resizable()
          .frame(width: 25, height: 25)
          .foregroundColor(.white)
          .padding(8)
          .background(Color.primaryGreen)
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
      .overlay(
        RoundedRectangle(cornerRadius: 12)
          .inset(by: 0.5)
          .stroke(Color.border, lineWidth: 1)
      )
    }
    .buttonStyle(PlainButtonStyle())

  }
}
