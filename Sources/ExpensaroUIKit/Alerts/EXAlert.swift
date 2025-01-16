//
//  EXAlert.swift
//
//
//  Created by Mikhail Kolkov on 10/6/23.
//

import SwiftUI

/// A customizable alert view for displaying titles, descriptions, visual content, and actions.
///
/// `EXAlert` provides a flexible way to present an alert with configurable text, buttons,
/// and optional visual content. The alert includes primary and secondary actions, making it
/// suitable for various user interactions.
///
/// ### Usage Example
/// ```swift
/// // Example 1: Simple alert with title, description, and actions
/// EXAlert<EmptyView>(
///     config: ("Warning", "Are you sure you want to delete this item?", "Cancel", "Delete"),
///     primaryAction: {
///         print("Delete action triggered")
///     },
///     secondaryAction: {
///         print("Cancel action triggered")
///     }
/// )
///
/// // Example 2: Alert with additional content (custom views)
/// EXAlert(
///     config: ("Reminder", "Set your notification preferences.", "Skip", "Set"),
///     contentView: {
///         HStack {
///             EXSelectCell(title: "1 day prior", condition: true)
///             EXSelectCell(title: "7 days prior", condition: false)
///         }
///     },
///     primaryAction: {
///         print("Set action triggered")
///     },
///     secondaryAction: {
///         print("Skip action triggered")
///     }
/// )
/// ```
///
/// - Note: `EXAlert` supports styling through custom button styles (`EXPrimaryButtonStyle` and
///   `EXSecondaryPrimaryButtonStyle`) and adjusts dynamically based on the provided content.
///
/// ### Parameters
/// - `config`: A tuple containing the title, description, secondary button text, and primary button text.
///     - Example: `("Title", "Description text", "Cancel", "Confirm")`
/// - `contentView`: An optional closure that returns a custom SwiftUI view to display additional content inside the alert.
///     - Default: `nil` (no additional content).
///     - Example:
///         ```swift
///         HStack {
///             EXSelectCell(title: "Option 1", condition: true)
///             EXSelectCell(title: "Option 2", condition: false)
///         }
///         ```
/// - `primaryAction`: A closure to execute when the primary button is tapped.
///     - Example:
///         ```swift
///         primaryAction: {
///             print("Primary action triggered")
///         }
///         ```
/// - `secondaryAction`: A closure to execute when the secondary button is tapped.
///     - Example:
///         ```swift
///         secondaryAction: {
///             print("Secondary action triggered")
///         }
///         ```
public struct EXAlert<ContentView: View>: View {
  var config: (String, String, String, String)
  let contentView: ContentView?
  var primaryAction: () -> Void
  var secondaryAction: () -> Void
  
  public init(config: (String, String, String, String),@ViewBuilder contentView: () -> ContentView? = {nil},  primaryAction: @escaping ()-> Void, secondaryAction: @escaping ()-> Void) {
    self.config = config
    self.contentView = contentView()
    self.primaryAction = primaryAction
    self.secondaryAction = secondaryAction
  }
  
  public var body: some View {
    VStack {
      VStack(alignment: .leading, spacing: 3) {
        Text(config.0)
          .font(.title3Semibold)
        Text(config.1)
          .font(.headlineRegular)
          .foregroundColor(.darkGrey)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.bottom, 15)
      
      contentView
      
      VStack(spacing: 10) {
        Button {
          secondaryAction()
        } label: {
          Text(config.2)
            .font(.headlineSemibold)
        }
        .buttonStyle(EXSecondaryPrimaryButtonStyle(showLoader: .constant(false)))
        
        Button {
          primaryAction()
        } label: {
          Text(config.3)
            .font(.headlineSemibold)
        }
        .buttonStyle(EXPrimaryButtonStyle(showLoader: .constant(false)))
      }
    }
    .padding(16)
    .background(.white)
    .cornerRadius(16)
  }
}

// MARK: Examples
//#Preview {
//  ScrollView(showsIndicators: false) {
//    EXAlert<EmptyView>(
//      config: (EXAlertType.createBudget.title, EXAlertType.createBudget.subTitle, EXAlertType.createBudget.secondaryButtonText, EXAlertType.createBudget.primaryButtonText),
//      primaryAction: {print("Delete")}, secondaryAction: {print("Leave")})
//  }
//  .padding().background(Color(uiColor: .systemGray6))
//}
