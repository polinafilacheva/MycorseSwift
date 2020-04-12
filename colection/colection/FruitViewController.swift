//
//  FruitViewController.swift
//  colection
//
//  Created by POLINA FILACEVA on 19.03.2020.
//  Copyright © 2020 POLINA FILACEVA. All rights reserved.
//

import UIKit

class FruitViewController: UICollectionView {

    private enum PresrntationStyle: String, CaseIterable {
        case table
        case defaultGrid
        case customGrid
        
        var buttonImage: UIImage {
            switch self {
            case .table:
                return #imageLiteral(resourceName: "table")
            case .defaultGrid:
                return #imageLiteral(resourceName: "defaultGrid")
            case .customGrid:
                return #imageLiteral(resourceName: "customGrid")
           
                
            }
        }
        
    }

    
    private var selectedStyle: PresrntationStyle = .table
    
    private var dataSource: [Fruit]()
}

extension FruitViewController {
    
}
