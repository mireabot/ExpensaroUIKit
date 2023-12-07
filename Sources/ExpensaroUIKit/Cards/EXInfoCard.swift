//
//  EXInfoCard.swift
//  
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

public struct EXInfoCard: View {
  var type: InfoCardType?
  var title: String?
  var icon: Image?
  var text: String?
  
  /// Init for card with custom icon and custom text
  /// - Parameters:
  ///   - type: type of info card
  ///   - icon: custom icon
  ///   - text: custom text
  public init(type: InfoCardType, icon: Image?, text: String?) {
    self.type = type
    self.icon = icon
    self.text = text
  }
  
  /// Init for card with custom icon and custom title and text
  /// - Parameters:
  ///   - type: type of info card
  ///   - icon: custom icon
  ///   - text: custom text
  public init(title: String?, icon: Image?, text: String?) {
    self.title = title
    self.icon = icon
    self.text = text
  }
  
  /// Init for card with title, text and icon
  /// - Parameters:
  ///   - type: type of info card
  ///   - icon: custom icon
  public init(type: InfoCardType, icon: Image?) {
    self.type = type
    self.icon = icon
  }
  
  /// Init for card with title and text
  /// - Parameter type: type of info card
  public init(type: InfoCardType) {
    self.type = type
  }
  
  public var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      icon?
        .foregroundColor(.primaryGreen)
      Text((title ?? type?.title) ?? "")
        .font(.headlineSemibold)
      Text((text ?? type?.text) ?? "")
        .font(.subheadlineRegular)
        .foregroundColor(.darkGrey)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(16)
    .overlay(
      RoundedRectangle(cornerRadius: 16)
        .inset(by: 0.5)
        .stroke(Color.border, lineWidth: 1)
    )
  }
}

#Preview {
  EXInfoCard(type: .monthToMonth)
}
