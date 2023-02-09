import UIKit

final class CounterViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var counterLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = ColorPalette.text
        label.font = Fonts.big
        label.text = "0"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("+", for: .normal)
        button.setTitleColor(ColorPalette.link, for: .normal)
        button.titleLabel?.font = Fonts.big
        return button
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("-", for: .normal)
        button.setTitleColor(ColorPalette.link, for: .normal)
        button.titleLabel?.font = Fonts.big
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutStackView()
    }
    
    // MARK: - Private
    
    private func setupView() {
        stackView.addArrangedSubview(minusButton)
        stackView.addArrangedSubview(counterLabel)
        stackView.addArrangedSubview(plusButton)
        view.addSubview(stackView)
    }
    
    private func layoutStackView() {
        stackView.frame = .init(
            origin: .init(
                x: view.center.x - Constants.stackViewSize.width / 2,
                y: view.center.y - Constants.stackViewSize.height / 2
            ),
            size: Constants.stackViewSize
        )
    }
}

// MARK: - Nested types

extension CounterViewController {
    enum Constants {
        static let fontSize: CGFloat = 32
        static let stackViewSize: CGSize = .init(width: 100, height: 64)
    }
}

