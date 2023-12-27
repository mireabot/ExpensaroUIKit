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
  var image: String?
  
  public init(title: String, header: String? = nil, image: String? = nil) {
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
        if let image = image {
          Image(image)
            .foregroundColor(.primaryGreen)
        }
      }
    }
  }
}
