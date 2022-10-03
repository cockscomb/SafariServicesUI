import SwiftUI

struct OpenURLInSafariViewModifier: ViewModifier {
    @State private var url: URL? = nil
    private var isPresented: Binding<Bool> {
        Binding {
            url != nil
        } set: { newValue in
            if newValue == false {
                url = nil
            }
        }
    }

    private let configuration: SafariView.Configuration?

    init(configuration: SafariView.Configuration?) {
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
            .fullScreenCover(isPresented: isPresented) {
                if let url {
                    SafariView(url: url, configuration: configuration)
                        .edgesIgnoringSafeArea(.all)
                }
            }

    }
}

extension View {
    /// Open https or http URLs in SFSafariViewController
    /// - Parameter configuration: SFSafariViewController configuration
    /// - Returns: View
    public func openURLInSafariView(configuration: SafariView.Configuration? = nil) -> some View {
        return modifier(OpenURLInSafariViewModifier(configuration: configuration))
    }
}
