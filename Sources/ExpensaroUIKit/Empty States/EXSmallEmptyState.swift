//
//  EXSmallEmptyState.swift
//  
//
//  Created by Mikhail Kolkov on 9/13/23.
//

import SwiftUI

public struct EXSmallEmptyState: View {
  var type: EmptyStateType
  var isActive: Bool
  var action: () -> Void
  
  public init(type: EmptyStateType, isActive: Bool, action: @escaping () -> Void) {
    self.type = type
    self.isActive = isActive
    self.action = action
  }
  
  public var body: some View {
    EXBaseCard {
      HStack {
        VStack(alignment: .leading, spacing: 5) {
          Text(type.title)
            .font(.headlineSemibold)
          Text(type.text)
            .foregroundColor(.darkGrey)
            .font(.footnoteRegular)
          
        }
        Spacer()
        Button {
          action()
        } label: {
          Text(type.buttonText)
            .font(.subheadlineSemibold)
        }
        .buttonStyle(EXSmallPrimaryButtonStyle())
        .disabled(isActive)
      }
    }
  }
}

#Preview {
  EXSmallEmptyState(type: .noRecurrentPayments, isActive: false, action: {}).padding([.leading,.trailing], 16)
}
