//
//  ViewController.swift
//  ComposableArchitecture
//
//  Created by Kamil on 08.02.2023.
//

import UIKit

class MainScreenViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            MainScreenTableViewCell.self,
             forCellReuseIdentifier: "ViewControllerTableViewCell"
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
        self.view = tableView
    }
}

// MARK: - UITableViewDelegate extension

extension MainScreenViewController: UITableViewDelegate {
}

// MARK: - UITableViewDataSource extension

extension MainScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "ViewControllerTableViewCell",
                for: indexPath
        ) as? UITableViewCell & CellConfigurable
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
        return 64
    }
}

