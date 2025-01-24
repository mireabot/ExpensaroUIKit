//
//  EXDialog.swift
//
//
//  Created by Mikhail Kolkov on 10/6/23.
//

import SwiftUI

/// A customizable dialog component with title, description, optional content view, and action buttons.
///
/// ### Usage Example
/// ```swift
/// // Basic confirmation dialog
/// EXDialog(
///     title: "Delete Account",
///     text: "Are you sure you want to delete your account? This action cannot be undone.",
///     primaryButtonText: "Delete",
///     secondaryButtonText: "Cancel",
///     primaryAction: {
///         handleDelete()
///     },
///     secondaryAction: {
///         dismissDialog()
///     }
/// )
///
/// // Dialog with custom content
/// EXDialog(
///     title: "Filter Results",
///     text: "Select your preferences",
///     primaryButtonText: "Apply",
///     secondaryButtonText: "Reset",
///     contentView: {
///         VStack {
///             // Custom filter options
///             FilterOptionsView()
///         }
///     },
///     primaryAction: {
///         applyFilters()
///     },
///     secondaryAction: {
///         resetFilters()
///     }
/// )
/// ```
///
/// ### Parameters
/// - `title`: Dialog heading text
/// - `text`: Supporting description text
/// - `primaryButtonText`: Text for the primary action button
/// - `secondaryButtonText`: Text for the secondary action button
/// - `contentView`: Optional custom view builder for additional content
/// - `primaryAction`: Callback for primary button tap
/// - `secondaryAction`: Callback for secondary button tap
///
/// ### Use Cases
/// - Confirmation dialogs
/// - Settings forms
/// - Filter interfaces
/// - Action prompts
/// - Custom input forms
public struct EXDialog<ContentView: View>: View {
    var title: String
    var text: String
    var primaryButtonText: String
    var secondaryButtonText: String
    let contentView: ContentView?
    var primaryAction: () -> Void
    var secondaryAction: () -> Void
    
    public init(title: String, text: String, primaryButtonText: String, secondaryButtonText: String, @ViewBuilder contentView: () -> ContentView? = {nil},  primaryAction: @escaping ()-> Void, secondaryAction: @escaping ()-> Void) {
        self.title = title
        self.text = text
        self.primaryButtonText = primaryButtonText
        self.secondaryButtonText = secondaryButtonText
        self.contentView = contentView()
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
    }
    
    public var body: some View {
        VStack {
            contentView
            
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.title3Semibold)
                Text(text)
                    .font(.headlineRegular)
                    .foregroundColor(.darkGrey)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 15)
            
            HStack(spacing: 10) {
                Button {
                    secondaryAction()
                } label: {
                    Text(secondaryButtonText)
                        .font(.headlineSemibold)
                }
                .buttonStyle(EXSecondaryPrimaryButtonStyle(showLoader: .constant(false)))
                
                Button {
                    primaryAction()
                } label: {
                    Text(primaryButtonText)
                        .font(.headlineSemibold)
                }
                .buttonStyle(EXPrimaryButtonStyle(showLoader: .constant(false)))
            }
        }
        .padding(16)
        .background(.white)
        .cornerRadius(8)
    }
}

// MARK: Examples
#Preview {
    ScrollView(showsIndicators: false) {
        EXDialog<EmptyView>(
            title: "Warning",
            text: "Are you sure you want to delete this item?",
            primaryButtonText: "Delete",
            secondaryButtonText: "Cancel",
            primaryAction: {print("Delete")}, secondaryAction: {print("Leave")})
        
        EXDialog(title: "Filter Results",
                 text: "Select your preferences",
                 primaryButtonText: "Apply",
                 secondaryButtonText: "Reset",
                 contentView: {
            Text("Custom Content View")
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(height: 120)
                .background(Color.backgroundGrey)
        },
                 primaryAction: {},
                 secondaryAction: {})
    }
    .padding().background(Color(uiColor: .systemGray6))
}
