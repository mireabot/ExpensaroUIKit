//
//  EXSearchBar.swift
//
//
//  Created by Mikhail Kolkov on 1/23/25.
//

import SwiftUI

/// A customizable search bar component with icon support.
///
/// `EXSearchBar` provides a search interface with optional leading icons.
/// Built using SwiftUI, it supports both image and emoji-based icons.
///
/// ###** Usage Example**
/// ```swift
/// struct ContentView: View {
///     @State private var searchText: String = ""
///
///     var body: some View {
///         EXSearchBar(
///             icon: .image(Image(systemName: "magnifyingglass")),
///             text: $searchText,
///             placeholder: "Search"
///         )
///         .padding(16)
///     }
/// }
/// ```
///
/// ###** Parameters**
/// - `icon`: An `IconType` enum value that determines the leading icon:
///     - `.imageName`: Displays emoji icon with headline font
///     - `.image`: Displays a custom image with secondary color
/// - `text`: A `Binding<String>` that manages the search input text
/// - `placeholder`: A `String` that appears when the search field is empty
///
/// ###** Features**
/// - Flexible icon support with emoji and image options
/// - System-integrated styling with background and corner radius
/// - Responsive text input with placeholder support
public struct EXSearchBar: View {
    var icon: IconType
    @Binding var text: String
    var placeholder: String
    
    public init(icon: IconType, text: Binding<String>, placeholder: String) {
        self.icon = icon
        self._text = text
        self.placeholder = placeholder
    }
    public var body: some View {
        EXBase(content: {
            HStack(alignment: .center, spacing: 8, content: {
                switch icon {
                case .imageName(let imageName) where !imageName.isEmpty:
                    Text(imageName)
                        .font(.headlineRegular)
                    
                case .image(let image):
                    image
                        .foregroundStyle(.secondary)
                default:
                    EmptyView()
                }
                
                TextField("Search anything", text: $text)
                    .font(.headlineRegular)
                    .foregroundStyle(.primary)
            })
        })
    }
}

#Preview {
    EXSearchBar(icon: .image(.init(systemName: "magnifyingglass")),
                text: .constant(""),
                placeholder: "Search anything")
    .padding(.horizontal, 16)
}
