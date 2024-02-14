//
//  EXAlert.swift
//  
//
//  Created by Mikhail Kolkov on 10/6/23.
//

import SwiftUI

public struct EXAlert: View {
  var config: (String, String, String, String)
  var primaryAction: () -> Void
  var secondaryAction: () -> Void
  
  public init(config: (String, String, String, String), primaryAction: @escaping ()-> Void, secondaryAction: @escaping ()-> Void) {
    self.config = config
    self.primaryAction = primaryAction
    self.secondaryAction = secondaryAction
  }
  
  public var body: some View {
    VStack {
      VStack(alignment: .leading, spacing: 5) {
        Text(config.0)
          .font(.title3Semibold)
        Text(config.1)
          .font(.headlineRegular)
          .foregroundColor(.darkGrey)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.bottom, 15)
      VStack(spacing: 10) {
        Button {
          secondaryAction()
        } label: {
          Text(config.2)
            .font(.headlineSemibold)
        }
        .buttonStyle(EXSecondaryPrimaryButtonStyle(showLoader: .constant(false)))
        
        Button {
          primaryAction()
        } label: {
          Text(config.3)
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
  ScrollView(showsIndicators: false) {
    EXAlert(
      config: (EXAlertType.createBudget.title, EXAlertType.createBudget.subTitle, EXAlertType.createBudget.secondaryButtonText, EXAlertType.createBudget.primaryButtonText),
      primaryAction: {print("Delete")}, secondaryAction: {print("Leave")})
  }
  .padding().background(Color(uiColor: .systemGray6))
}
