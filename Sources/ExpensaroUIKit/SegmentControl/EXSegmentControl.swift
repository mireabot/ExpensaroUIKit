//
//  EXSegmentControl.swift
//
//
//  Created by Mikhail Kolkov on 9/14/23.
//

import SwiftUI

/// A customizable segment control component for switching between two tabs.
///
/// `EXSegmentControl` provides an interactive segment control with two tabs. Each tab is highlighted
/// with an animated transition and custom styling when selected. The component is built using SwiftUI
/// and supports dynamic tab configuration.
///
/// ### Usage Example
/// ```swift
/// struct ContentView: View {
///     @State private var selectedTab: String = "Tab 1"
///
///     var body: some View {
///         EXSegmentControl(
///             currentTab: $selectedTab,
///             config: ("Tab 1", "Tab 2")
///         )
///         .padding(16)
///     }
/// }
/// ```
///
/// ### Parameters
/// - `currentTab`: A `Binding<String>` that keeps track of the currently selected tab. The value is updated when a tab is tapped.
/// - `config`: A tuple containing two `String` values, representing the labels for the two tabs:
///     - The first string corresponds to the first tab.
///     - The second string corresponds to the second tab.
///
/// ### Customization
/// - Each tab's appearance can be customized via the `config` labels and styles within the struct.
/// - The selected tab is highlighted with a smooth `matchedGeometryEffect` animation.
///
/// ### Notes
/// - The `currentTab` value is automatically set to the first tab (`config.0`) on initialization.
/// - Ensure that the `config` strings are unique for proper functionality.
///
/// ### Features
/// - Interactive spring animations when switching tabs.
/// - Automatic background and text color adjustments based on the selected tab.
/// - Fully customizable tab labels through the `config` parameter.
public struct EXSegmentControl: View {
    @Binding var currentTab: String
    @Namespace var animation
    var config: (String, String)
    
    /// Initializes the `EXSegmentControl`.
    /// - Parameters:
    ///   - currentTab: A binding to the currently selected tab.
    ///   - config: A tuple containing the labels for the two tabs.
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
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.9, blendDuration: 0.9)) {
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
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.9, blendDuration: 0.9)) {
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

// MARK: Examples
#Preview {
    EXSegmentControl(
        currentTab: .constant("Tab 1"),
        config: ("Tab 1", "Tab 2")
    )
    .padding(16)
}
