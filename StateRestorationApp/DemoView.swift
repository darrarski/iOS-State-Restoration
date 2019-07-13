import UIKit

class DemoView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setUpSubviews()
        setUpLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: - Subviews

    let button = UIButton()

    private func setUpSubviews() {
        addSubview(button)
        button.setTitle("Push", for: .normal)
        button.setTitleColor(button.tintColor, for: .normal)
    }

    // MARK: - Layout

    private func setUpLayout() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
    }

}
