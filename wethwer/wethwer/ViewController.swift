//
//  ViewController.swift
//  wethwer
//
//  Created by POLINA FILACEVA on 06/02/2020.
//  Copyright © 2020 POLINA FILACEVA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userCity: UITextField!
    
    @IBOutlet weak var resultLable: UILabel!
    
    @IBAction func findWeather(_ sender: UIButton) {
        let citi = userCity.text!
        let citiEdited = citi.replacingOccurrences(of: " ", with: "-")
        let url = URL(fileURLWithPath: "http://www.weather-forecast.com/locations/" + citiEdited + "/forecasts/latest")
        print(url)
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            var urlError = false
            var weather = " "
            
            if error == nil {
                let urlContent = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                
                let urlContentArray = urlContent?.components(separatedBy: "<span class=\"phrase\">")
                if(urlContentArray?.count)! > 0 {
                    let weatherArray = urlContentArray?[1].components(separatedBy: "</span>")
                    weather = (weatherArray?.first)!
                    weather = weather.replacingOccurrences(of: "&deg", with: "°")
                }  else {
                    urlError = true
                }
            } else {
                urlError = true
            }
            
            DispatchQueue.main.async {
                if urlError == true {
                    self.showError()
                } else {
                    self.resultLable.text = weather
                }
            }
        }
        
        task.resume()
        
    }
    func showError()  {
        resultLable.text! = "Не прогрузилась погода \(userCity.text!). Попробуйте еше раз"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

