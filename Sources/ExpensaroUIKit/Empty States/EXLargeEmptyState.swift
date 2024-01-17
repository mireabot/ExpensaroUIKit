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
  var isActive: Bool
  var action: () -> Void
  
  public init(type: EmptyStateType, icon: Image, isActive: Bool, action: @escaping () -> Void) {
    self.type = type
    self.icon = icon
    self.isActive = isActive
    self.action = action
  }
  
  public var body: some View {
    EXBaseCard {
      VStack {
        VStack(spacing: 5) {
          icon
            .foregroundColor(.primaryGreen)
            .padding(.bottom, 5)
          Text(type.title)
            .font(.headlineBold)
          Text(type.text)
            .multilineTextAlignment(.center)
            .font(.subheadlineRegular)
            .foregroundColor(.darkGrey)
          
        }
        
        Button {
          action()
        } label: {
          Text(type.buttonText)
            .font(.subheadlineSemibold)
        }
        .buttonStyle(EXSmallPrimaryButtonStyle())
        .disabled(isActive)
        .padding(.top, 5)
      }
      .frame(maxWidth: .infinity)
    }
  }
}

#Preview {
  VStack {
    EXLargeEmptyState(type: .noBudget, icon: .init(systemName: "globe"), isActive: true, action: {})
    EXLargeEmptyState(type: .noExpenses, icon: .init(systemName: "globe"), isActive: false, action: {})
  }
  .padding([.leading,.trailing], 16)
}
