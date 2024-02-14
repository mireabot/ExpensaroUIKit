//
//  EXInfoCardWithButton.swift
//  
//
//  Created by Mikhail Kolkov on 9/17/23.
//

import SwiftUI

public struct EXInfoCardWithButton: View {
  var config: (String, String)
  var icon: IconType?
  var buttonIcon: Image
  var buttonAction: () -> Void
  
  /// Init for card with icon, buttonIcon and action
  /// - Parameters:
  ///   - type: type of info card
  ///   - icon: custom icon
  public init(config: (String, String), icon: IconType, buttonIcon: Image, buttonAction: @escaping ()-> Void) {
    self.config = config
    self.icon = icon
    self.buttonIcon = buttonIcon
    self.buttonAction = buttonAction
  }
  
  public var body: some View {
    EXBaseCard {
      VStack {
        VStack(alignment: .leading, spacing: 5) {
          if let icon = icon {
            switch icon {
            case .imageName(let imageName) where !imageName.isEmpty:
              Text(imageName)
              
            case .image(let image):
              image
                .foregroundColor(.primaryGreen)
              
            default:
              EmptyView()
            }
          }
          Text(config.0)
            .font(.system(.headline, weight: .semibold))
          Text(config.1)
            .font(.system(.subheadline, weight: .regular))
            .foregroundColor(.darkGrey)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        Button {
          buttonAction()
        } label: {
          Text("How it works")
            .font(.system(.subheadline, weight: .semibold))
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(EXPrimaryButtonStyle(showLoader: .constant(false)))
        .padding(.top, 5)
      }
    }
  }
}

#Preview {
  EXInfoCardWithButton(config: (InfoCardType.monthToMonth.title, InfoCardType.monthToMonth.text), icon: .imageName("📦"), buttonIcon: .init(systemName: "globe"), buttonAction: {}).padding([.leading,.trailing], 16)
}
