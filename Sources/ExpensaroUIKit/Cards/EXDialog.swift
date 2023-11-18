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
    MuktaFont.registerFonts()
  }
  public var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text(type.title)
        .font(.mukta(.semibold, size: 17))
      Text(type.text)
        .font(.mukta(.regular, size: 15))
        .foregroundColor(.darkGrey)
      bottomView()
    }
    .padding(16)
    .background(Color.backgroundGrey)
    .cornerRadius(16)
  }
}

#Preview(body: {
  EXDialog(type: .eraseData, bottomView: {
    Button(action: {
      print("Hello")
    }, label: {
      Text("Delete all reminders")
        .font(.mukta(.semibold, size: 15))
    })
    .buttonStyle(EXDestructiveButtonStyle())
    .padding(.top, 15)
  })
  .padding([.leading,.trailing], 16)
})
