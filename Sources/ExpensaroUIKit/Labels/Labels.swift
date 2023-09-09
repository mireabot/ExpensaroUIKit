//
//  Labels.swift
//  
//
//  Created by Mikhail Kolkov on 9/9/23.
//

import SwiftUI

public struct RegularLabel: View {
  var text: String
  var fontSize: CGFloat
  
  public init(text: String, fontSize: CGFloat) {
    self.text = text
    self.fontSize = fontSize
  }
  
  public var body: some View {
    Text(text)
      .font(.system(size: fontSize, weight: .regular))
  }
}

public struct MediumLabel: View {
  var text: String
  var fontSize: CGFloat
  
  public init(text: String, fontSize: CGFloat) {
    self.text = text
    self.fontSize = fontSize
  }
  
  public var body: some View {
    Text(text)
      .font(.system(size: fontSize, weight: .medium))
  }
}

public struct SemiboldLabel: View {
  var text: String
  var fontSize: CGFloat
  
  public init(text: String, fontSize: CGFloat) {
    self.text = text
    self.fontSize = fontSize
  }
  
  public var body: some View {
    Text(text)
      .font(.system(size: fontSize, weight: .semibold))
  }
}

public struct BoldLabel: View {
  var text: String
  var fontSize: CGFloat
  
  public init(text: String, fontSize: CGFloat) {
    self.text = text
    self.fontSize = fontSize
  }
  
  public var body: some View {
    Text(text)
      .font(.system(size: fontSize, weight: .bold))
  }
}
