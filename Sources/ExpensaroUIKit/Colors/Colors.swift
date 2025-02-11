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
  static var border : Color { Color(uiColor: UIColor(red: 0.871, green: 0.878, blue: 0.89, alpha: 1)) } // #dee0e3
  static var secondaryYellow : Color { Color(uiColor: UIColor(red: 0.91, green: 0.96, blue: 0.41, alpha: 1.00)) } // #E8F569
  static var backgroundGrey : Color { Color(uiColor: UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)) } // #fafafa
  static var alertRedOpacity: Color { Color(red: 0.996, green: 0.945, blue: 0.945) } // #FEF2F1
  static var alertRed: Color { Color(red: 0.792, green: 0.11, blue: 0.2) } // #CA1C33
  static var alertDarkRed: Color { Color(red: 0.345, green: 0, blue: 0.008) } // #580002
  static var alertGreenOpacity: Color { Color(red: 0.882, green: 0.992, blue: 0.957) } // #e1fdf4
  static var alertDarkGreen: Color { Color(red: 0, green: 0.314, blue: 0.145) } // #005025
  static var alertGreen: Color { Color(red: 0.016, green: 0.69, blue: 0.435) } // #04b06f
}
