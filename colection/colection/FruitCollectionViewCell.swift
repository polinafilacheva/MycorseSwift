//
//  FruitCollectionViewCell.swift
//  colection
//
//  Created by POLINA FILACEVA on 19.03.2020.
//  Copyright © 2020 POLINA FILACEVA. All rights reserved.
//

import UIKit

class FruitCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var stalView: UIStackView!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var lableView: UILabel!
    
    static let reuseID = String(describing:FruitCollectionViewCell.self)
    
     static let nib = UINib(nibName: String(describing:FruitCollectionViewCell.self), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 4
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateContentStyle()
    }
    
    private func updateContentStyle() {
        let isHorizontalStyle = bounds.width > 2 * bounds.height
        
        let oldAxis = stalView.axis
        let newAxis: NSLayoutConstraint.Axis = isHorizontalStyle ? .horizontal: .vertical
        
        guard oldAxis != newAxis else { return }
        
        stalView.axis = newAxis
        stalView.spacing = isHorizontalStyle ? 16 : 4
        
        lableView.textAlignment = isHorizontalStyle ? .left : .center
        
        let fontTransform: CGAffineTransform = isHorizontalStyle ? .identity : CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.3) {
            self.lableView.transform = fontTransform
            self.layoutIfNeeded()
        }
        
    }
}
