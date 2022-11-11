//
//  DetailViewController.swift
//  MVVM_swiftBook
//
//  Created by Bair Nadtsalov on 10.11.2022.
//

import UIKit

class DetailViewController: UIViewController {

    var detailViewModel: DetailViewModelType?
    
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
        
        detailViewModel?.age.bind { [weak self] in
            guard let string = $0 else { return }
            self?.ageLabel.text = string
        }
        
        delay(delay: 4) { [weak self] in
            self?.detailViewModel?.age.value = "some age"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let _detailViewModel = detailViewModel else {
            nameLabel.text = "Error occured1"
            return
        }
        let profileConfig = _detailViewModel.getProfileConfig()
        
        nameLabel.text = profileConfig.name
    }
    
    private func delay(delay: Double, clouser: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + delay) {
            clouser()
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
