//
//  EXSmallCard.swift
//
//
//  Created by Mikhail Kolkov on 12/26/23.
//

import SwiftUI

public struct EXSmallCard: View {
  var title: String
  var header: String?
  var image: IconType
  
  public init(title: String, header: String? = nil, image: IconType) {
    self.title = title
    self.header = header
    self.image = image
  }
  public var body: some View {
    EXBaseCard {
      HStack {
        VStack(alignment: .leading, spacing: 0) {
          Text(title)
            .font(.calloutSemibold)
          if let header = header {
            Text(header)
              .font(.footnoteRegular)
              .foregroundColor(.darkGrey)
          }
        }
        Spacer()
        switch image {
        case .imageName(let imageName) where !imageName.isEmpty:
          Text(imageName)
          
        case .image(let image):
          image
            .foregroundColor(.primaryGreen)
          
        default:
          EmptyView()
        }
      }
    }
  }
}
