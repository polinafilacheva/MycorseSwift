//  ViewController.swift
//  Jay
//  Created by POLINA FILACEVA on 12.03.2020.
//  Copyright © 2020 POLINA FILACEVA. All rights reserved.

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var colView: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath) as! CollectionViewCell_one
        
        
        cell1.lable1.text = String(indexPath.row)
        cell1.backgroundView?.backgroundColor = UIColor.black
        cell1.layer.masksToBounds = false
        return cell1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 335, height: 364)
        //indexPath.item == 0 ? CGSize(width: 335, height: 364) :  CGSize(width: 335, height: 364)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colView.delegate = self
        colView.dataSource = self
       
    }

}

