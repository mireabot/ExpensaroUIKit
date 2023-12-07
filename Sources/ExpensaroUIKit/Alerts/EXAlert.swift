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
      VStack(alignment: .leading, spacing: 5) {
        Text(type.title)
          .font(.title3Semibold)
        Text(type.subTitle)
          .font(.headlineRegular)
          .foregroundColor(.darkGrey)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.bottom, 15)
      VStack(spacing: 10) {
        Button {
          secondaryAction()
        } label: {
          Text(type.secondaryButtonText)
            .font(.headlineSemibold)
        }
        .buttonStyle(EXSecondaryPrimaryButtonStyle(showLoader: .constant(false)))
        
        Button {
          primaryAction()
        } label: {
          Text(type.primaryButtonText)
            .font(.headlineSemibold)
        }
        .buttonStyle(EXPrimaryButtonStyle(showLoader: .constant(false)))
      }
    }
    .padding(16)
    .background(.white)
    .cornerRadius(16)
  }
}

#Preview {
  EXAlert(type: .createReminder, primaryAction: {print("Delete")}, secondaryAction: {print("Leave")}).padding().background(.black)
}
