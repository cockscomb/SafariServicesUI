import SwiftUI
import SafariServicesUI

private let appleDeveloper = URL(string: "https://developer.apple.com")!

struct ContentView: View {
    var body: some View {
        List {
            Link("Open in Safari", destination: appleDeveloper)
            Link("Open in SFSafariViewController", destination: appleDeveloper)
                .openURLInSafariView()
            Text("Open in SFSafariViewController with [Attributed String](https://developer.apple.com)")
                .openURLInSafariView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
