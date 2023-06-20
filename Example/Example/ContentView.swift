import SwiftUI
import SafariServicesUI

private let appleDeveloper = URL(string: "https://developer.apple.com")!

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Link("Open in Safari", destination: appleDeveloper)
                Link("Open in SFSafariViewController", destination: appleDeveloper)
                    .openURLInSafariView()
                Text("Open in SFSafariViewController with [Attributed String](https://developer.apple.com)")
                    .openURLInSafariView()
                NavigationLink("Open in SFSafariViewController within NavigationStack", value: appleDeveloper)
            }
            .navigationDestination(for: URL.self) { url in
                SafariView(url: url)
                    .toolbar(.hidden)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
