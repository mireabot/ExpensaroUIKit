//
//  EXAlert.swift
//
//
//  Created by Mikhail Kolkov on 10/6/23.
//

import SwiftUI

public struct EXAlert<ContentView: View>: View {
  var config: (String, String, String, String)
  let contentView: ContentView?
  var primaryAction: () -> Void
  var secondaryAction: () -> Void
  
  public init(config: (String, String, String, String),@ViewBuilder contentView: () -> ContentView? = {nil},  primaryAction: @escaping ()-> Void, secondaryAction: @escaping ()-> Void) {
    self.config = config
    self.contentView = contentView()
    self.primaryAction = primaryAction
    self.secondaryAction = secondaryAction
  }
  
  public var body: some View {
    VStack {
      VStack(alignment: .leading, spacing: 3) {
        Text(config.0)
          .font(.title3Semibold)
        Text(config.1)
          .font(.headlineRegular)
          .foregroundColor(.darkGrey)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.bottom, 15)
      
      contentView
      
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
    EXAlert<EmptyView>(
      config: (EXAlertType.createBudget.title, EXAlertType.createBudget.subTitle, EXAlertType.createBudget.secondaryButtonText, EXAlertType.createBudget.primaryButtonText),
      primaryAction: {print("Delete")}, secondaryAction: {print("Leave")})
    
    EXAlert(
      config: (EXAlertType.createReminder.title, EXAlertType.createReminder.subTitle, EXAlertType.createReminder.secondaryButtonText, EXAlertType.createReminder.primaryButtonText),
      contentView: {
        HStack {
          EXSelectCell(title: "1 day prior", condition: true)
          EXSelectCell(title: "7 days prior", condition: false)
        }
      }, primaryAction: {}, secondaryAction: {})
  }
  .padding().background(Color(uiColor: .systemGray6))
}
