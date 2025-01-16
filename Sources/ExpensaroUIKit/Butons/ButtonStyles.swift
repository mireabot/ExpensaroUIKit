//
//  SwiftUIView.swift
//
//
//  Created by Mikhail Kolkov on 9/9/23.
//

import SwiftUI

/// A primary button style with a customizable loader, suitable for prominent actions.
///
/// This button style highlights the primary action in a view. When `showLoader` is `true`,
/// a loading spinner is displayed instead of the button's label.
///
/// ### Parameters
/// - `showLoader`: A `Binding<Bool>` that determines whether the loader should be displayed.
///
/// ### Example
/// ```swift
/// Button("Save") {
///     print("Save action triggered")
/// }
/// .buttonStyle(EXPrimaryButtonStyle(showLoader: .constant(false)))
/// ```
public struct EXPrimaryButtonStyle: ButtonStyle {
  @Binding var showLoader: Bool
  
  public init(showLoader: Binding<Bool>) {
    self._showLoader = showLoader
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

/// A secondary primary button style with a customizable loader, ideal for less emphasized primary actions.
///
/// This style is visually distinct from `EXPrimaryButtonStyle`, typically used for actions of slightly
/// lower priority.
///
/// ### Parameters
/// - `showLoader`: A `Binding<Bool>` that determines whether the loader should be displayed.
///
/// ### Example
/// ```swift
/// Button("Continue") {
///     print("Continue action triggered")
/// }
/// .buttonStyle(EXSecondaryPrimaryButtonStyle(showLoader: .constant(false)))
/// ```
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

/// A secondary button style for non-primary actions.
///
/// Use this style for secondary actions that require less visual emphasis.
///
/// ### Example
/// ```swift
/// Button("Cancel") {
///     print("Cancel action triggered")
/// }
/// .buttonStyle(EXSecondaryButtonStyle())
/// ```
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

/// A destructive button style with a customizable loader, ideal for actions like delete or remove.
///
/// This style visually emphasizes potentially harmful actions to alert users.
///
/// ### Parameters
/// - `showLoader`: A `Binding<Bool>` that determines whether the loader should be displayed.
///
/// ### Example
/// ```swift
/// Button("Delete") {
///     print("Delete action triggered")
/// }
/// .buttonStyle(EXDestructiveButtonStyle(showLoader: .constant(false)))
/// ```
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

/// A small button style, suitable for compact actions.
///
/// Use this style for actions in dense UI areas where space is limited.
///
/// ### Example
/// ```swift
/// Button {
///     print("Add goal action triggered")
/// } label: {
///     Text("Add Goal")
/// }
/// .buttonStyle(EXSmallButtonStyle())
/// ```
public struct EXSmallButtonStyle: ButtonStyle {
  public init() {}
  public func makeBody(configuration: ButtonStyle.Configuration) -> some View {
    MyButton(configuration: configuration)
  }
  
  struct MyButton: View {
    let configuration: ButtonStyle.Configuration
    var body: some View {
      configuration.label
        .padding([.vertical], 6)
        .padding([.horizontal], 12)
        .foregroundColor(.primaryGreen)
        .background(Color.backgroundGrey)
        .cornerRadius(12)
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
  }
}

/// A small primary button style for compact and emphasized actions.
///
/// This style is a variant of `EXSmallButtonStyle`, providing a higher visual priority.
///
/// ### Example
/// ```swift
/// Button("Submit") {
///     print("Submit action triggered")
/// }
/// .buttonStyle(EXSmallPrimaryButtonStyle())
/// ```
public struct EXSmallPrimaryButtonStyle: ButtonStyle {
  public init() {}
  public func makeBody(configuration: ButtonStyle.Configuration) -> some View {
    MyButton(configuration: configuration)
  }
  
  struct MyButton: View {
    @Environment(\.isEnabled) private var isEnabled: Bool
    let configuration: ButtonStyle.Configuration
    var body: some View {
      configuration.label
        .padding([.vertical], 6)
        .padding([.horizontal], 12)
        .foregroundColor(isEnabled ? .white : .darkGrey)
        .background(isEnabled ? Color.primaryGreen : Color.backgroundGrey)
        .cornerRadius(12)
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
  }
}

/// A text button style for minimal emphasis actions.
///
/// Use this style when you want a simple, inline text button without background or padding.
///
/// ### Example
/// ```swift
/// Button("Learn More") {
///     print("Learn More action triggered")
/// }
/// .buttonStyle(EXTextButtonStyle())
/// ```
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

/// A plain button style with no additional styling.
///
/// Use this style when the button should inherit its appearance from its content or parent view.
///
/// ### Example
/// ```swift
/// Button("Tap Me") {
///     print("Plain action triggered")
/// }
/// .buttonStyle(EXPlainButtonStyle())
/// ```
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

/// A stretch button style with an icon, ideal for full-width actions.
///
/// This style includes a label on the left and an icon on the right, typically used for settings or
/// navigation options.
///
/// ### Parameters
/// - `icon`: An `Image` to display on the right side of the button.
///
/// ### Example
/// ```swift
/// Button("Settings") {
///     print("Settings action triggered")
/// }
/// .buttonStyle(EXSpacedIconButtonStyle(icon: Image(systemName: "gear")))
/// ```
public struct EXSpacedIconButtonStyle: ButtonStyle {
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

// MARK: Examples
#Preview {
  VStack(spacing: 20) {
    Button(action: {}) {
      Text("Label").font(.headlineSemibold)
    }
    .buttonStyle(EXPrimaryButtonStyle(showLoader: .constant(false)))
    
    Button(action: {}, label: {
      Text("Create category").font(.headlineMedium)
    })
    .buttonStyle(EXSpacedIconButtonStyle(icon: .init(systemName: "globe")))
    
    Button(action: {}, label: {
      Text("Label").font(.headlineSemibold)
    })
    .buttonStyle(EXSecondaryPrimaryButtonStyle(showLoader: .constant(false)))
    
    Button(action: {}, label: {
      Text("Label").font(.headlineSemibold)
    })
    .buttonStyle(EXDestructiveButtonStyle(showLoader: .constant(false)))
    
    Button(action: {}, label: {
      HStack {
        Image(systemName: "plus")
        Text("Add goal").font(.headlineSemibold)
      }
    })
    .buttonStyle(EXSmallButtonStyle())
    
    Button(action: {}, label: {
      HStack {
        Image(systemName: "plus")
        Text("Add goal").font(.headlineSemibold)
      }
    })
    .buttonStyle(EXSmallPrimaryButtonStyle())
  }
  .padding([.leading,.trailing], 16)
}
