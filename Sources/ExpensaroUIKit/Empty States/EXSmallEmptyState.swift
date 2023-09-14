//
//  EXSmallEmptyState.swift
//  
//
//  Created by Mikhail Kolkov on 9/13/23.
//

import SwiftUI

public struct EXSmallEmptyState: View {
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
    HStack {
      VStack(alignment: .leading) {
        Text(type.title)
          .font(.mukta(.semibold, size: 17))
        Text(type.text)
          .foregroundColor(.darkGrey)
          .font(.mukta(.regular, size: 15))
        
      }
      Spacer()
      Button {
        action()
      } label: {
        Text(type.buttonText)
          .font(.mukta(.semibold, size: 15))
      }
      .buttonStyle(SmallButtonStyle())
      
    }
    .padding(16)
    .overlay(
      RoundedRectangle(cornerRadius: 12)
        .inset(by: 0.5)
        .stroke(Color.border, lineWidth: 1)
    )
  }
}
