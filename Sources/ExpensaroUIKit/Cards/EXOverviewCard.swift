//
//  EXOverviewCard.swift
//
//
//  Created by Mikhail Kolkov on 12/23/23.
//

import SwiftUI

public struct EXOverviewCard: View {
  var header: String
  var title: String
  var icon: Image
  var subHeader: String?
  
  public init(header: String, title: String, icon: Image, subHeader: String? = nil) {
    self.header = header
    self.title = title
    self.icon = icon
    self.subHeader = subHeader
  }
  
  public var body: some View {
    EXBaseCard {
      VStack(alignment: .leading, spacing: 5) {
        HStack(alignment: .center) {
          Text(header)
            .font(.subheadlineSemibold)
            .foregroundColor(.primaryGreen)
          Spacer()
          icon
            .foregroundColor(.darkGrey)
        }
        VStack(alignment: .leading, spacing: 3) {
          Text(title)
            .font(.title2Bold)
          if let subHeader = subHeader {
            Text(subHeader)
              .font(.footnoteRegular)
              .foregroundColor(.darkGrey)
          }
        }
      }
    }
  }
}

#Preview {
  EXOverviewCard(
    header: "header",
    title: "Title",
    icon: .init(systemName: "globe"))
}
