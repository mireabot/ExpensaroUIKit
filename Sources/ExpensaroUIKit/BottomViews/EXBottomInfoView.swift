//
//  EXBottomInfoView.swift
//  
//
//  Created by Mikhail Kolkov on 9/25/23.
//

import SwiftUI

public struct EXBottomInfoView<BottomView: View>: View {
  var config: (String, String, Bool, String)
  let action: () -> Void
  let bottomView: () -> BottomView
  
  /// Config for bottom info view
  /// - Parameters:
  ///   - config: (Title, subtitle, isButton, Button text)
  ///   - action: Action of button
  ///   - bottomView: Top view
  public init(config: (String, String, Bool, String), action: @escaping ()-> Void, @ViewBuilder bottomView: @escaping () -> BottomView) {
    self.config = config
    self.action = action
    self.bottomView = bottomView
  }
  
  public var body: some View {
    ViewThatFits(in: .vertical) {
      VStack(alignment: .leading) {
        bottomView()
          .padding(.vertical, 10)
        VStack(alignment: .leading, spacing: 3) {
          Text(config.0)
            .font(.headlineSemibold)
          Text(config.1)
            .multilineTextAlignment(.leading)
            .font(.subheadlineRegular)
            .foregroundColor(.darkGrey)
        }
        
        if config.2 {
          Button(action: {
            action()
          }) {
            Text(config.3).font(.headlineSemibold)
          }
          .buttonStyle(EXPrimaryButtonStyle(showLoader: .constant(false)))
          .padding(.top, 10)
        }
      }
      .fixedSize(horizontal: false, vertical: true)
      .padding(.vertical, 16)
    }
  }
}

#Preview {
  ScrollView {
    EXBottomInfoView(
      config:
        (BottomInfoType.spendings.title, BottomInfoType.spendings.text, BottomInfoType.spendings.isButton, "test"),
      action: {}) {
      Text("1")
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.backgroundGrey)
    }
  }
  .padding([.leading,.trailing], 16)
}
