//
//  EXTextField.swift
//  
//
//  Created by Mikhail Kolkov on 9/13/23.
//

import SwiftUI

/// A customizable text field component with a header and placeholder.
///
/// `EXTextField` provides a reusable UI component for text input, featuring a header label and a placeholder for guiding users.
/// It is ideal for forms, user inputs, and other text-entry scenarios in the application.
///
/// ### Usage Example
/// ```swift
/// struct ContentView: View {
///     @State private var transactionName: String = ""
///
///     var body: some View {
///         EXTextField(
///             text: $transactionName,
///             header: "Transaction Name",
///             placeholder: "What did you spend money on?"
///         )
///         .padding([.leading, .trailing], 16)
///     }
/// }
/// ```
///
/// ### Parameters
/// - `text`: A `Binding<String>` representing the text input value.
/// - `header`: A `String` for the header displayed above the text field.
/// - `placeholder`: A `String` for the placeholder displayed inside the text field when it is empty.
///
/// ### Features
/// - **Header Label**: Displays a title above the text field for context.
/// - **Placeholder Text**: Guides users on what to input when the field is empty.
/// - **Styling**: Includes consistent fonts and colors, aligning with the application's design system.
/// - **Input Customization**: Supports disabling autocorrection for cleaner input, useful for specific fields like names or identifiers.
///
/// ### Notes
/// - The text field uses SwiftUI's `TextField` for input functionality.
/// - The `tint` color is set to `.primaryGreen` for a consistent design language.
///
/// ### Customization
/// You can adjust the fonts, colors, or add additional behaviors by modifying this structure.
public struct EXTextField: View {
  var text: Binding<String>
  var header: String
  var placeholder: String
  
  public init(text: Binding<String>, header: String, placeholder: String) {
    self.text = text
    self.header = header
    self.placeholder = placeholder
  }
  
  public var body: some View {
    EXBaseCard {
      VStack(alignment: .leading, spacing: 5) {
        Text(header)
          .font(.footnoteRegular)
          .foregroundColor(.darkGrey)
        TextField(placeholder, text: text)
          .tint(.primaryGreen)
          .font(.headlineRegular)
          .autocorrectionDisabled(true)
      }
    }
  }
}

// MARK: Examples
#Preview {
    EXTextField(
        text: .constant(""),
        header: "Transaction Name",
        placeholder: "What did you spend money on?"
    )
    .padding([.leading, .trailing], 16)
}
