//
//  EXAlert.swift
//  
//
//  Created by Mikhail Kolkov on 10/6/23.
//

import SwiftUI

public struct EXAlert: View {
  var type: EXAlertType
  var primaryAction: () -> Void
  var secondaryAction: () -> Void
  
  public init(type: EXAlertType, primaryAction: @escaping ()-> Void, secondaryAction: @escaping ()-> Void) {
    self.type = type
    self.primaryAction = primaryAction
    self.secondaryAction = secondaryAction
  }
  
  public var body: some View {
    VStack {
      VStack(alignment: .leading, spacing: 10) {
        Text(type.title)
          .font(.system(.title3, weight: .semibold))
        Text(type.subTitle)
          .font(.system(.headline, weight: .regular))
          .foregroundColor(.darkGrey)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.bottom, 10)
      VStack(spacing: 10) {
        Button {
          secondaryAction()
        } label: {
          Text(type.secondaryButtonText)
            .font(.system(.headline, weight: .semibold))
        }
        .buttonStyle(EXSecondaryPrimaryButtonStyle(showLoader: .constant(false)))
        
        Button {
          primaryAction()
        } label: {
          Text(type.primaryButtonText)
            .font(.system(.headline, weight: .semibold))
        }
        .buttonStyle(EXPrimaryButtonStyle(showLoader: .constant(false)))
      }
    }
    .padding(20)
    .background(.white)
    .cornerRadius(20)
  }
}

#Preview {
  EXAlert(type: .createReminder, primaryAction: {print("Delete")}, secondaryAction: {print("Leave")}).padding().background(.black)
}
