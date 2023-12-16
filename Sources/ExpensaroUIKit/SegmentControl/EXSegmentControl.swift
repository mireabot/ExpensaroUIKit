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
  var type: SegmentPickerType
  
  public init(currentTab: Binding<String>, type: SegmentPickerType) {
    self._currentTab = currentTab
    self.type = type
  }
  
  public var body: some View {
    HStack {
      Text(type.firstTab)
        .foregroundColor(currentTab == type.firstTab ? .white : .darkGrey)
        .font(.subheadlineSemibold)
        .padding(12)
//        .frame(maxWidth: .infinity)
        .frame(width: 120)
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
        .font(.subheadlineSemibold)
        .padding(12)
        .frame(width: 120)
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
      
      if !type.thirdTab.isEmpty {
        Text(type.thirdTab)
          .foregroundColor(currentTab == type.thirdTab ? .white : .darkGrey)
          .font(.subheadlineSemibold)
          .padding(12)
          .frame(maxWidth: .infinity)
          .background(
            ZStack {
              if currentTab == type.thirdTab {
                Color.primaryGreen
                  .cornerRadius(12)
                  .matchedGeometryEffect(id: "TAB", in: animation)
              }
            }
          )
          .onTapGesture {
            withAnimation(.interactiveSpring(response: 0.5,dampingFraction: 0.9, blendDuration: 0.9)) {
              self.currentTab = type.thirdTab
            }
          }
      }
    }
    .onAppear {
      currentTab = type.firstTab
    }
    .background(Color.backgroundGrey)
    .cornerRadius(12)
    .frame(maxWidth: .infinity)
  }
}

#Preview {
  EXSegmentControl(currentTab: .constant("Feedback"), type: .contactReason).padding(16)
}
