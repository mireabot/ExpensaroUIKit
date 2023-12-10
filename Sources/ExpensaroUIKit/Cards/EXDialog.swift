//
//  EXDialog.swift
//
//
//  Created by Mikhail Kolkov on 11/18/23.
//

import SwiftUI

public struct EXDialog<BottomView: View>: View {
  var type: EXDialogType
  let bottomView: () -> BottomView
  public init(type: EXDialogType, @ViewBuilder bottomView: @escaping () -> BottomView) {
    self.type = type
    self.bottomView = bottomView
  }
  public var body: some View {
    EXBaseCard {
      VStack {
        VStack(alignment: .leading, spacing: 5) {
          Text(type.title)
            .font(.headlineSemibold)
          Text(type.text)
            .font(.subheadlineRegular)
            .foregroundColor(.darkGrey)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        bottomView()
          .padding(.top, 5)
      }
      .padding(4)
    }
  }
}

#Preview(body: {
  EXDialog(type: .deleteReminders, bottomView: {
    Button(action: {
      
    }, label: {
      Text("Delete all reminders")
        .font(.subheadlineSemibold)
    })
    .buttonStyle(EXPrimaryButtonStyle(showLoader: .constant(false)))
  })
  .padding([.leading,.trailing], 16)
})
