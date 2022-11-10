//
//  ProfileViewController.swift
//  MVVM_swiftBook
//
//  Created by Bair Nadtsalov on 10.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var tableView: UITableView! = {
        let table = UITableView(frame: self.view.frame)
        table.delegate = self
        table.dataSource = self
        table.register(TableViewCell.self,
                       forCellReuseIdentifier: cellIdentifier)
        return table
    }()
    
    let cellIdentifier = String(describing: TableViewCell.self)
    
    var viewModel: TableViewViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        viewModel = ViewModel()
    }
}

extension ProfileViewController: UITableViewDelegate {
    
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                       for: indexPath) as? TableViewCell,
              let tableViewCellViewModel = viewModel?.cellViewModel(forIndexPath: indexPath)
        else { return UITableViewCell() }
        
        cell.tableViewCellViewModel = tableViewCellViewModel
        
        return cell
    }
}

