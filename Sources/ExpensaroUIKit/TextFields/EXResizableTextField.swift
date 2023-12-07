//
//  File.swift
//  
//
//  Created by Mikhail Kolkov on 9/23/23.
//

import SwiftUI

public struct EXResizableTextField: View {
  @Binding var message: String
  var characterLimit: Int
  
  public init(message: Binding<String>, characterLimit: Int) {
    self._message = message
    self.characterLimit = characterLimit
  }
  public var body: some View {
    VStack() {
      HStack(spacing: 8) {
        withAnimation(.easeInOut) {
          TextEditor(text: $message)
            .keyboardType(.alphabet)
            .autocorrectionDisabled(true)
            .tint(.primaryGreen)
            .font(.headlineRegular)
            .frame(minHeight: 100)
            .colorMultiply(.backgroundGrey)
            .expanding()
            .onChange(of: message) { newValue in
              if newValue.count > characterLimit {
                message = String(newValue.prefix(characterLimit))
              }
            }
        }
      }
      .padding(.vertical, 15)
      .padding(.horizontal, 12)
      .background(Color.backgroundGrey)
      .cornerRadius(16)
      .padding(.top, 15)
      
      HStack {
        Text("\(characterLimit - message.count) characters left")
          .foregroundColor(message.count == characterLimit ? .red : .darkGrey)
          .font(.footnoteRegular)
        Spacer()
        Button {
          message = ""
        } label: {
          Text("Clear")
            .foregroundColor(.darkGrey)
            .font(.footnoteRegular)
        }
        
      }
    }
  }
}

struct NYCChipCollection_Previews: PreviewProvider {
  static var previews: some View {
    SampleView()
  }
}

struct SampleView: View {
  @State private var tab = "er"
  var body: some View {
    VStack {
      EXResizableTextField(message: $tab, characterLimit: 300).padding([.leading,.trailing], 16)
    }
  }
}

@available(iOS 15.0, *)
extension View {
  func expanding() -> some View {
    modifier(ExpandingModifier())
  }
}

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
