//
//  EXEmptyStateWithImage.swift
//  
//
//  Created by Mikhail Kolkov on 9/17/23.
//

import SwiftUI

public struct EXEmptyStateWithImage: View {
  var type: EmptyStateType
  var image: Image
  var buttonIcon: Image
  var action: () -> Void
  
  public init(type: EmptyStateType, image: Image, buttonIcon: Image, action: @escaping ()-> Void) {
    self.type = type
    self.image = image
    self.buttonIcon = buttonIcon
    self.action = action
  }
  
  public var body: some View {
    VStack(alignment: .center, spacing: 10) {
      image
      Text(type.title)
        .font(.system(.title3, weight: .semibold))
      Button {
        action()
      } label: {
        HStack {
          buttonIcon
            .resizable()
            .frame(width: 16, height: 16)
          Text(type.buttonText)
            .font(.system(.subheadline, weight: .semibold))
        }
        .frame(maxWidth: .infinity)
      }
      .buttonStyle(EXSmallButtonStyle())
    }
  }
}

#Preview {
  EXEmptyStateWithImage(type: .noGoals, image: .init(systemName: "globe"), buttonIcon: .init(systemName: "globe"), action: {})
}
