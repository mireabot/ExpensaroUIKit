//
//  EXSegmentControl.swift
//
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

public struct EXSegmentControl: View {
  @Binding var currentTab: String
  @Namespace var animation
  var config: (String, String)
  
  public init(currentTab: Binding<String>, config: (String, String)) {
    self._currentTab = currentTab
    self.config = config
  }
  
  public var body: some View {
    HStack {
      Text(config.0)
        .foregroundColor(currentTab == config.0 ? .white : .darkGrey)
        .font(.subheadlineSemibold)
        .padding(12)
        .frame(maxWidth: .infinity)
        .background(
          ZStack {
            if currentTab == config.0 {
              Color.primaryGreen
                .cornerRadius(12)
                .matchedGeometryEffect(id: "TAB", in: animation)
            }
          }
        )
        .onTapGesture {
          withAnimation(.interactiveSpring(response: 0.5,dampingFraction: 0.9, blendDuration: 0.9)) {
            self.currentTab = config.0
          }
        }
      
      Text(config.1)
        .foregroundColor(currentTab == config.1 ? .white : .darkGrey)
        .font(.subheadlineSemibold)
        .padding(12)
        .frame(maxWidth: .infinity)
        .background(
          ZStack {
            if currentTab == config.1 {
              Color.primaryGreen
                .cornerRadius(12)
                .matchedGeometryEffect(id: "TAB", in: animation)
            }
          }
        )
        .onTapGesture {
          withAnimation(.interactiveSpring(response: 0.5,dampingFraction: 0.9, blendDuration: 0.9)) {
            self.currentTab = config.1
          }
        }
    }
    .onAppear {
      currentTab = config.0
    }
    .background(Color.backgroundGrey)
    .cornerRadius(12)
    .frame(maxWidth: .infinity)
  }
}

#Preview {
  EXSegmentControl(currentTab: .constant(SegmentPickerType.transactionType.secondTab), config: (SegmentPickerType.transactionType.firstTab, SegmentPickerType.transactionType.secondTab)).padding(16)
}
