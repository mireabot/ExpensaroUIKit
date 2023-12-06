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
  }
  
  public var body: some View {
    VStack {
      VStack(spacing: 5) {
        icon
          .font(.title)
          .foregroundColor(.primaryGreen)
          .padding(.bottom, 5)
        Text(type.title)
          .font(.system(.headline, weight: .bold))
        Text(type.text)
          .multilineTextAlignment(.center)
          .foregroundColor(.darkGrey)
          .font(.system(.subheadline, weight: .regular))
        
      }.padding(.bottom, 15)
      Divider()
      Button {
        action()
      } label: {
        Text(type.buttonText)
          .font(.system(.subheadline, weight: .semibold))
      }
      .buttonStyle(EXSmallButtonStyle())
      .padding(.top, 15)
      
    }
    .padding(20)
    .overlay(
      RoundedRectangle(cornerRadius: 16)
        .inset(by: 0.5)
        .stroke(Color.border, lineWidth: 1)
    )
  }
}

#Preview {
  EXLargeEmptyState(type: .noExpenses, icon: .init(systemName: "globe"), action: {}).padding([.leading,.trailing], 16)
}
