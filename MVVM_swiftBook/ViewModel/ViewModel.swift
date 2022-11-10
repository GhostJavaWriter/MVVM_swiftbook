//
//  ViewModel.swift
//  MVVM_swiftBook
//
//  Created by Bair Nadtsalov on 10.11.2022.
//

import Foundation

class ViewModel: TableViewViewModelType {
    
    var profiles = [
        Profile(name: "Bair", secondName: "Nadtsalov", age: 32),
        Profile(name: "Bair2", secondName: "Nadtsalov", age: 33),
        Profile(name: "Bair3", secondName: "Nadtsalov", age: 34),
    ]
    
    func numberOfRows() -> Int {
        return profiles.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(profile: profile)
    }

}
