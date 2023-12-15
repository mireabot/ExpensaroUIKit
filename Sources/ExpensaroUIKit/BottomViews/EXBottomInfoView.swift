//
//  EXBottomInfoView.swift
//  
//
//  Created by Mikhail Kolkov on 9/25/23.
//

import SwiftUI

public struct EXBottomInfoView<BottomView: View>: View {
  var type: BottomInfoType
  let action: () -> Void
  let bottomView: () -> BottomView
  public init(type: BottomInfoType, action: @escaping ()-> Void, @ViewBuilder bottomView: @escaping () -> BottomView) {
    self.type = type
    self.action = action
    self.bottomView = bottomView
  }
  
  public var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      bottomView()
        .padding(.vertical, 10)
      Text(type.title)
        .font(.headlineSemibold)
      Text(type.text)
        .multilineTextAlignment(.leading)
        .font(.subheadlineRegular)
        .foregroundColor(.darkGrey)
      
      if type != .transactions {
        Button(action: {
          action()
        }) {
          Text("See Demo").font(.headlineSemibold)
        }
        .buttonStyle(EXPrimaryButtonStyle(showLoader: .constant(false)))
        .padding(.top, 10)
      }
    }
  }
}

#Preview {
  EXBottomInfoView(type: .transactions, action: {}) {
    Text("1")
      .frame(maxWidth: .infinity, alignment: .center)
      .background(Color.backgroundGrey)
  }.padding([.leading,.trailing], 16)
}
