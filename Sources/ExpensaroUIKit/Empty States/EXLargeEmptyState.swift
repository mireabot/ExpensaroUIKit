//
//  EXLargeEmptyState.swift
//  
//
//  Created by Mikhail Kolkov on 9/13/23.
//

import SwiftUI

public struct EXLargeEmptyState: View {
  var config: (String, String, String)
  var icon: Image
  var isActive: Bool
  var action: () -> Void
  
  public init(config: (String, String, String), icon: Image, isActive: Bool, action: @escaping () -> Void) {
    self.config = config
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
          Text(config.0)
            .font(.headlineBold)
          Text(config.1)
            .multilineTextAlignment(.center)
            .font(.subheadlineRegular)
            .foregroundColor(.darkGrey)
          
        }
        
        Button {
          action()
        } label: {
          Text(config.2)
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
    EXLargeEmptyState(config: (EmptyStateType.noBudget.title, EmptyStateType.noBudget.text, EmptyStateType.noBudget.buttonText), icon: .init(systemName: "globe"), isActive: true, action: {})
    EXLargeEmptyState(config: (EmptyStateType.noExpenses.title, EmptyStateType.noExpenses.text, EmptyStateType.noExpenses.buttonText), icon: .init(systemName: "globe"), isActive: false, action: {})
  }
  .padding([.leading,.trailing], 16)
}
