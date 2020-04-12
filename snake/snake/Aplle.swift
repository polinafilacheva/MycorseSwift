//
//  Aplle.swift
//  snake
//
//  Created by POLINA FILACEVA on 12.02.2020.
//  Copyright © 2020 POLINA FILACEVA. All rights reserved.
//

import SpriteKit

class Apple: SKShapeNode {
    convenience init(position:CGPoint) {
        self.init()
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)).cgPath
        
        fillColor = UIColor.red
        strokeColor = UIColor.red
        
    }
}
