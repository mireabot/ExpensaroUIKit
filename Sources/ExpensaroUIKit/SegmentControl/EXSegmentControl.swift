//
//  EXSegmentControl.swift
//
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

/// A customizable segmented control component supporting multiple tabs.
///
/// `EXSegmentControl` provides an interactive segmented control with dynamic tab support.
/// Features smooth animations and visual feedback for selected states.
///
/// ###** Usage Example**
/// ```swift
/// struct ContentView: View {
///     @State private var selectedTab: String = ""
///     let tabs = ["Tab 1", "Tab 2", "Tab 3"]
///
///     var body: some View {
///         EXSegmentControl(
///             currentTab: $selectedTab,
///             tabs: tabs
///         )
///         .padding(16)
///     }
/// }
/// ```
///
/// ###** Parameters**
/// - `currentTab`: A `Binding<String>` tracking the selected tab
/// - `tabs`: Array of strings representing tab labels
///
/// ###** Features**
/// - Dynamic tab support via string array
/// - Interactive spring animations
/// - Automatic color transitions
/// - Matched geometry effects for smooth tab switching
/// - Auto-selects first tab on appearance
public struct EXSegmentControl: View {
    @Binding var currentTab: String
    @Namespace var animation
    var tabs: [String]
    
    public init(currentTab: Binding<String>, tabs: [String]) {
        self._currentTab = currentTab
        self.tabs = tabs
    }
    
    public var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                Text(tab)
                    .foregroundColor(currentTab == tab ? .white : .darkGrey)
                    .font(.subheadlineSemibold)
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(
                        ZStack {
                            if currentTab == tab {
                                Color.primaryGreen
                                    .cornerRadius(8)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                    )
                    .onTapGesture {
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.9, blendDuration: 0.9)) {
                            self.currentTab = tab
                        }
                    }
            }
        }
        .onAppear {
            currentTab = tabs.first ?? ""
        }
        .padding(6)
        .background(Color.backgroundGrey)
        .cornerRadius(8)
        .frame(maxWidth: .infinity)
    }
}

// MARK: Examples
#Preview {
    EXSegmentControl(
        currentTab: .constant("Tab 1"),
        tabs: ["Tab 1", "Tab 2", "Tab 3"]
    )
    .padding(16)
}
