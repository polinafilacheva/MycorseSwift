//
//  ViewController.swift
//  remode-data
//
//  Created by POLINA FILACEVA on 30/01/2020.
//  Copyright © 2020 POLINA FILACEVA. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    let session = URLSession(configuration: URLSessionConfiguration.default)
    let url = URL(fileURLWithPath: "https://dev-pronin.appspot.com/api/swift/students")
    var studentID = " "

    override func viewDidLoad() {
        var students = [Student]()
        super.viewDidLoad()

        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                let json = (try! JSONSerialization.jsonObject(with: data!, options: [])) as! [String: AnyObject]
                let jsonStudents = json["students"] as! [ [String: AnyObject] ]
                OperationQueue.main.addOperation {
                    
                    
                    for jsonStudent in jsonStudents {
                        let studentID = jsonStudent["id"] as! String
                        let student = Student()
                        student.name = jsonStudent["name"] as! String
                        student.grade = jsonStudent["grade"] as! Int16
                        student.studentID = studentID
                        students.append(student)
                    }
                }
            }
        }
        task.resume()
        
        for student in students {
            print("\(student.name) \(student.grade) \(student.studentID)")

        }
        
        posrRequest(name: "yo", grade: 8)
    }
    
    func posrRequest(name: String, grade: Int16)  {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let unreserved = "_.-~/?"
        let allowed = NSMutableCharacterSet.alphanumeric()
        allowed.addCharacters(in: unreserved)
        
        let body = "name=\(name)&\(grade)"
        request.httpBody = body.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                let json = (try!JSONSerialization.jsonObject(with: data!, options: [])) as! [String: AnyObject]
                
                let jsonStudent = json["student"] as! [String: AnyObject]
                OperationQueue.main.addOperation {
                    self.studentID = jsonStudent["id"] as! String
                    print("saved")
                }
                
            }
        }
        
        task.resume()
        print(studentID)
        
    }


}

