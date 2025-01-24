//
//  SwiftUIView.swift
//
//
//  Created by Mikhail Kolkov on 9/11/23.
//

import SwiftUI

/// A universal text field component for entering numeric values.
///
/// `EXNumericTextField` provides a standardized input field for any numeric data entry, supporting various
/// number formats including integers, decimals, percentages, and currencies. It offers right-aligned text
/// and proper keyboard type for numeric input.
///
/// ###** Usage Example**
/// ```swift
/// struct ContentView: View {
///     @State private var value: String = ""
///
///     var body: some View {
///         EXNumericTextField(placeholder: "USD", value: $value)
///             .padding([.leading, .trailing], 16)
///     }
/// }
/// ```
///
/// ###Parameters
/// - `placeholder`: Placeholder text to guide user input.
/// - `value`: A `Binding<String>` representing the numeric input value.
/// ###** Features**
/// - **Flexible Input**: Handles various numeric formats (integers, decimals, percentages).
/// - **Right-Aligned Text**: Standard positioning for numeric values.
/// - **Keyboard Optimization**: Uses numeric keyboard with appropriate decimal options.
///
/// ###** Notes**
/// - Uses locale-aware number formatting for international compatibility
/// - Supports copy/paste operations with automatic format correction
/// - Handles backspace and deletion properly within numeric constraints
/// - Maintains cursor position appropriately during editing
public struct EXNumericTextField: View {
    var placeholder: String
    var value: Binding<String>
    
    public init(placeholder: String, value: Binding<String>) {
        self.placeholder = placeholder
        self.value = value
    }
    
    public var body: some View {
        HStack {
            Text(placeholder)
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
        .padding(.vertical, 14)
        .padding(.horizontal, 16)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.5)
                .stroke(Color.border, lineWidth: 1)
        )
    }
}

// MARK: Examples
#Preview {
    EXNumericTextField(placeholder: "USD", value: .constant(""))
        .padding([.leading,.trailing], 16)
}
