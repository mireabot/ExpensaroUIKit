//
//  EXSelectCell.swift
//
//
//  Created by Mikhail Kolkov on 12/27/23.
//

import SwiftUI

public struct EXSelectCell: View {
  var title: String
  var selectIcon: Image
  var condition: Bool?
  
  public init(title: String, selectIcon: Image, condition: Bool? = nil) {
    self.title = title
    self.selectIcon = selectIcon
    self.condition = condition
  }
  
  public var body: some View {
    HStack {
      Text(title)
        .font(.headlineRegular)
      Spacer()
      selectIcon
        .foregroundColor(condition ?? false ? .black : .clear)
    }
    .padding(.vertical, 25)
    .padding(.horizontal, 16)
    .background(condition ?? false ? Color.backgroundGrey : .clear)
    .cornerRadius(12)
  }
}

#Preview {
  EXSelectCell(title: "Every week", selectIcon: Image(systemName: "checkmark"), condition: true).padding([.leading,.trailing], 16)
}
