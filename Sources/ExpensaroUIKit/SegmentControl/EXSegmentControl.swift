//
//  EXSegmentControl.swift
//  
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

public struct EXSegmentControl: View {
  @State private var currentTab = ""
  @Namespace var animation
  var type: SegmentPickerType
  
  public init(currentTab: String = "", type: SegmentPickerType) {
    self.currentTab = currentTab
    self.type = type
    MuktaFont.registerFonts()
  }
  
  public var body: some View {
    HStack {
      Text(type.firstTab)
        .foregroundColor(currentTab == type.firstTab ? .white : .darkGrey)
        .font(.mukta(.semibold, size: 15))
        .padding(8)
        .frame(maxWidth: .infinity)
        .background(
          ZStack {
            if currentTab == type.firstTab {
              Color.primaryGreen
                .cornerRadius(12)
                .matchedGeometryEffect(id: "TAB", in: animation)
            }
          }
        )
        .onTapGesture {
          withAnimation(.interactiveSpring(response: 0.5,dampingFraction: 0.9, blendDuration: 0.9)) {
            self.currentTab = type.firstTab
          }
        }
      
      Text(type.secondTab)
        .foregroundColor(currentTab == type.secondTab ? .white : .darkGrey)
        .font(.mukta(.semibold, size: 15))
        .padding(8)
        .frame(maxWidth: .infinity)
        .background(
          ZStack {
            if currentTab == type.secondTab {
              Color.primaryGreen
                .cornerRadius(12)
                .matchedGeometryEffect(id: "TAB", in: animation)
            }
          }
        )
        .onTapGesture {
          withAnimation(.interactiveSpring(response: 0.5,dampingFraction: 0.9, blendDuration: 0.9)) {
            self.currentTab = type.secondTab
          }
        }
    }
    .onAppear {
      currentTab = type.firstTab
    }
    .padding(2)
    .background(Color.backgroundGrey)
    .cornerRadius(12)
  }
}
