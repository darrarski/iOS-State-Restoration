import UIKit

class ViewController: UIViewController, UIViewControllerRestoration {

    init() {
        super.init(nibName: nil, bundle: nil)
        restorationIdentifier = "ViewController"
        restorationClass = ViewController.self
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: - View

    override func loadView() {
        view = UIView()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        button.setTitle("Push", for: .normal)
        button.setTitleColor(button.tintColor, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    private lazy var button = UIButton()

    @objc
    private func buttonAction() {
        let viewController = ViewController()
        viewController.title = title.map { $0 + "1" }
        show(viewController, sender: nil)
    }

    // MARK: - UIViewControllerRestoration

    static func viewController(
        withRestorationIdentifierPath identifierComponents: [String],
        coder: NSCoder
        ) -> UIViewController? {
        return ViewController()
    }

    // MARK: - UIStateRestoring

    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        coder.encode(title, forKey: ViewController.stateEncodingTitleKey)
    }

    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        if let title = coder.decodeObject(forKey: ViewController.stateEncodingTitleKey) as? String {
            self.title = title
        }
    }

    private static let stateEncodingTitleKey = "title"

}
