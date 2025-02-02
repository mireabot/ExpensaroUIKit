![cover](https://github.com/mireabot/ExpensaroUIKit/blob/master/Expensaro%20Cover.png)

# Expensaro UI

An open-source SwiftUI toolkit that helps iOS developers create and maintain custom design systems. Expensaro UI combines flexible components with practical examples, making UI development more efficient and organized

## Instalation
1. You can use this library for iOS project using Swift Package Manager in XCode
```
https://github.com/mireabot/ExpensaroUIKit
```
2. You also can build own version cloning this repo via Terminal
```
git clone https://github.com/mireabot/ExpensaroUIKit
```
## Documentation
Expensaro UI provides comprehensive documentation to help you get started:
- **Component Documentation**: Each component has its own dedicated page with visual presentation and implementation code
- **Example Screens**: Browse complete UI examples featuring Expensaro components with copy-ready source code

Visit our documentation [website](https://expensaro-ui.naivesolution.me/) for more information

## Sample Usage
Here's how to use an Expensaro UI component in your project:
```swift
import ExpensaroUIKit

struct ContentView: View {
    var body: some View {
        EXActionableCell(
            title: "Categories",
            text: "Manage your categories",
            icon: .imageName("📂"),
            action: {
                print("Categories tapped")
            }
        )
    }
}
```

## Contributing
We welcome contributions from designers and mobile engineers! Here's how you can help:

- **Add New Components**: Create a pull request with your component implementation
- **Request Features**: Use the [GitHub Discussion board](https://github.com/mireabot/ExpensaroUIKit/discussions/categories/components-request) to suggest new components
- **Report Issues**: Open an issue if you find a bug or have a suggestion
- **Improve Documentation**: Help us make the documentation better


---
Made for iOS engineers with presize craft 🍏
