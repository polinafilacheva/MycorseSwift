//
//  ViewController.swift
//  animated2
//
//  Created by POLINA FILACEVA on 05.03.2020.
//  Copyright © 2020 POLINA FILACEVA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var but: UIButton!
    var button: UIButton! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.view.backgroundColor = UIColor.red
        but.titleLabel?.text = "Button1"
        let rect = CGRect(x: 133, y: 133, width: 54, height: 54)
        self.button! = UIButton(frame: rect)
        self.button?.titleLabel?.text = "Button2"
        self.view.addSubview(button!)
    }


}

