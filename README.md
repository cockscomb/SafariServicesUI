# SafariServicesUI

SFSafariViewController for SwiftUI

## Installation

```swift
.package(url: "https://github.com/cockscomb/SafariServicesUI.git", from: "0.1.0")
```

## Usage

### Link

```swift
import SwiftUI
import SafariServicesUI

struct ContentView: View {
    var body: some View {
        Link("Open in SFSafariViewController", destination: URL(string: "https://developer.apple.com")!)
            .openURLInSafariView()
    }
}
```

### Attributed String

```swift
import SwiftUI
import SafariServicesUI

struct ContentView: View {
    var body: some View {
        Text("Open in SFSafariViewController with [Attributed String](https://developer.apple.com)")
            .openURLInSafariView()
    }
}
```
