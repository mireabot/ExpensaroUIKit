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
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    VStack(alignment: .center, spacing: 10) {
      image
      Text(type.title)
        .font(.mukta(.bold, size: 20))
      Button {
        action()
      } label: {
        HStack {
          buttonIcon
            .resizable()
            .frame(width: 16, height: 16)
          Text(type.buttonText)
            .font(.mukta(.semibold, size: 15))
        }
        .frame(maxWidth: .infinity)
      }
      .buttonStyle(SmallButtonStyle())
    }
  }
}
