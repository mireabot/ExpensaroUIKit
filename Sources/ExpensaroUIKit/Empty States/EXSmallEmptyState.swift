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
  }
  
  public var body: some View {
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
