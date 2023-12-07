//
//  EXBottomInfoView.swift
//  
//
//  Created by Mikhail Kolkov on 9/25/23.
//

import SwiftUI

public struct EXBottomInfoView<BottomView: View>: View {
  var type: BottomInfoType
  let bottomView: () -> BottomView
  public init(type: BottomInfoType, @ViewBuilder bottomView: @escaping () -> BottomView) {
    self.type = type
    self.bottomView = bottomView
  }
  
  public var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      bottomView()
        .padding(16)
        .background(Color.backgroundGrey)
        .cornerRadius(16)
      Text(type.title)
        .font(.headlineSemibold)
      Text(type.text)
        .font(.subheadlineRegular)
        .foregroundColor(.darkGrey)
        .multilineTextAlignment(.leading)
    }
  }
}

#Preview {
  EXBottomInfoView(type: .topCategory) {
    Text("1")
      .frame(maxWidth: .infinity, alignment: .center)
  }
}
