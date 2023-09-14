//
//  EXLargeEmptyState.swift
//  
//
//  Created by Mikhail Kolkov on 9/13/23.
//

import SwiftUI

public struct EXLargeEmptyState: View {
  var type: EmptyStateType
  var icon: Image
  var action: () -> Void
  
  public init(type: EmptyStateType, icon: Image, action: @escaping () -> Void) {
    self.type = type
    self.icon = icon
    self.action = action
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    VStack {
      VStack(spacing: 8) {
        icon
          .resizable()
          .frame(width: 24, height: 24)
          .foregroundColor(.primaryGreen)
          .padding(18)
          .background(Color.backgroundGrey)
          .cornerRadius(30)
        
        Text(type.title)
          .font(.mukta(.semibold, size: 17))
        Text(type.text)
          .foregroundColor(.darkGrey)
          .font(.mukta(.regular, size: 15))
        
      }.padding(.bottom, 20)
      Divider()
      Button {
        action()
      } label: {
        Text(type.buttonText)
          .font(.mukta(.semibold, size: 15))
      }
      .buttonStyle(SmallButtonStyle())
      .padding(.top, 20)
      
    }
    .padding(16)
    .overlay(
      RoundedRectangle(cornerRadius: 12)
        .inset(by: 0.5)
        .stroke(Color.border, lineWidth: 1)
    )
  }
}
