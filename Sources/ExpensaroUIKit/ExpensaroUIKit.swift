import SwiftUI

public struct CustomLabel: View {
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

