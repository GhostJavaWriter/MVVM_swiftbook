//
//  TableViewCell.swift
//  MVVM_swiftBook
//
//  Created by Bair Nadtsalov on 10.11.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    var tableViewCellViewModel: TableViewCellViewModelType? {
        willSet(tableViewCellModel) {
            nameLabel.text = tableViewCellModel?.name
            secondNameLabel.text = tableViewCellModel?.secondName
            ageLabel.text = tableViewCellModel?.age
        }
    }
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var secondNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Second name"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stackView = UIStackView(frame: contentView.frame)
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(secondNameLabel)
        stackView.addArrangedSubview(ageLabel)
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.axis = .horizontal
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func configureCell(with profile: Profile) {
//
//        nameLabel.text = profile.name
//        secondNameLabel.text = profile.secondName
//        ageLabel.text = String(describing: profile.age)
//
//    }
    
}
