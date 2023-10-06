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
    
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    VStack {
      VStack(alignment: .leading) {
        Text(type.title)
          .font(.mukta(.semibold, size: 20))
        Text(type.subTitle)
          .font(.mukta(.regular, size: 17))
          .foregroundColor(.darkGrey)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      VStack(spacing: 10) {
        Button {
          secondaryAction()
        } label: {
          Text(type.secondaryButtonText)
            .font(.mukta(.semibold, size: 17))
        }
        .buttonStyle(SmallPrimaryButtonStyle(showLoader: .constant(false)))
        
        Button {
          primaryAction()
        } label: {
          Text(type.primaryButtonText)
            .font(.mukta(.semibold, size: 17))
        }
        .buttonStyle(PrimaryButtonStyle(showLoader: .constant(false)))
      }
    }
    .padding(16)
    .background(.white)
    .cornerRadius(12)
  }
}

struct EXAlert_Previews: PreviewProvider {
  static var previews: some View {
    EXAlert(type: .deleteTransaction, primaryAction: {print("Delete")}, secondaryAction: {print("Leave")}).padding([.leading,.trailing], 16)
  }
}
