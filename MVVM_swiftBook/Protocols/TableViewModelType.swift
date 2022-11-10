//
//  TableViewModelType.swift
//  MVVM_swiftBook
//
//  Created by Bair Nadtsalov on 10.11.2022.
//

import Foundation

protocol TableViewViewModelType {
    
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?
    
}
