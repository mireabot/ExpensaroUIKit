//
//  EXToggleCard.swift
//  
//
//  Created by Mikhail Kolkov on 9/23/23.
//

import SwiftUI

public struct EXToggleCard: View {
  @Binding var isOn: Bool
  var type: ToggleType
  
  public init(type: ToggleType, isOn: Binding<Bool>) {
    self.type = type
    self._isOn = isOn
  }
  
  public var body: some View {
    EXBaseCard {
      HStack {
        VStack(alignment: .leading, spacing: 5) {
          Text(type.title)
            .font(.title3Semibold)
            .foregroundColor(.black)
          
          Toggle(type.text, isOn: $isOn)
            .tint(.primaryGreen)
            .font(.footnoteRegular)
            .foregroundColor(.darkGrey)
            .padding(.top, 5)
        }
      }
      .padding(4)
    }
  }
}

#Preview {
  EXToggleCard(type: .notifications, isOn: .constant(true)).padding([.leading,.trailing], 16)
}
