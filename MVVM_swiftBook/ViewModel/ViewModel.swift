//
//  ViewModel.swift
//  MVVM_swiftBook
//
//  Created by Bair Nadtsalov on 10.11.2022.
//

import Foundation

class ViewModel {
    
    private var profile = Profile(name: "Bair", secondName: "Nadtsalov", age: 32)
    
    var name: String {
        return profile.name
    }
    
    var secondName: String {
        return profile.secondName
    }
    
    var age: String {
        return String(describing: profile.age)
    }
}
