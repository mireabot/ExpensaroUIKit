//
//  File.swift
//  
//
//  Created by Mikhail Kolkov on 9/27/23.
//

import SwiftUI

extension Float {
  var clean: String {
    return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
  }
}
