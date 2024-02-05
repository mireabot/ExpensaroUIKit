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
      return "Add Your Recurring Payments"
    case .noGoals:
      return "You have no active goals"
    }
  }
  
  var text: String {
    switch self {
    case .noBudget:
      return "You haven’t set up a budget for this month yet"
    case .noExpenses:
      return "You haven’t added any expenses for this month"
    case .noRecurrentPayments:
      return "Bills, subscriptions, and more"
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
      return "Renewal date"
    case .category:
      return "Category"
    case .initPayment:
      return "Initial payment"
    case .goalDate:
      return "Goal due date"
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
      return "Your monthly financial snapshots"
    case .topCategory:
      return "Top category for each month"
    case .overviewUpdates:
      return "We are always working on new features"
    }
  }
  
  var text: String {
    switch self {
    case .goalHint:
      return ""
    case .monthToMonth:
      return "Gain financial clarity every month. See your budgets, goal milestones and spending habits"
    case .topCategory:
      return "See where you spent most of your budget each month"
    case .overviewUpdates:
      return "New analytics tools are coming each update"
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
      return "Renewing reminder"
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
      return "You'll receive a payment reminder one day before it's due"
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
      return "How would you rate your experience with Expensaro?"
    }
  }
}


public enum BottomInfoType {
  case spendings
  case topCategory
  case transactions
  
  var title: String {
    switch self {
    case .spendings:
      return "Analyze your spendings against your budget"
    case .topCategory:
      return "Top Category Trends"
    case .transactions:
      return "Selected category breakdown"
    }
  }
  
  var text: String {
    switch self {
    case .spendings:
      return "Unlock profound budget insights, track monthly goals, and explore detailed category breakdowns"
    case .topCategory:
      return "Track your primary spending category and amount spent"
    case .transactions:
      return "Explore averages, top purchases, and more in any category"
    }
  }
}

public enum EXAlertType {
  case deleteTransaction
  case deleteGoal
  case createReminder
  case deletePayment
  
  var title: String {
    switch self {
    case .deleteTransaction:
      return "Delete transaction?"
    case .deleteGoal:
      return "Delete goal?"
    case .createReminder:
      return "Do you want to create reminder?"
    case .deletePayment:
      return "Delete recurring payment"
    }
  }
  
  var subTitle: String {
    switch self {
    case .deleteTransaction:
      return "This action is permanent and cannot be restored"
    case .deleteGoal:
      return "This action is permanent and cannot be restored"
    case .createReminder:
      return "Receive a push notification one day prior to your payment"
    case .deletePayment:
      return "This action is permanent and cannot be restored"
    }
  }
  
  var primaryButtonText: String {
    switch self {
    case .deleteTransaction:
      return "Yes, delete transaction"
    case .deleteGoal:
      return "Yes, delete goal"
    case .createReminder:
      return "Yes, I'm in"
    case .deletePayment:
      return "Yes, delete payment"
    }
  }
  
  var secondaryButtonText: String {
    switch self {
    case .deleteTransaction:
      return "No, leave transaction"
    case .deleteGoal:
      return "No, leave goal"
    case .createReminder:
      return "No, thank you"
    case .deletePayment:
      return "No, leave payment"
    }
  }
}

public enum EXDialogType {
  case deleteReminders
  case eraseData
  
  var title: String {
    switch self {
    case .deleteReminders:
      return "Payments reminders"
    case .eraseData:
      return "Reset your account"
    }
  }
  
  var text: String {
    switch self {
    case .deleteReminders:
      return "Confirm to unsubscribe from all payment reminders. This action is irreversible."
    case .eraseData:
      return "Confirm to delete all your account data. This action is irreversible."
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

public enum IconType {
  case imageName(String)
  case image(Image)
}



#Preview(body: {
  EXBottomInfoView(type: .spendings, action: {}) {
    EmptyView()
  }
})
