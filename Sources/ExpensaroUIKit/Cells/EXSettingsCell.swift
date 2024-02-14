//
//  EXSettingsCell.swift
//
//
//  Created by Mikhail Kolkov on 9/20/23.
//

import SwiftUI

public struct EXSettingsCell: View {
  @Binding var selectedCategory: String
  var config: (String, String)
  var icon: Image
  var action: ()-> Void
  
  public init(category: Binding<String>, config: (String, String), icon: Image, action: @escaping () -> Void) {
    self._selectedCategory = category
    self.config = config
    self.icon = icon
    self.action = action
  }
  
  public var body: some View {
    Button {
      selectedCategory = config.0
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
          Text(config.0)
            .font(.headlineMedium)
            .foregroundColor(.black)
          
          Text(config.1)
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
      EXSettingsCell(category: .constant(""), config: (SettingsType.categories.title, SettingsType.categories.text), icon: .init(systemName: "globe"), action: {})
      EXSettingsCell(category: .constant(""), config: (SettingsType.categories.title, SettingsType.categories.text), icon: .init(systemName: "globe"), action: {})
    }
    HStack {
      EXSettingsCell(category: .constant(""), config: (SettingsType.categories.title, SettingsType.categories.text), icon: .init(systemName: "globe"), action: {})
      EXSettingsCell(category: .constant(""), config: (SettingsType.categories.title, SettingsType.categories.text), icon: .init(systemName: "globe"), action: {})
    }
    HStack {
      EXSettingsCell(category: .constant(""), config: (SettingsType.categories.title, SettingsType.categories.text), icon: .init(systemName: "globe"), action: {})
      EXSettingsCell(category: .constant(""), config: (SettingsType.categories.title, SettingsType.categories.text), icon: .init(systemName: "globe"), action: {})
    }
    EXSettingsCell(category: .constant(""), config: (SettingsType.categories.title, SettingsType.categories.text), icon: .init(systemName: "star"), action: {})
  }.padding(.horizontal, 16)
}
