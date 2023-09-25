//
//  File.swift
//  
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

public struct SuccessBottomAlert : View {
  var type: AlertType
  
  public init(type: AlertType) {
    self.type = type
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Image(systemName: "checkmark.circle")
        .resizable()
        .frame(width: 100, height: 100)
        .foregroundColor(.primaryGreen)
      Text(type.title)
        .font(.mukta(.bold, size: 24))
        .multilineTextAlignment(.center)
    }
  }
}
