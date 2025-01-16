//
//  SwiftUIView.swift
//
//
//  Created by Mikhail Kolkov on 9/11/23.
//

import SwiftUI

/// A text field component for entering currency values.
///
/// `EXTextFieldWithCurrency` provides a text field with a leading currency label (`USD`) and a stylized input field
/// for numeric values. It is designed for financial input scenarios, offering a clean and user-friendly interface.
///
/// ### Usage Example
/// ```swift
/// struct ContentView: View {
///     @State private var amount: String = ""
///
///     var body: some View {
///         EXTextFieldWithCurrency(value: $amount)
///             .padding([.leading, .trailing], 16)
///     }
/// }
/// ```
///
/// ### Parameters
/// - `value`: A `Binding<String>` representing the text input value for the currency field.
///
/// ### Features
/// - **Currency Label**: Displays a leading `USD` label for context.
/// - **Right-Aligned Input**: Ensures the input value is aligned to the right, suitable for numeric entry.
/// - **Custom Styling**: Includes padding, border styling, and font adjustments for a polished look.
///
/// ### Notes
/// - The `tint` color for the text field is set to `.clear` to avoid distracting cursor highlights.
/// - The component uses a `RoundedRectangle` with a border for consistent styling.
/// - Default placeholder text is `"0"`, guiding users to enter a value.
public struct EXTextFieldWithCurrency: View {
    var value: Binding<String>
    
    public init(value: Binding<String>) {
        self.value = value
    }
    
    public var body: some View {
        HStack {
            Text("USD")
                .font(.headlineMedium)
            Spacer()
            HStack {
                Spacer()
                TextField("0", text: value)
                    .tint(.clear)
                    .font(.headlineRegular)
                    .multilineTextAlignment(.trailing)
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .inset(by: 0.5)
                .stroke(Color.border, lineWidth: 1)
        )
    }
}

// MARK: Examples
#Preview {
    EXTextFieldWithCurrency(value: .constant(""))
        .padding([.leading,.trailing], 16)
}
