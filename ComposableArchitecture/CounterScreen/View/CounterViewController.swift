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
        label.font = Font.big
        label.text = getCountValue()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("+", for: .normal)
        button.setTitleColor(ColorPalette.link, for: .normal)
        button.titleLabel?.font = Font.big
        button.addTarget(self, action: #selector(plusClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("-", for: .normal)
        button.setTitleColor(ColorPalette.link, for: .normal)
        button.titleLabel?.font = Font.big
        button.addTarget(self, action: #selector(minusClicked), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorPalette.background
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutStackView()
    }
    
    private var store: Store<AppState>
    private var rowIndex: Int
    // MARK: - Private
    
    init(store: inout Store<AppState>, rowIndex: Int) {
        self.store = store
        self.rowIndex = rowIndex
        super.init(nibName: nil, bundle: nil)
        store.subscribers.append(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    @objc
    private func plusClicked() {
        store.dispatch(action: CounterAction.plus(rowIndex))
    }
    
    @objc
    private func minusClicked() {
        store.dispatch(action: CounterAction.minus(rowIndex))
    }
    
    private func getCountValue() -> String {
        if store.state.counterState.values.count > self.rowIndex {
            return "\(store.state.counterState.values[self.rowIndex])"
        } else {
            return "-"
        }
    }
}

// MARK: - Nested types

extension CounterViewController {
    enum Constants {
        static let fontSize: CGFloat = 32
        static let stackViewSize: CGSize = .init(width: 150, height: 64)
    }
}

extension CounterViewController: StoreSubscriber {
    
    typealias StateType = AppState
    
    func newState(state: AppState) {
        counterLabel.text = getCountValue()
    }
}
