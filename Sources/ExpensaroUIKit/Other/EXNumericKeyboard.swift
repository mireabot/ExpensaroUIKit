//
//  EXNumericKeyboard.swift
//
//
//  Created by Mikhail Kolkov on 1/18/25.
//

import SwiftUI

/// A custom numeric keyboard component with configurable key press behavior.
///
/// `EXNumericKeyboard` provides a numeric keypad interface with customizable key press handling,
/// allowing for different formatting and validation rules based on specific use cases.
///
/// ###** Usage Example**
/// ```swift
/// @State private var value: String = ""
///
/// EXNumericKeyboard(
///     textValue: $value,
///     submitAction: { print("Submitted: \(value)") },
///     keyPressHandler: { key, currentValue in
///         // Custom key press logic
///         return newValue
///     }
/// )
/// ```
///
/// ###** Parameters**
/// - `textValue`: Binding to the input value string
/// - `submitAction`: Closure called when 'Done' is pressed
/// - `keyPressHandler`: Optional custom logic for handling key presses
///
public struct EXNumericKeyboard: View {
    @Binding var textValue: String
    var submitAction: () -> Void
    var keyPressHandler: ((String, String) -> String)?
    
    public init(
        textValue: Binding<String>,
        submitAction: @escaping () -> Void,
        keyPressHandler: ((String, String) -> String)? = nil
    ) {
        self._textValue = textValue
        self.submitAction = submitAction
        self.keyPressHandler = keyPressHandler
    }
    
    public var body: some View {
        VStack {
            KeyPadRow(keys: ["1", "2", "3"])
            KeyPadRow(keys: ["4", "5", "6"])
            KeyPadRow(keys: ["7", "8", "9"])
            KeyPadRow(keys: [".", "0", "Done"])
        }.environment(\.keyPadButtonAction, self.keyWasPressed(_:))
    }
    
    private func keyWasPressed(_ key: String) {
        if let customHandler = keyPressHandler {
            // Use custom handler if provided
            if key == "Done" {
                submitAction()
            } else {
                textValue = customHandler(key, textValue)
            }
        } else {
            // Default handling logic
            switch key {
            case "." where !textValue.contains("."):
                textValue += key
            case "Done":
                submitAction()
            case _ where textValue == "0.0":
                textValue = key
            default:
                if key != "." {
                    textValue += key
                    textValue = reformatTextValue(textValue)
                }
            }
        }
    }
    
    private func reformatTextValue(_ value: String) -> String {
        let components = value.components(separatedBy: ".")
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = components.count > 1 ? 2 : 0
        
        if let integerPart = Int(components.first?.replacingOccurrences(of: ",", with: "") ?? "0"),
           let formattedIntegerPart = numberFormatter.string(from: NSNumber(value: integerPart)) {
            return formattedIntegerPart + (components.count > 1 ? ".\(components.last ?? "")" : "")
        }
        return value
    }
}

// MARK: Helpers

fileprivate struct SetTFKeyboard<Content: View>: UIViewRepresentable {
  var keyboardContent: Content
  @State private var hostingController: UIHostingController<Content>?
  
  func makeUIView(context: Context) -> UIView {
    return UIView()
  }
  
  func updateUIView(_ uiView: UIView, context: Context) {
    DispatchQueue.main.async {
      if let textFieldContainerView = uiView.superview?.superview {
        if let textField = textFieldContainerView.findTextField {
          /// If the input is already set, then updating it's content
          if textField.inputView == nil {
            /// Now with the help of UIHosting Controller converting SwiftUI View into UIKit View
            hostingController = UIHostingController(rootView: keyboardContent)
            hostingController?.view.frame = .init(origin: .zero, size: hostingController?.view.intrinsicContentSize ?? .zero)
            /// Setting TF's Input view as our SwiftUI View
            textField.inputView = hostingController?.view
          } else {
            /// Updating Hosting Content
            hostingController?.rootView = keyboardContent
          }
        } else {
          print("Failed to Find TF")
        }
      }
    }
  }
}

/// Extracting TextField From the Subviews
fileprivate extension UIView {
  var allSubViews: [UIView] {
    return subviews.flatMap { [$0] + $0.subviews }
  }
  
  /// Finiding the UIView is TextField or Not
  var findTextField: UITextField? {
    if let textField = allSubViews.first(where: { view in
      view is UITextField
    }) as? UITextField {
      return textField
    }
    
    return nil
  }
}

// Design rules for specific buttons
struct KeyPadButton: View {
  var key: String
  
  var body: some View {
    Button(action: { self.action(self.key) }) {
      if key == "Done" {
        Text(key)
          .font(.system(.title3, weight: .semibold))
          .foregroundColor(.white)
          .frame(maxWidth: .infinity)
          .padding(12)
          .background(Color.primaryGreen)
          .cornerRadius(12)
      } else {
        Text(key)
          .font(.title3Semibold)
          .frame(maxWidth: .infinity)
          .padding(12)
          .background(Color.backgroundGrey)
          .cornerRadius(12)
      }
    }
    .buttonStyle(EXPlainButtonStyle())
  }
  
  enum ActionKey: EnvironmentKey {
    static var defaultValue: (String) -> Void { { _ in } }
  }
  
  @Environment(\.keyPadButtonAction) var action: (String) -> Void
}

extension EnvironmentValues {
  var keyPadButtonAction: (String) -> Void {
    get { self[KeyPadButton.ActionKey.self] }
    set { self[KeyPadButton.ActionKey.self] = newValue }
  }
}

/// Custom TextField Keyboard TextField Modifier
extension TextField {
  @ViewBuilder
  func inputView<Content: View>(@ViewBuilder content: @escaping () -> Content) -> some View {
    self
      .background {
        SetTFKeyboard(keyboardContent: content())
      }
  }
}

extension View {
  @ViewBuilder
  func inputView<Content: View>(@ViewBuilder content: @escaping () -> Content) -> some View {
    self
      .background {
        SetTFKeyboard(keyboardContent: content())
      }
  }
}

struct KeyPadRow: View {
  var keys: [String]
  
  var body: some View {
    HStack {
      ForEach(keys, id: \.self) { key in
        KeyPadButton(key: key)
      }
    }
  }
}

// MARK: Preview
struct KeyboardPreview: View {
    @State private var value: String = ""
    var body: some View {
        VStack {
            EXNumericTextField(placeholder: "Number under 100", value: $value)
            
            Spacer()
            
            EXNumericKeyboard(
                textValue: $value,
                submitAction: {
                    print("Done")
                    value = ""
                },
                keyPressHandler: { key, currentValue in
                    // Custom logic example: Only allow numbers up to 100
                    let newValue = currentValue + key
                    if let number = Int(newValue), number <= 100 {
                        return newValue
                    }
                    return currentValue
                }
            )
        }.padding(.horizontal, 16)
    }
}

#if DEBUG
#Preview(body: {
    KeyboardPreview()
})
#endif
