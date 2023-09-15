//
//  EXToggleCard.swift
//  
//
//  Created by Mikhail Kolkov on 9/15/23.
//

import SwiftUI

public struct EXToggleCard: View {
  @Binding var isSelected: Bool
  var icon: Image
  var type: ToggleType
  
  public init(isSelected: Binding<Bool>, icon: Image, type: ToggleType) {
    self._isSelected = isSelected
    self.icon = icon
    self.type = type
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    HStack {
      HStack(alignment: .top, spacing: 10) {
        icon
          .resizable()
          .frame(width: 20, height: 20)
          .foregroundColor(.primaryGreen)
          .padding(10)
          .background(Color.backgroundGrey)
          .cornerRadius(40)
        VStack(alignment: .leading, spacing: 0) {
          Text(type.title)
            .font(.mukta(.medium, size: 15))
          Text(type.text)
            .font(.mukta(.regular, size: 13))
            .foregroundColor(.darkGrey)
            .multilineTextAlignment(.leading)
        }.padding(.top, 5)
      }
      Spacer()
      Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
        .resizable()
        .frame(width: 20, height: 20)
        .foregroundColor(isSelected ? .primaryGreen : .border)
        .onTapGesture {
          isSelected.toggle()
        }
    }
  }
}
