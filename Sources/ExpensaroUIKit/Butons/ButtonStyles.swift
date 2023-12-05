//
//  SwiftUIView.swift
//
//
//  Created by Mikhail Kolkov on 9/9/23.
//

import SwiftUI

public struct EXPrimaryButtonStyle: ButtonStyle {
  @Binding var showLoader: Bool
  
  public init(showLoader: Binding<Bool>) {
    self._showLoader = showLoader
    MuktaFont.registerFonts()
  }
  
  public func makeBody(configuration: ButtonStyle.Configuration) -> some View {
    MyButton(configuration: configuration, showLoader: $showLoader)
  }
  
  struct MyButton: View {
    let configuration: ButtonStyle.Configuration
    @Environment(\.isEnabled) private var isEnabled: Bool
    @Binding var showLoader: Bool
    var body: some View {
      HStack {
        if showLoader {
          CircularProgress()
        }
        else {
          configuration.label
        }
      }
      .foregroundColor(isEnabled ? .white : .darkGrey)
      .padding(.vertical, 12)
      .frame(maxWidth: .infinity)
      .background(isEnabled ? Color.primaryGreen : Color.backgroundGrey)
      .cornerRadius(12)
      .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
  }
}

public struct EXSecondaryPrimaryButtonStyle: ButtonStyle {
  @Binding var showLoader: Bool
  
  public init(showLoader: Binding<Bool>) {
    self._showLoader = showLoader
  }
  
  public func makeBody(configuration: ButtonStyle.Configuration) -> some View {
    MyButton(configuration: configuration, showLoader: $showLoader)
  }
  
  struct MyButton: View {
    let configuration: ButtonStyle.Configuration
    @Binding var showLoader: Bool
    var body: some View {
      HStack {
        if showLoader {
          CircularProgress()
        }
        else {
          configuration.label
        }
      }
      .foregroundColor(.primaryGreen)
      .padding(.vertical, 12)
      .frame(maxWidth: .infinity)
      .background(Color.backgroundGrey)
      .cornerRadius(12)
      .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
  }
}


public struct EXSecondaryButtonStyle: ButtonStyle {
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

public struct EXDestructiveButtonStyle: ButtonStyle {
  @Binding var showLoader: Bool
  
  public init(showLoader: Binding<Bool>) {
    self._showLoader = showLoader
  }
  
  public func makeBody(configuration: ButtonStyle.Configuration) -> some View {
    MyButton(configuration: configuration, showLoader: $showLoader)
  }
  
  struct MyButton: View {
    let configuration: ButtonStyle.Configuration
    @Binding var showLoader: Bool
    var body: some View {
      HStack {
        if showLoader {
          CircularProgress()
        }
        else {
          configuration.label
        }
      }
      .foregroundColor(.white)
      .padding(.vertical, 12)
      .frame(maxWidth: .infinity)
      .background(.red)
      .cornerRadius(12)
      .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
  }
}


public struct EXSmallButtonStyle: ButtonStyle {
  public init() {}
  public func makeBody(configuration: ButtonStyle.Configuration) -> some View {
    MyButton(configuration: configuration)
  }
  
  struct MyButton: View {
    let configuration: ButtonStyle.Configuration
    var body: some View {
      configuration.label
        .padding([.vertical], 12)
        .padding([.horizontal], 25)
        .foregroundColor(.primaryGreen)
        .background(Color.backgroundGrey)
        .cornerRadius(12)
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
  }
}


public struct EXTextButtonStyle: ButtonStyle {
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

public struct EXPlainButtonStyle: ButtonStyle {
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

public struct EXStretchButtonStyle: ButtonStyle {
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
      .background(.white)
      .overlay(
        RoundedRectangle(cornerRadius: 16)
          .inset(by: 0.5)
          .stroke(Color.border, lineWidth: 1)
      )
      .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
  }
}


// MARK: - Button Circle Progress
public struct CircularProgress: View {
  @State private var isCircleRotation = true
  @State private var animationStart = false
  @State private var animationEnd = false
  
  public var body: some View {
    ZStack {
      Circle()
        .stroke(lineWidth: 4)
        .fill(Color.white)
        .frame(width: 20, height: 20)
      
      Circle()
        .trim(from: animationStart ? 1/3 : 1/9, to: animationEnd ? 2/5 : 1)
        .stroke(lineWidth: 4)
        .rotationEffect(.degrees(isCircleRotation ? 360 : 0))
        .frame(width: 20, height: 20)
        .foregroundColor(.border)
        .onAppear {
          withAnimation(Animation
            .linear(duration: 1)
            .repeatForever(autoreverses: false)) {
              self.isCircleRotation.toggle()
            }
          withAnimation(Animation
            .linear(duration: 1)
            .delay(0.5)
            .repeatForever(autoreverses: true)) {
              self.animationStart.toggle()
            }
          withAnimation(Animation
            .linear(duration: 1)
            .delay(1)
            .repeatForever(autoreverses: true)) {
              self.animationEnd.toggle()
            }
        }
    }
  }
}

#Preview {
  VStack(spacing: 20) {
    Button(action: {}) {
      Text("Label").font(.mukta(.semibold, size: 17))
    }
    .buttonStyle(EXPrimaryButtonStyle(showLoader: .constant(false)))
    
    Button(action: {}, label: {
      Text("Create category").font(.mukta(.semibold, size: 17))
    })
    .buttonStyle(EXStretchButtonStyle(icon: .init(systemName: "globe")))
    
    Button(action: {}, label: {
      Text("Label").font(.mukta(.semibold, size: 17))
    })
    .buttonStyle(EXSecondaryPrimaryButtonStyle(showLoader: .constant(false)))
    
    Button(action: {}, label: {
      Text("Label").font(.mukta(.semibold, size: 17))
    })
    .buttonStyle(EXDestructiveButtonStyle(showLoader: .constant(false)))
    
    Button(action: {}, label: {
      Text("Label").font(.mukta(.semibold, size: 17))
    })
    .buttonStyle(EXSmallButtonStyle())
  }
  .padding([.leading,.trailing], 16)
}
