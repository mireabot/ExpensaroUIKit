//
//  LargeEmptyState.swift
//  
//
//  Created by Mikhail Kolkov on 9/9/23.
//

import SwiftUI

public struct LargeEmptyState: View {
  var image: Image
  var title: String
  var text: String
  var buttonText: String
  var action: () -> Void
  
  /// Large empty state for home module
  /// - Parameters:
  ///   - image: Icon image
  ///   - title: Title of state
  ///   - text: Suplimental text of state
  ///   - action: Action for button
  ///   - buttonText: Text of button
  public init(image: Image, title: String, text: String, action: @escaping () -> Void, buttonText: String) {
    self.image = image
    self.title = title
    self.text = text
    self.action = action
    self.buttonText = buttonText
  }
  
  public var body: some View {
    VStack(spacing: 10) {
      image
        .resizable()
        .frame(width: 30, height: 30)
        .foregroundColor(Colors.shared.primaryGreen)
        .padding(15)
        .background(Colors.shared.backgroundGrey)
        .cornerRadius(30)
      
      VStack(alignment: .center, spacing: 10) {
        MediumLabel(text: title, fontSize: 17)
        RegularLabel(text: text, fontSize: 15)
          .foregroundColor(Colors.shared.darkGrey)
      }
      .padding(.bottom, 20)
      
      Divider().foregroundColor(Color(red: 0.84, green: 0.85, blue: 0.86))
      
      Button {
        action()
      } label: {
        MediumLabel(text: buttonText, fontSize: 17).frame(maxWidth: .infinity)
      }
      .buttonStyle(SmallButtonStyle())
      .padding(.top, 20)
      
    }
    .padding([.vertical,.horizontal], 25)
    .overlay(
      RoundedRectangle(cornerRadius: 10)
        .inset(by: 0.5)
        .stroke(Color(red: 0.84, green: 0.85, blue: 0.86), lineWidth: 1)
    )
    
  }
}
