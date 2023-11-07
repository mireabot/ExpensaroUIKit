//
//  Colors.swift
//  
//
//  Created by Mikhail Kolkov on 9/9/23.
//

import SwiftUI
import UIKit

public extension Color {
  static var primaryGreen : Color { Color(uiColor: UIColor(red: 0.169, green: 0.38, blue: 0.451, alpha: 1.00)) } // #2b6173
  static var darkGrey : Color { Color(uiColor: UIColor(red: 0.36, green: 0.38, blue: 0.4, alpha: 1)) } // #5D6166
  static var border : Color { Color(uiColor: UIColor(red: 0.84, green: 0.85, blue: 0.86, alpha: 1)) } // #D6DADB
  static var secondaryYellow : Color { Color(uiColor: UIColor(red: 0.91, green: 0.96, blue: 0.41, alpha: 1.00)) } // #E8F569
  static var backgroundGrey : Color { Color(uiColor: UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)) } // #F9F9F9
  static var alertRedOpacity: Color { Color(red: 0.996, green: 0.945, blue: 0.945) } // #FEF2F1
  static var alertRed: Color { Color(red: 0.792, green: 0.11, blue: 0.2) } // #CA1C33
  static var alertDarkRed: Color { Color(red: 0.345, green: 0, blue: 0.008) } // #580002
}
