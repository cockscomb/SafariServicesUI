import SwiftUI
import SafariServices

struct OpenURLInSafariViewModifier: ViewModifier {
    @State private var url: URL? = nil

    private let configuration: SFSafariViewController.Configuration?

    init(configuration: SFSafariViewController.Configuration?) {
        self.configuration = configuration
    }

    func body(content: Content) -> some View {
        content
            .environment(\.openURL, OpenURLAction { url in
                switch url.scheme {
                case "https"?, "http"?:
                    self.url = url
                    return .handled
                default:
                    return .systemAction(url)
                }
            })
            .sheet(isPresented: .constant(url != nil)) {
                url = nil
            } content: {
                if let url {
                    SafariView(url: url)
                }
            }

    }
}

extension View {
    public func openURLInSafariView(configuration: SFSafariViewController.Configuration?) -> some View {
        return modifier(OpenURLInSafariViewModifier(configuration: configuration))
    }
}
