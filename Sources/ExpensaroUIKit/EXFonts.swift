//
//  EXFonts.swift
//  
//
//  Created by Mikhail Kolkov on 9/10/23.
//

import SwiftUI

public enum Mukta: String, CaseIterable {
  case regular = "Mukta-Regular"
  case medium = "Mukta-medium"
  case semibold = "Mukta-SemiBold"
  case bold = "Mukta-Bold"
}

extension Font {
  public static func mukta(_ mukta: Mukta, size: CGFloat) -> Font {
    return .custom(mukta.rawValue, size: size, relativeTo: .body)
  }
}

public struct MuktaFont {
  public static func registerFonts() {
    Mukta.allCases.forEach {
      registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "ttf")
    }
  }
  
  fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
    guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
          let fontProvider = CGDataProvider(url: fontURL as CFURL),
          let font = CGFont(fontProvider) else {
      fatalError("Cannot create url")
    }
    var error: Unmanaged<CFError>?
    CTFontManagerRegisterGraphicsFont(font, &error)
  }
}
