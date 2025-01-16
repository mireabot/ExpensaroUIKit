//
//  ViewModifiers.swift
//
//
//  Created by Mikhail Kolkov on 1/15/25.
//

import SwiftUI

@available(iOS 15.0, *)
struct ExpandingModifier: ViewModifier {
  @State private var contentSize: CGSize = CGSize(width: UIScreen.main.bounds.width, height: 100)
  
  func body(content: Content) -> some View {
    content
      .frame(height: contentSize.height)
      .background(
        GeometryReader { geometry in
          Color.clear.onAppear {
            contentSize = geometry.size
          }
        }
      )
  }
}
