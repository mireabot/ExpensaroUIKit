//
//  EXToggleCard.swift
//  
//
//  Created by Mikhail Kolkov on 9/23/23.
//

import SwiftUI

public struct EXToggleCard: View {
  @Binding var isOn: Bool
  var config: (String, String)
  
  public init(config: (String, String), isOn: Binding<Bool>) {
    self.config = config
    self._isOn = isOn
  }
  
  public var body: some View {
    EXBaseCard {
      HStack {
        VStack(alignment: .leading, spacing: 5) {
          Text(config.0)
            .font(.headlineBold)
            .foregroundColor(.black)
          
          Toggle(config.1, isOn: $isOn)
            .tint(.primaryGreen)
            .font(.footnoteRegular)
            .foregroundColor(.darkGrey)
        }
      }
      .padding(4)
    }
  }
}

#Preview {
  VStack{
    EXToggleCard(config: (ToggleType.notifications.title, ToggleType.notifications.text), isOn: .constant(true))
    EXToggleCard(config: (ToggleType.notifications.title, ToggleType.notifications.text), isOn: .constant(false))
    EXToggleCard(config: (ToggleType.notifications.title, ToggleType.notifications.text), isOn: .constant(true))
    EXToggleCard(config: (ToggleType.notifications.title, ToggleType.notifications.text), isOn: .constant(true))
  }
  .padding([.leading,.trailing], 16)
}
