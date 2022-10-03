import SwiftUI
import SafariServices

/// SFSafariViewController Wrapper
public struct SafariView: UIViewControllerRepresentable {
    public typealias UIViewControllerType = SFSafariViewController

    public typealias Configuration = SFSafariViewController.Configuration

    private let url: URL
    private let configuration: Configuration?

    public init(url: URL, configuration: Configuration? = nil) {
        self.url = url
        self.configuration = configuration
    }

    public func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariViewController: SFSafariViewController
        if let configuration {
            safariViewController = SFSafariViewController(url: url, configuration: configuration)
        } else {
            safariViewController = SFSafariViewController(url: url)
        }
        return safariViewController
    }

    public func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
}
