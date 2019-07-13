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

    let label = UILabel()
    let stepper = UIStepper()
    let button = UIButton()

    private let stack = UIStackView()

    private func setUpSubviews() {
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 16

        label.font = .preferredFont(forTextStyle: .title1)
        stack.addArrangedSubview(label)

        stepper.minimumValue = 0
        stack.addArrangedSubview(stepper)

        button.setTitle("Push", for: .normal)
        button.setTitleColor(button.tintColor, for: .normal)
        stack.addArrangedSubview(button)
        addSubview(stack)
    }

    // MARK: - Layout

    private func setUpLayout() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
    }

}
