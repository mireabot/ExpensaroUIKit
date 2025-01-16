//
//  Enums.swift
//
//
//  Created by Mikhail Kolkov on 9/13/23.
//

import SwiftUI


/// An enum representing various settings options in the application.
///
/// `SettingsType` is used to define different settings categories and their associated titles and descriptions.
/// It provides a structured way to represent and manage settings options within the application.
///
/// ### Usage Example
/// ```swift
/// // Using the predefined settings types
/// let type = SettingsType.categories
/// print(type.title) // Outputs: "Categories"
/// print(type.text)  // Outputs: "Create, edit or remove any of categories"
///
/// // Creating a custom settings type for specific cases
/// enum CustomSettingsType {
///     case customOption
///
///     var title: String {
///         switch self {
///         case .customOption:
///             return "Custom Option"
///         }
///     }
///
///     var text: String {
///         switch self {
///         case .customOption:
///             return "This is a custom description for your new settings type."
///         }
///     }
/// }
///
/// let customType = CustomSettingsType.customOption
/// print(customType.title) // Outputs: "Custom Option"
/// print(customType.text)  // Outputs: "This is a custom description for your new settings type."
/// ```
///
/// ### Parameters
/// - `title`: A user-friendly name for the settings type.
/// - `text`: A description or context for the settings type, explaining its purpose or functionality.
///
/// ### Notes
/// You can extend the functionality by creating your own enums or data models for specific cases.
/// Ensure to follow the same structure and execution pattern as `SettingsType` to maintain consistency.
public enum SettingsType {
  case categories
  case reminders
  case exportData
  case resetAccount
  case contact
  case appSettings
  case wishKit
  case rateApp
  
  var title: String {
    switch self {
    case .categories:
      return "Categories"
    case .reminders:
      return "Reminders"
    case .exportData:
      return "Export Data"
    case .resetAccount:
      return "Reset Data"
    case .contact:
      return "Contact"
    case .appSettings:
      return "General Settings"
    case .wishKit:
      return "Features Hub"
    case .rateApp:
      return "Rate App"
    }
  }
  
  var text: String {
    switch self {
    case .categories:
      return "Create, edit or remove any of categories"
    case .reminders:
      return "Set up reminders and get notified instantly"
    case .exportData:
      return "Export your financial activity to .csv file"
    case .resetAccount:
      return "Start over, or delete account data"
    case .contact:
      return "We'd love to hear what's on your mind"
    case .appSettings:
      return "Tailor settings to your preference"
    case .wishKit:
      return "Vote for new features or create your own"
    case .rateApp:
      return "Rate your experience with Expensaro?"
    }
  }
}


public enum EXToasts {
  case none
  case emptyName
  case zeroAmount
  case budgetExceed
  case zeroBudget
  case wrongDate
  case pastDate
  case remindersDeleted
  case feebackSent
  
  public var text: String {
    switch self {
    case .none:
      return ""
    case .emptyName:
      return "The name field cannot be empty"
    case .zeroAmount:
      return "Amount cannot be $0"
    case .budgetExceed:
      return "Budget exceeded"
    case .zeroBudget:
      return "You need to create a budget first"
    case .wrongDate:
      return "Date should be in current month"
    case .pastDate:
      return "Date cannot be in the past"
    case .remindersDeleted:
      return "You have unsubscribed from reminders"
    case .feebackSent:
      return "We got your information and will get back very shortly!"
    }
  }
  
  public var isSuccess: Bool {
    switch self {
    case .none:
      return false
    case .emptyName:
      return false
    case .zeroAmount:
      return false
    case .budgetExceed:
      return false
    case .zeroBudget:
      return false
    case .wrongDate:
      return false
    case .pastDate:
      return false
    case .remindersDeleted:
      return true
    case .feebackSent:
      return true
    }
  }
}

/// An enum representing different types of icons that can be used in the application.
///
/// `IconType` provides flexibility to define icons in two ways:
/// 1. `imageName(String)`: Allows the use of a string-based icon, such as an emoji or custom text.
/// 2. `image(Image)`: Supports SwiftUI `Image`, which can include system images or custom assets.
///
/// This enum is designed to standardize how icons are represented and used across various components in the application.
///
/// ### Usage Example
/// ```swift
/// // Using an emoji as an icon
/// let emojiIcon: IconType = .imageName("📊")
///
/// // Using a SwiftUI system image as an icon
/// let systemIcon: IconType = .image(.init(systemName: "star"))
///
/// // Implementation in a view
/// struct ExampleView: View {
///     var icon: IconType
///
///     var body: some View {
///         switch icon {
///         case .imageName(let imageName):
///             Text(imageName)
///                 .font(.largeTitle)
///         case .image(let image):
///             image
///                 .resizable()
///                 .frame(width: 40, height: 40)
///         }
///     }
/// }
///
/// // Example usage in SwiftUI
/// ExampleView(icon: .imageName("🔔"))
/// ExampleView(icon: .image(.init(systemName: "bell")))
/// ```
///
/// ### Parameters
/// - `imageName`: A `String` representing an emoji or text-based icon.
/// - `image`: A SwiftUI `Image` object for system or custom image assets.
///
/// ### Notes
/// - The `IconType` enum provides a standardized way to handle icons, ensuring consistency in UI components.
/// - Use `imageName` for emojis or simple text-based icons.
/// - Use `image` for more complex or detailed icons, like those from SF Symbols or custom image assets.
public enum IconType {
    case imageName(String)  // Emoji or string-based icon
    case image(Image)       // SwiftUI image
}
