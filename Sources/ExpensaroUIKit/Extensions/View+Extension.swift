//
//  View+Extension.swift
//  
//
//  Created by Mikhail Kolkov on 9/13/23.
//

import SwiftUI

public extension View {
  func shadowXS() -> some View {
    self.shadow(color: Color(red: 0.7, green: 0.72, blue: 0.73).opacity(0.09), radius: 12, x: 0, y: 12)
  }
}
