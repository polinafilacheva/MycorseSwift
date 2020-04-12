//
//  CustomButton1.swift
//  animation3
//
//  Created by POLINA FILACEVA on 05.03.2020.
//  Copyright © 2020 POLINA FILACEVA. All rights reserved.
//

import Foundation
import UIKit

class CustomButton1: UIButton {
    var color: UIColor = .black
    let touchDownAlpha: CGFloat = 0.3
    let timerStep: CFTimeInterval = 0.01
    let animateTime: TimeInterval = 0.4
    lazy var alphaStep: CGFloat = {
        return (1 - touchDownAlpha) / CGFloat(animateTime / timerStep)
    }()
    
    weak var timer: Timer?
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let backgroundColor = backgroundColor {
            color = backgroundColor
        }
        setup()
    }
    
    func touchDown() {
        stopTimer()
        layer.backgroundColor = color.withAlphaComponent(touchDownAlpha).cgColor
    }
    
    func touchUp() {
        timer = Timer.scheduledTimer(timeInterval: timerStep, target: self, selector: #selector(animation), userInfo: nil, repeats: true)
    }
    
    @objc func animation() {
        guard let backgroundAlpha = layer.backgroundColor?.alpha else {
            stopTimer()
            return
        }
        
        let newAlpha = backgroundAlpha + alphaStep
        
        
        if newAlpha < 1 {
            layer.backgroundColor = color.withAlphaComponent(newAlpha).cgColor
        } else {
            layer.backgroundColor = color.cgColor
            stopTimer()
        }
    }
    
    func setup() {
        backgroundColor = self.color
        layer.backgroundColor = color.cgColor
        layer.cornerRadius = 6
        clipsToBounds = true
    }
    
    convenience init(color: UIColor? = nil, title: String? = nil) {
        self.init()
        if let color = color {
            self.color = color
        }
        
        if let title = title {
            self.setTitle(title, for: .normal)
        }
        
        setup()
    }
    
    deinit {
        stopTimer()
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                touchDown()
            } else {
                cancelTracking(with: nil)
                touchUp()
            }
        }
    }
}

