//
//  DetailViewController.swift
//  MVVM_swiftBook
//
//  Created by Bair Nadtsalov on 10.11.2022.
//

import UIKit

class DetailViewController: UIViewController {

    weak var detailViewModel: DetailViewModelType?
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Suppose to be a name"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var secondNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Suppose to be second name"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Suppose to be age"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let _detailViewModel = detailViewModel {
            let profileConfig = _detailViewModel.getProfileConfig()
            nameLabel.text = profileConfig.name
        } else {
            nameLabel.text = "Error occured"
        }
    }
    
    private func configureLayout() {
        
        view.backgroundColor = .magenta
        view.alpha = 0.5
        
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(secondNameLabel)
        stackView.addArrangedSubview(ageLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
