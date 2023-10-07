//
//  Enums.swift
//  
//
//  Created by Mikhail Kolkov on 9/13/23.
//

import SwiftUI

public enum EmptyStateType {
  case noBudget
  case noExpenses
  case noRecurrentPayments
  case noGoals
  
  var title: String {
    switch self {
    case .noBudget:
      return "No Budget Set"
    case .noExpenses:
      return "No Expenses Yet"
    case .noRecurrentPayments:
      return "Fill your recurrent payments"
    case .noGoals:
      return "You have no active goals"
    }
  }
  
  var text: String {
    switch self {
    case .noBudget:
      return "You haven’t set up budget for this month yet"
    case .noExpenses:
      return "You haven’t added any expenses for this month"
    case .noRecurrentPayments:
      return "Rent, bills, subscriptions and more"
    case .noGoals:
      return ""
    }
  }
  
  var buttonText: String {
    switch self {
    case .noBudget:
      return "Set up monthly budget"
    case .noExpenses:
      return "Add expenses"
    case .noRecurrentPayments:
      return "Add"
    case .noGoals:
      return "Create goal"
    }
  }
}

public enum SegmentPickerType {
  case transactionType
  case contactReason
  
  var firstTab: String {
    switch self {
    case .transactionType:
      return "Debit"
    case .contactReason:
      return "Feedback"
    }
  }
  
  var secondTab: String {
    switch self {
    case .transactionType:
      return "Credit"
    case .contactReason:
      return "Bug"
    }
  }
  
  var thirdTab: String {
    switch self {
    case .transactionType:
      return ""
    case .contactReason:
      return "Question"
    }
  }
}

public enum SmallSelectorType {
  case date
  case category
  case initPayment
  case goalDate
  
  var title: String {
    switch self {
    case .date:
      return "Pay date"
    case .category:
      return "Category"
    case .initPayment:
      return "Initial payment"
    case .goalDate:
      return "Goal date"
    }
  }
}

public enum InfoCardType {
  case goalHint
  case monthToMonth
  case topCategory
  case overviewUpdates
  
  var title: String {
    switch self {
    case .goalHint:
      return "How to close your goal faster?"
    case .monthToMonth:
      return "Compare your spendings month to month"
    case .topCategory:
      return "Top category for each month"
    case .overviewUpdates:
      return "We always working on new features"
    }
  }
  
  var text: String {
    switch self {
    case .goalHint:
      return ""
    case .monthToMonth:
      return "You will see your total spending amount after current month ends and data from previous month"
    case .topCategory:
      return "See where you spent the most of your budget each month"
    case .overviewUpdates:
      return "New analytics tools are incoming each month"
    }
  }
}

public enum AlertType {
  case budgetAdded
  
  var title: String {
    switch self {
    case .budgetAdded:
      return "Your budget was created"
    }
  }
}

public enum ToggleType {
  case notifications
  case analytics
  case reminders
  case eraseData
  case deleteAccount
  case paymentReminder
  
  var title: String {
    switch self {
    case .notifications:
      return "Push notifications"
    case .analytics:
      return "Performance and Analytics"
    case .reminders:
      return "Daily reminders"
    case .eraseData:
      return "Erase history"
    case .deleteAccount:
      return "Full wipe out"
    case .paymentReminder:
      return "Reminder in advance"
    }
  }
  var text: String {
    switch self {
    case .notifications:
      return "Get alerts about upcoming payments, insights and more"
    case .analytics:
      return "We will collect some data about app usage to deliver great experience"
    case .reminders:
      return "The easiest way to fail with your budget is to forget about it. We can remind you to add todays expenses at a time that suits you"
    case .eraseData:
      return "Remove all my added data"
    case .deleteAccount:
      return "Delete my profile and all related data"
    case .paymentReminder:
      return "You will receive a reminder 3 days before the date of payment"
    }
  }
  
  var toggleTitle: String {
    switch self {
    case .notifications:
      return "Enable notifications"
    case .analytics:
      return "We will collect some data about app usage to deliver great experience"
    case .reminders:
      return "Activate reminders"
    case .eraseData:
      return ""
    case .deleteAccount:
      return ""
    case .paymentReminder:
      return "Enable reminder"
    }
  }
}

public enum SettingsType {
  case categories
  case reminders
  case exportData
  case resetAccount
  case contact
  
  var image: Image {
    switch self {
    case .categories:
      return Image(systemName: "folder.circle.fill")
    case .reminders:
      return Image(systemName: "bell.circle.fill")
    case .exportData:
      return Image(systemName: "doc.circle.fill")
    case .resetAccount:
      return Image(systemName: "xmark.bin.circle.fill")
    case .contact:
      return Image(systemName: "bubble.left.circle.fill")
    }
  }
  
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
    }
  }
  
  var text: String {
    switch self {
    case .categories:
      return "Create, edit or even remove any of categories"
    case .reminders:
      return "Set up reminders and get notified when needed"
    case .exportData:
      return "Export your activity to .csv file"
    case .resetAccount:
      return "Start over, or delete account data"
    case .contact:
      return "We'd love to hear what's on your mind"
    }
  }
  
  var color: Color {
    switch self {
    case .categories:
      return .yellow
    case .reminders:
      return .pink
    case .exportData:
      return .cyan
    case .resetAccount:
      return .green
    case .contact:
      return .secondary
    }
  }
}


public enum BottomInfoType {
  case spendings
  case topCategory
  
  var title: String {
    switch self {
    case .spendings:
      return "Keep track of your spendings progress"
    case .topCategory:
      return "Top Category Spotlight"
    }
  }
  
  var text: String {
    switch self {
    case .spendings:
      return "We will calculate the percentage of changes in spending at the end of this month and the previous month"
    case .topCategory:
      return "Track your monthly spending trends, which shows your top spending category and the amount you've spent in it"
    }
  }
}

public enum EXAlertType {
  case deleteTransaction
  case deleteGoal
  
  var title: String {
    switch self {
    case .deleteTransaction:
      return "Delete transaction?"
    case .deleteGoal:
      return "Delete goal?"
    }
  }
  
  var subTitle: String {
    switch self {
    case .deleteTransaction:
      return "This action is permanent and cannot be restored"
    case .deleteGoal:
      return "This action is permanent and cannot be restored"
    }
  }
  
  var primaryButtonText: String {
    switch self {
    case .deleteTransaction:
      return "Yes, delete transaction"
    case .deleteGoal:
      return "Yes, delete goal"
    }
  }
  
  var secondaryButtonText: String {
    switch self {
    case .deleteTransaction:
      return "No, leave transaction"
    case .deleteGoal:
      return "No, leave goal"
    }
  }
}
