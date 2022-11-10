//
//  TableViewCellViewModelType.swift
//  MVVM_swiftBook
//
//  Created by Bair Nadtsalov on 10.11.2022.
//

import Foundation

protocol TableViewCellViewModelType: AnyObject {
    
    var name: String { get }
    var secondName: String { get }
    var age: String { get }
}
