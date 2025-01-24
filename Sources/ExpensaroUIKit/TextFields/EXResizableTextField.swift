//
//  File.swift
//  
//
//  Created by Mikhail Kolkov on 9/23/23.
//

import SwiftUI

/// A customizable, resizable text field with a character limit.
///
/// `EXResizableTextField` provides a text input area that dynamically adjusts its height based on content,
/// includes a character limit, and displays a character count indicator. It also features a "Clear" button
/// for quick text removal, making it ideal for scenarios like chat input or form fields.
///
/// ### Usage Example
/// ```swift
/// struct SampleView: View {
///     @State private var inputText = ""
///
///     var body: some View {
///         VStack {
///             EXResizableTextField(message: $inputText, characterLimit: 300)
///                 .padding([.leading, .trailing], 16)
///         }
///     }
/// }
/// ```
///
/// ### Parameters
/// - `message`: A `Binding<String>` that holds the text input value.
/// - `characterLimit`: An `Int` specifying the maximum allowed characters. Input exceeding this limit is truncated.
///
/// ### Features
/// - **Dynamic Height**: Automatically adjusts its height based on the content entered.
/// - **Character Limit**: Enforces a maximum character count, with a visual indicator of remaining characters.
/// - **Clear Button**: Allows users to clear the input field with a single tap.
/// - **Custom Styling**: Includes background color, padding, and corner radius for a modern UI appearance.
///
/// ### Notes
/// - The character count indicator turns red when the maximum character limit is reached.
/// - This component is built with SwiftUI's `TextEditor` for text input.
public struct EXResizableTextField: View {
  @Binding var message: String
  var characterLimit: Int
  
  public init(message: Binding<String>, characterLimit: Int) {
    self._message = message
    self.characterLimit = characterLimit
  }
  public var body: some View {
      VStack(spacing: 10) {
        EXBase(content: {
            HStack(spacing: 8) {
              withAnimation(.easeInOut) {
                TextEditor(text: $message)
                  .keyboardType(.alphabet)
                  .autocorrectionDisabled(true)
                  .tint(.primaryGreen)
                  .font(.headlineRegular)
                  .frame(minHeight: 100)
                  .colorMultiply(.backgroundGrey)
                  .expanding()
                  .onChange(of: message) { newValue in
                    if newValue.count > characterLimit {
                      message = String(newValue.prefix(characterLimit))
                    }
                  }
              }
            }
        })
      
      HStack {
        Text("\(characterLimit - message.count) characters left")
          .foregroundColor(message.count == characterLimit ? .red : .darkGrey)
          .font(.footnoteRegular)
        Spacer()
        Button {
          message = ""
        } label: {
          Text("Clear")
            .foregroundColor(.darkGrey)
            .font(.footnoteRegular)
        }
        
      }
    }
  }
}

// MARK: Examples
struct SampleEXResizableTextFieldView: View {
  @State private var message = "Hello"
  var body: some View {
    VStack {
      EXResizableTextField(message: $message, characterLimit: 300).padding([.leading,.trailing], 16)
    }
  }
}

#Preview(body: {
    SampleEXResizableTextFieldView()
})
