//
//  ViewController.swift
//  animation
//
//  Created by POLINA FILACEVA on 05.03.2020.
//  Copyright © 2020 POLINA FILACEVA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func start(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "animated", message: "Started", preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(startAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    private let startAction = UIAlertAction(title: "Done", style: UIAlertAction.Style.default) { (UIAlertAction) in print("Done")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

