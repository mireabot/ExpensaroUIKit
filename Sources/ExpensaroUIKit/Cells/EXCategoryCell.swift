//
//  EXCategoryCell.swift
//  
//
//  Created by Mikhail Kolkov on 9/22/23.
//

import SwiftUI

public struct EXCategoryCell: View {
  var icon: Image
  var title: String
  var leftIcon: Image?
  
  /// Init for categoryCell
  /// - Parameters:
  ///   - icon: icon of category
  ///   - title: name of category
  ///   - leftIcon: optional left icon for selection
  public init(icon: Image, title: String, leftIcon: Image? = nil) {
    self.icon = icon
    self.title = title
    self.leftIcon = leftIcon
  }
  
  public var body: some View {
    HStack {
      icon
        .foregroundColor(.primaryGreen)
        .padding(12)
        .background(Color.backgroundGrey)
        .cornerRadius(12)
      
      Text(title)
        .font(.system(.headline, weight: .regular))
      
      Spacer()
      
      leftIcon
        .foregroundColor(.black)
    }
    .background(Color.white)
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    List {
      EXCategoryCell(icon: .init(systemName: "globe"), title: "Travel")
      EXCategoryCell(icon: .init(systemName: "globe"), title: "Travel")
      EXCategoryCell(icon: .init(systemName: "globe"), title: "Travel")
      EXCategoryCell(icon: .init(systemName: "globe"), title: "Travel")
    }
    .listStyle(.plain)
    .background(Color.white)
  }
}
