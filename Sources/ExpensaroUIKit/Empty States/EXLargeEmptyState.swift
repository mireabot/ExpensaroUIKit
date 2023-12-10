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
        .padding(.top, 5)
      }
      .frame(maxWidth: .infinity)
    }
  }
}

#Preview {
  VStack {
    EXLargeEmptyState(type: .noBudget, icon: .init(systemName: "globe"), action: {})
    EXLargeEmptyState(type: .noExpenses, icon: .init(systemName: "globe"), action: {})
  }
  .padding([.leading,.trailing], 16)
}
