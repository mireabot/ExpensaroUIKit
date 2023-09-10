//
//  SmallEmptyState.swift
//  
//
//  Created by Mikhail Kolkov on 9/9/23.
//

import SwiftUI

public struct SmallEmptyState: View {
  var title: String
  var text: String
  var buttonText: String
  var action: () -> Void
  
  /// Small empty state for home module
  /// - Parameters:
  ///   - title: Title of state
  ///   - text: Suplimental text of state
  ///   - buttonText: Text of button
  ///   - action: Action for button
  public init(title: String, text: String, buttonText: String, action: @escaping () -> Void) {
    self.title = title
    self.text = text
    self.buttonText = buttonText
    self.action = action
  }
  
  public var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 5) {
        MediumLabel(text: title, fontSize: 20)
        RegularLabel(text: text, fontSize: 17).foregroundColor(Colors.shared.darkGrey)
      }
      Spacer()
      
      Button {
        action()
      } label: {
        MediumLabel(text: buttonText, fontSize: 17)
      }
      .buttonStyle(SmallButtonStyle())

    }
    .padding([.vertical,.horizontal], 15)
    .overlay(
      RoundedRectangle(cornerRadius: 10)
        .inset(by: 0.5)
        .stroke(Color(red: 0.84, green: 0.85, blue: 0.86), lineWidth: 1)
    )
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    SmallEmptyState(title: "Hello", text: "Hey", buttonText: "Add", action: {})
  }
}
