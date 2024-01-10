//
//  EXSettingsRowCell.swift
//
//
//  Created by Mikhail Kolkov on 1/10/24.
//

import SwiftUI

public struct EXSettingsRowCell: View {
  var icon: IconType
  var title: String
  var rightIcon: Image?
  
  public init(icon: IconType, title: String, rightIcon: Image? = nil) {
    self.icon = icon
    self.title = title
    self.rightIcon = rightIcon
  }
  
  public var body: some View {
    HStack {
      switch icon {
      case .imageName(let imageName) where !imageName.isEmpty:
        Text(imageName)
          .foregroundColor(.primaryGreen)
          .padding(10)
          .background(Color.backgroundGrey)
          .cornerRadius(8)
        
      case .image(let image):
        image
          .foregroundColor(.primaryGreen)
          .padding(10)
          .background(Color.backgroundGrey)
          .cornerRadius(8)
        
      default:
        EmptyView()
      }
      Text(title)
        .font(.headlineRegular)
      
      Spacer()
      
      rightIcon
        .foregroundColor(.black)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

#Preview {
  EXSettingsRowCell(icon: .image(.init(systemName: "globe")), title: "Currency", rightIcon: .init(systemName: "chevron.right"))
}
