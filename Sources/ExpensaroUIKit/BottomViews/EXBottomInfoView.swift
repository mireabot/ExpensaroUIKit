//
//  EXBottomInfoView.swift
//  
//
//  Created by Mikhail Kolkov on 9/25/23.
//

import SwiftUI

public struct EXBottomInfoView: View {
  var type: BottomInfoType
  var image: Image
  public init(type: BottomInfoType, image: Image) {
    self.type = type
    self.image = image
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      image
        .padding(.vertical, 15)
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.backgroundGrey)
        .cornerRadius(12)
      Text(type.title)
        .font(.mukta(.semibold, size: 17))
      Text(type.text)
        .font(.mukta(.regular, size: 15))
        .foregroundColor(.darkGrey)
        .multilineTextAlignment(.leading)
    }
  }
}
