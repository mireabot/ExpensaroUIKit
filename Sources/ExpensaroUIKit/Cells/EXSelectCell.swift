//
//  EXSelectCell.swift
//
//
//  Created by Mikhail Kolkov on 12/27/23.
//

import SwiftUI

public struct EXSelectCell: View {
  var title: String
  var text: String?
  var condition: Bool
  
  public init(title: String, text: String? = nil, condition: Bool) {
    self.title = title
    self.text = text
    self.condition = condition
  }
  
  public var body: some View {
    ZStack(alignment: .topTrailing) {
      VStack(alignment: .leading, spacing: 0) {
        Spacer()
        Text(title)
          .font(.headlineBold)
          .foregroundColor(.black)
        if let text = text {
          Text(text)
            .font(.footnoteRegular)
            .foregroundColor(.darkGrey)
            .lineLimit(2)
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      
      Image(systemName: condition ? "checkmark.circle" : "circle")
        .foregroundColor(condition ? .primaryGreen : Color(uiColor: .systemGray5))
    }
    .padding(10)
    .background(Color.backgroundGrey)
    .cornerRadius(12)
    .frame(height: 80)
  }
}

#Preview {
  EXSelectCell(title: "$", condition: true)
    .padding([.leading,.trailing], 16)
}
