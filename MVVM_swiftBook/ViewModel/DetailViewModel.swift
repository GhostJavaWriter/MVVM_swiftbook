//
//  DetailViewModel.swift
//  MVVM_swiftBook
//
//  Created by Bair Nadtsalov on 10.11.2022.
//

import Foundation

class DetailViewModel: DetailViewModelType {
    
    var age: Box<String?> = Box(nil)
    
    private var profile: Profile
    
    init(profile: Profile) {
        self.profile = profile
    }
    
    func getProfileConfig() -> Profile {
        return profile
    }
}
