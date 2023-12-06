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
    VStack(alignment: .leading, spacing: 5) {
      Text(type.title)
        .font(.system(.headline, weight: .semibold))
      Text(type.text)
        .font(.system(.subheadline, weight: .regular))
        .foregroundColor(.darkGrey)
      bottomView()
    }
    .padding(16)
    .background(.white)
    .overlay(
      RoundedRectangle(cornerRadius: 16)
        .inset(by: 0.5)
        .stroke(Color.border, lineWidth: 1)
    )
  }
}

#Preview(body: {
  EXDialog(type: .deleteReminders, bottomView: {
    Button(action: {
      
    }, label: {
      Text("Delete all reminders")
        .font(.system(.subheadline, weight: .semibold))
    })
    .buttonStyle(EXPrimaryButtonStyle(showLoader: .constant(false)))
    .padding(.top, 15)
  })
  .padding([.leading,.trailing], 16)
})
