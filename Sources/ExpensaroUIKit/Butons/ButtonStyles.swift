//
//  SwiftUIView.swift
//  
//
//  Created by Mikhail Kolkov on 9/9/23.
//

import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
  public init() {}
  public func makeBody(configuration: ButtonStyle.Configuration) -> some View {
    MyButton(configuration: configuration)
  }
  
  struct MyButton: View {
    let configuration: ButtonStyle.Configuration
    @Environment(\.isEnabled) private var isEnabled: Bool
    var body: some View {
      configuration.label
        .foregroundColor(isEnabled ? .white : .darkGrey)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(isEnabled ? Color.primaryGreen : Color.backgroundGrey)
        .cornerRadius(8)
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
  }
}

public struct SecondaryButtonStyle: ButtonStyle {
  public init() {}
  public func makeBody(configuration: ButtonStyle.Configuration) -> some View {
    MyButton(configuration: configuration)
  }
  
  struct MyButton: View {
    let configuration: ButtonStyle.Configuration
    @Environment(\.isEnabled) private var isEnabled: Bool
    var body: some View {
      configuration.label
        .foregroundColor(isEnabled ? .primaryGreen : .darkGrey)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(isEnabled ? Color.secondaryYellow : Color.backgroundGrey)
        .cornerRadius(8)
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
  }
}

public struct SmallButtonStyle: ButtonStyle {
  public init() {}
  public func makeBody(configuration: ButtonStyle.Configuration) -> some View {
    MyButton(configuration: configuration)
  }
  
  struct MyButton: View {
    let configuration: ButtonStyle.Configuration
    var body: some View {
      configuration.label
        .padding([.vertical], 7)
        .padding([.horizontal], 20)
        .foregroundColor(.primaryGreen)
        .background(Color.backgroundGrey)
        .cornerRadius(8)
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
  }
}


public struct TextButtonStyle: ButtonStyle {
  public init() {}
  public func makeBody(configuration: ButtonStyle.Configuration) -> some View {
    MyButton(configuration: configuration)
  }
  
  struct MyButton: View {
    let configuration: ButtonStyle.Configuration
    var body: some View {
      configuration.label
        .foregroundColor(.primaryGreen)
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
  }
}

public struct PlainButtonStyle: ButtonStyle {
  public init() {}
  public func makeBody(configuration: ButtonStyle.Configuration) -> some View {
    MyButton(configuration: configuration)
  }
  
  struct MyButton: View {
    let configuration: ButtonStyle.Configuration
    var body: some View {
      configuration.label
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
  }
}

public struct StretchButtonStyle: ButtonStyle {
  let icon: Image
  
  public init(icon: Image) {
    self.icon = icon
  }
  
  public func makeBody(configuration: ButtonStyle.Configuration) -> some View {
    MyButton(configuration: configuration, icon: icon)
  }
  
  struct MyButton: View {
    let configuration: ButtonStyle.Configuration
    let icon: Image
    var body: some View {
      HStack(alignment: .center) {
        configuration.label
        Spacer()
        icon
          .font(.callout)
          .foregroundColor(.darkGrey)
      }
      .padding(15)
      .overlay(
        RoundedRectangle(cornerRadius: 12)
          .inset(by: 0.5)
          .stroke(Color.border, lineWidth: 1)
      )
      .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
  }
}
