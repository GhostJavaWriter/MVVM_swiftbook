//
//  ProfileViewController.swift
//  MVVM_swiftBook
//
//  Created by Bair Nadtsalov on 10.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var secondNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Second name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var viewModel: ViewModel? {
        didSet {
            self.nameLabel.text = viewModel?.name
            self.secondNameLabel.text = viewModel?.secondName
            self.ageLabel.text = viewModel?.age
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureSubViews()
        viewModel = ViewModel()
    }
    
    private func configureSubViews() {
        
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(secondNameLabel)
        stackView.addArrangedSubview(ageLabel)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

