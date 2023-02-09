import UIKit

class HomeScreenViewController: UIViewController {

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
    
    override func loadView() {
        self.view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDelegate extension

extension HomeScreenViewController: UITableViewDelegate {
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.rowHeight
    }
}

// MARK: - Nested types

extension HomeScreenViewController {
    enum Constants {
        static let rowHeight: CGFloat = 64
    }
}

