//
//  EXSmallEmptyState.swift
//  
//
//  Created by Mikhail Kolkov on 9/13/23.
//

import SwiftUI

public struct EXSmallEmptyState: View {
  var type: EmptyStateType
  var action: () -> Void
  
  public init(type: EmptyStateType, action: @escaping () -> Void) {
    self.type = type
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
      .buttonStyle(EXSmallButtonStyle())
      
    }
    .padding(16)
    .overlay(
      RoundedRectangle(cornerRadius: 16)
        .inset(by: 0.5)
        .stroke(Color.border, lineWidth: 1)
    )
  }
}

#Preview {
  EXSmallEmptyState(type: .noRecurrentPayments, action: {}).padding([.leading,.trailing], 16)
}
