//
//  EXBottomInfoView.swift
//  
//
//  Created by Mikhail Kolkov on 9/25/23.
//

import SwiftUI

public struct EXBottomInfoView<BottomView: View>: View {
  var config: (String, String, Bool)
  let action: () -> Void
  let bottomView: () -> BottomView
  public init(config: (String, String, Bool), action: @escaping ()-> Void, @ViewBuilder bottomView: @escaping () -> BottomView) {
    self.config = config
    self.action = action
    self.bottomView = bottomView
  }
  
  public var body: some View {
    ViewThatFits(in: .vertical) {
      VStack(alignment: .leading, spacing: 10) {
        bottomView()
          .padding(.vertical, 10)
        Text(config.0)
          .font(.headlineSemibold)
        Text(config.1)
          .multilineTextAlignment(.leading)
          .font(.subheadlineRegular)
          .foregroundColor(.darkGrey)
        
        if config.2 {
          Button(action: {
            action()
          }) {
            Text("See Demo").font(.headlineSemibold)
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
        (BottomInfoType.spendings.title, BottomInfoType.spendings.text, BottomInfoType.spendings.isButton),
      action: {}) {
      Text("1")
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.backgroundGrey)
    }
  }
  .padding([.leading,.trailing], 16)
}
