import UIKit

class HomeScreenViewController: UIViewController {

    // MARK: - Properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(
            HomeScreenTableViewCell.self,
            forCellReuseIdentifier: HomeScreenTableViewCell.reuseIdentifier
        )
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private var store: Store<AppState>
    
    // MARK: - Lifecycle
    
    init() {
        var initialValues: [Int] = []
        for _ in 0..<Constants.numberOfRows {
            initialValues.append(0)
        }
        let counterState = CounterState(initialValues: initialValues)
        let appState = AppState(counterState: counterState)
        self.store = Store(reducer: appReducer(action:state:), state: appState)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

// MARK: - UITableViewDelegate extension

extension HomeScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = CounterViewController(store: &store, rowIndex: indexPath.row)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - UITableViewDataSource extension

extension HomeScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: HomeScreenTableViewCell.reuseIdentifier,
                for: indexPath
        ) as? any UITableViewCell & HomeScreenConfigurableCell
        else {
            return UITableViewCell()
        }
        
        cell.configure(with: .text("\(indexPath.row) row"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.rowHeight
    }
}

// MARK: - Nested types

extension HomeScreenViewController {
    enum Constants {
        static let rowHeight: CGFloat = 64
        static let numberOfRows: Int = 100
    }
}

