//
//  EXSettingsCell.swift
//
//
//  Created by Mikhail Kolkov on 9/20/23.
//

import SwiftUI

public struct EXSettingsCell: View {
  @Binding var selectedCategory: String
  var type: SettingsType
  var icon: Image
  var action: ()-> Void
  public init(category: Binding<String>, type: SettingsType, icon: Image, action: @escaping () -> Void) {
    self._selectedCategory = category
    self.type = type
    self.icon = icon
    self.action = action
  }
  public var body: some View {
    Button {
      selectedCategory = type.title
      action()
    } label: {
      VStack(alignment: .leading, spacing: 10) {
        icon
          .resizable()
          .frame(width: 20, height: 20)
          .foregroundColor(.white)
          .padding(8)
          .background(Color.primaryGreen)
          .cornerRadius(10)
        VStack(alignment: .leading, spacing: 5) {
          Text(type.title)
            .font(.headlineMedium)
            .foregroundColor(.black)
          
          Text(type.text)
            .font(.footnoteRegular)
            .foregroundColor(.darkGrey)
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(20)
      .background(Color.backgroundGrey)
      .cornerRadius(20)
    }
    .buttonStyle(EXPlainButtonStyle())

  }
}

#Preview {
  VStack {
    HStack {
      EXSettingsCell(category: .constant(""), type: .categories, icon: .init(systemName: "globe"), action: {})
      EXSettingsCell(category: .constant(""), type: .reminders, icon: .init(systemName: "globe"), action: {})
    }
    HStack {
      EXSettingsCell(category: .constant(""), type: .appSettings, icon: .init(systemName: "globe"), action: {})
      EXSettingsCell(category: .constant(""), type: .resetAccount, icon: .init(systemName: "globe"), action: {})
    }
    HStack {
      EXSettingsCell(category: .constant(""), type: .contact, icon: .init(systemName: "globe"), action: {})
      EXSettingsCell(category: .constant(""), type: .wishKit, icon: .init(systemName: "globe"), action: {})
    }
    EXSettingsCell(category: .constant(""), type: .rateApp, icon: .init(systemName: "star"), action: {})
  }.padding(.horizontal, 16)
}
