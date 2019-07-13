import UIKit

class DemoViewController: UIViewController, UIViewControllerRestoration {

    init() {
        super.init(nibName: nil, bundle: nil)
        restorationIdentifier = "DemoViewController"
        restorationClass = DemoViewController.self
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: - View

    override func loadView() {
        view = demoView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        demoView.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    private lazy var demoView = DemoView()

    @objc
    private func buttonAction() {
        let viewController = DemoViewController()
        viewController.title = title.map { $0 + "1" }
        show(viewController, sender: nil)
    }

    // MARK: - UIViewControllerRestoration

    static func viewController(
        withRestorationIdentifierPath identifierComponents: [String],
        coder: NSCoder
        ) -> UIViewController? {
        return DemoViewController()
    }

    // MARK: - UIStateRestoring

    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        coder.encode(title, forKey: DemoViewController.stateEncodingTitleKey)
    }

    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        if let title = coder.decodeObject(forKey: DemoViewController.stateEncodingTitleKey) as? String {
            self.title = title
        }
    }

    private static let stateEncodingTitleKey = "title"

}
