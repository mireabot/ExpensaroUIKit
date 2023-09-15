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
  
  var title: String {
    switch self {
    case .noBudget:
      return "No Budget Set"
    case .noExpenses:
      return "No Expenses Yet"
    case .noRecurrentPayments:
      return "Fill your recurrent payments"
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
    }
  }
}

public enum SegmentPickerType {
  case transactionType
  
  var firstTab: String {
    switch self {
    case .transactionType:
      return "Debit"
    }
  }
  
  var secondTab: String {
    switch self {
    case .transactionType:
      return "Credit"
    }
  }
}

public enum SmallSelectorType {
  case date
  case category
  
  var title: String {
    switch self {
    case .date:
      return "Pay date"
    case .category:
      return "Category"
    }
  }
}

public enum InfoCardType {
  case goalHint
  
  var title: String {
    switch self {
    case .goalHint:
      return "How to close your goal faster?"
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
  
  var title: String {
    switch self {
    case .notifications:
      return "Push Notifications"
    case .analytics:
      return "Performance and Analytics"
    }
  }
  var text: String {
    switch self {
    case .notifications:
      return "Get alerts about upcoming payments, insights and more"
    case .analytics:
      return "We will collect some data about app usage to deliver great experience"
    }
  }
}
