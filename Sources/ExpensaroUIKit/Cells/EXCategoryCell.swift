//
//  EXCategoryCell.swift
//  
//
//  Created by Mikhail Kolkov on 9/22/23.
//

import SwiftUI

public struct EXCategoryCell: View {
  var icon: String
  var title: String
  var leftIcon: Image?
  
  /// Init for categoryCell
  /// - Parameters:
  ///   - icon: icon of category
  ///   - title: name of category
  ///   - leftIcon: optional left icon for selection
  public init(icon: String, title: String, leftIcon: Image? = nil) {
    self.icon = icon
    self.title = title
    self.leftIcon = leftIcon
  }
  
  public var body: some View {
    HStack {
      Text(icon)
        .foregroundColor(.primaryGreen)
        .padding(10)
        .background(Color.backgroundGrey)
        .cornerRadius(8)
      Text(title)
        .font(.headlineRegular)
      
      Spacer()
      
      leftIcon
        .foregroundColor(.black)
    }
    .background(.white)
  }
}

#Preview {
  List {
    EXCategoryCell(icon: "🧠", title: "Travel").listRowSeparator(.hidden)
    EXCategoryCell(icon: "🧠", title: "Travel").listRowSeparator(.hidden)
    EXCategoryCell(icon: "🧠", title: "Travel").listRowSeparator(.hidden)
    EXCategoryCell(icon: "💻", title: "Travel").listRowSeparator(.hidden)
  }
  .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
  .listStyle(.plain)
  .background(Color.white)
}
