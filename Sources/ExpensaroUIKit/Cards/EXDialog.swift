//
//  EXDialog.swift
//
//
//  Created by Mikhail Kolkov on 11/18/23.
//

import SwiftUI

public struct EXDialog<BottomView: View>: View {
  var config: (String, String)
  let bottomView: BottomView?
  
  public init(config: (String, String), @ViewBuilder bottomView: () -> BottomView? = {nil}) {
    self.config = config
    self.bottomView = bottomView()
  }
  
  public var body: some View {
    EXBaseCard {
      VStack {
        VStack(alignment: .leading, spacing: 5) {
          Text(config.0)
            .font(.headlineBold)
          Text(config.1)
            .font(.subheadlineRegular)
            .foregroundColor(.darkGrey)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        bottomView
          .padding(.top, 5)
      }
      .padding(4)
    }
  }
}

extension EXDialog where BottomView == EmptyView {
  public init(_ config: (String, String)) {
    self.init(config: config, bottomView: { EmptyView() })
  }
}

#Preview(body: {
  ScrollView {
    EXDialog(config: (EXDialogType.deleteReminders.title, EXDialogType.deleteReminders.text), bottomView: {
      Button(action: {
        
      }, label: {
        Text("Delete all reminders")
          .font(.subheadlineSemibold)
      })
      .buttonStyle(EXPrimaryButtonStyle(showLoader: .constant(false)))
    })
    
    EXDialog<EmptyView>(config: (EXDialogType.eraseData.title, EXDialogType.eraseData.text))
  }
  .padding([.leading,.trailing], 16)
})
