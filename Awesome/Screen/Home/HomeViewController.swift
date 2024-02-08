//
//  HomeViewController.swift
//  Awesome
//
//  Created by Lion Parcel on 08/02/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let viewModel = HomeViewModel()
    
    private lazy var tableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.register(HomeCell.self, forCellReuseIdentifier: HomeCell.className)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    private func configureView() {
        self.title = "Avengers"
        self.view.backgroundColor = .white        
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.tableView.reloadData()
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.className, for: indexPath) as! HomeCell
        cell.model = viewModel.listData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = viewModel.listData[indexPath.row]
        let detailVC = DetailViewController(with: model)
        
        detailVC.onUpdateStar = { [weak self] star in
            self?.viewModel.listData[indexPath.row].star = star
            self?.tableView.reloadData()
        }
        
        self.push(to: detailVC)
    }
}
