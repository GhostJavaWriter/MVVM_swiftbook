//
//  TableViewCellViewModel.swift
//  MVVM_swiftBook
//
//  Created by Bair Nadtsalov on 10.11.2022.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    
    var name: String {
        return profile.name
    }
    
    var secondName: String {
        return profile.secondName
    }
    
    var age: String {
        return String(describing: profile.age)
    }
    
    private var profile: Profile
    
    init(profile: Profile) {
        self.profile = profile
    }
}
