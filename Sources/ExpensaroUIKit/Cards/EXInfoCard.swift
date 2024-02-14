//
//  EXInfoCard.swift
//
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

public struct EXInfoCard: View {
  var config: (String, String)
  var icon: IconType?
  
  public init(config: (String, String), icon: IconType? = nil) {
    self.config = config
    self.icon = icon
  }
  
  public var body: some View {
    EXBaseCard {
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
          .font(.headlineSemibold)
        Text(config.1)
          .font(.subheadlineRegular)
          .foregroundColor(.darkGrey)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
}

#Preview {
  VStack {
    EXInfoCard(config: (InfoCardType.overviewUpdates.title, InfoCardType.overviewUpdates.text))
  }
  .padding([.leading,.trailing], 16)
}
