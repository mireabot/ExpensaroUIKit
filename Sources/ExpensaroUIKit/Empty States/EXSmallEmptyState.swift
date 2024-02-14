//
//  EXSmallEmptyState.swift
//  
//
//  Created by Mikhail Kolkov on 9/13/23.
//

import SwiftUI

public struct EXSmallEmptyState: View {
  var config: (String, String, String)
  var isActive: Bool
  var action: () -> Void
  
  public init(config: (String, String, String), isActive: Bool, action: @escaping () -> Void) {
    self.config = config
    self.isActive = isActive
    self.action = action
  }
  
  public var body: some View {
    EXBaseCard {
      HStack {
        VStack(alignment: .leading, spacing: 3) {
          Text(config.0)
            .font(.headlineSemibold)
          Text(config.1)
            .foregroundColor(.darkGrey)
            .font(.footnoteRegular)
          
        }
        Spacer()
        Button {
          action()
        } label: {
          Text(config.2)
            .font(.subheadlineSemibold)
        }
        .buttonStyle(EXSmallPrimaryButtonStyle())
        .disabled(isActive)
      }
    }
  }
}

#Preview {
  EXSmallEmptyState(config: (EmptyStateType.noRecurrentPayments.title, EmptyStateType.noRecurrentPayments.text, EmptyStateType.noRecurrentPayments.buttonText), isActive: false, action: {}).padding([.leading,.trailing], 16)
}
