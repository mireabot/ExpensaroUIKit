//
//  SwiftUIView.swift
//  
//
//  Created by Mikhail Kolkov on 9/9/23.
//

import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
  public func makeBody(configuration: ButtonStyle.Configuration) -> some View {
    MyButton(configuration: configuration)
  }
  
  struct MyButton: View {
    let configuration: ButtonStyle.Configuration
    @Environment(\.isEnabled) private var isEnabled: Bool
    var body: some View {
      configuration.label
        .foregroundColor(isEnabled ? .white : Colors.shared.darkGrey)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(isEnabled ? Colors.shared.primaryGreen : Colors.shared.backgroundGrey)
        .cornerRadius(10)
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
  }
}

public struct SecondaryButtonStyle: ButtonStyle {
  public func makeBody(configuration: ButtonStyle.Configuration) -> some View {
    MyButton(configuration: configuration)
  }
  
  struct MyButton: View {
    let configuration: ButtonStyle.Configuration
    @Environment(\.isEnabled) private var isEnabled: Bool
    var body: some View {
      configuration.label
        .foregroundColor(isEnabled ? Colors.shared.primaryGreen : Colors.shared.darkGrey)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(isEnabled ? Colors.shared.secondaryYellow : Colors.shared.backgroundGrey)
        .cornerRadius(8)
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
  }
}

public struct SmallButtonStyle: ButtonStyle {
  public func makeBody(configuration: ButtonStyle.Configuration) -> some View {
    MyButton(configuration: configuration)
  }
  
  struct MyButton: View {
    let configuration: ButtonStyle.Configuration
    var body: some View {
      configuration.label
        .foregroundColor(Colors.shared.primaryGreen)
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .background(Colors.shared.backgroundGrey)
        .cornerRadius(10)
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
  }
}


public struct TextButtonStyle: ButtonStyle {
  public func makeBody(configuration: ButtonStyle.Configuration) -> some View {
    MyButton(configuration: configuration)
  }
  
  struct MyButton: View {
    let configuration: ButtonStyle.Configuration
    var body: some View {
      configuration.label
        .foregroundColor(Colors.shared.primaryGreen)
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
  }
}
