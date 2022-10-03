import SwiftUI
import SafariServices

public struct SafariView: UIViewControllerRepresentable {
    public typealias UIViewControllerType = SFSafariViewController

    private let url: URL
    private let configuration: SFSafariViewController.Configuration?

    public init(url: URL, configuration: SFSafariViewController.Configuration? = nil) {
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
