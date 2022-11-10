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
    var profiles: [Profile]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        profiles = [
            Profile(name: "Bair", secondName: "Nadtsalov", age: 32),
            Profile(name: "Bair2", secondName: "Nadtsalov", age: 33),
            Profile(name: "Bair3", secondName: "Nadtsalov", age: 34),
        ]
    }
}

extension ProfileViewController: UITableViewDelegate {
    
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let profiles = profiles else { return 1 }
        return profiles.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                       for: indexPath) as? TableViewCell,
              let profiles = profiles
        else { return UITableViewCell() }
        
        cell.configureCell(with: profiles[indexPath.row])
        
        return cell
    }
}

