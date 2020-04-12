//  ViewController.swift
//  Jay
//  Created by POLINA FILACEVA on 12.03.2020.
//  Copyright © 2020 POLINA FILACEVA. All rights reserved.

import UIKit //нужно убрать скролл 

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var data = [Data]()
    
    @IBOutlet weak var colView: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
        
        
    }
    
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath) as! CollectionViewCell_one
        
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as! CollectionViewCell_two
        
        let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell3", for: indexPath) as! CollectionViewCell_thre
        
        
        if indexPath.row == 0 {
            let point1 = data[indexPath.row] as Data
            cell1.lable1.text = point1.name// берем из базы фотку и название
            cell1.ingCell.image = point1.photo
            cell1.textOne.text = point1.text
//            cell1.imageRating.image = point1.raiting
            //String(indexPath.row) берем из базы фотку и название
            //cell1.ingCell.image = UIImage(named: "7-2 5.png")
        } else if indexPath.row == 4 {
            let point2 = data[indexPath.row] as Data
            cell1.lable1.text = point2.name// берем из базы фотку и название
            cell1.ingCell.image = point2.photo
            cell1.textOne.text = point2.text
            cell2.lableTwo.text = point2.name//"Подборки"
            return cell2
        }
        
        if indexPath.row == 1 {
            
            let point3 = data[indexPath.row] as Data
            cell1.ingCell.image = point3.photo
            cell1.lable1.text = point3.name
            cell1.textOne.text = point3.text
            cell1.ingCell.layer.cornerRadius = 8
            
            return cell1
        } else if indexPath.row == 2 {
            let point4 = data[indexPath.row] as Data
            cell1.lable1.text = point4.name// берем из базы фотку и название
            cell1.ingCell.image = point4.photo
            cell1.textOne.text = point4.text
            cell1.ingCell.layer.cornerRadius = 8
            return cell1
        }
        
        if indexPath.row == 3 { 
            
            let point5 = data[indexPath.row] as Data
            cell1.ingCell.image = point5.photo
            cell1.lable1.text = point5.name
            cell1.textOne.text = point5.text
            cell1.ingCell.layer.cornerRadius = 8
            return cell1
        }
        
        if indexPath.row == 5 {
            let point6 = data[indexPath.row] as Data
            cell3.imgCell2.image = point6.photo
            cell3.labeleCall2.text = point6.name
            cell3.textCell2.text = point6.text
            cell3.imgCell2.layer.cornerRadius = 8
            return cell3
        }
        
        cell1.ingCell.layer.cornerRadius = 8
        cell1.layer.masksToBounds = false
        return cell1
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 4 {
            return CGSize(width: 500, height: 100)
        }
        return CGSize(width: 500, height: 364)
        
        //indexPath.item == 0 ? CGSize(width: 335, height: 364) :  CGSize(width: 335, height: 364)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        colView.delegate = self
        
        colView.dataSource = self
        let image1 = UIImage(named: "7-2 5.png")
        let image2 = UIImage(named: "Q_MainPhotoCard.png")
        let image3 = UIImage(named: "7-2 6.png")
        let image4 = UIImage(named: "7-2 7.png")
        let image5 = UIImage(named: "7-2 10.png")
//        let imageRating = UIImage(named: "7-2 9.png")
        
        let data1 = Data(name: "Сан-Марино", photo: image1, text: "Маленькое государство в горной местности, которое со всех сторон окружено Италией")//, raiting: imageRating)
        
        let data2 = Data(name: "Подборки", photo: image2, text: "Страна бесчисленных озер, деревушек и высокогорных Альп.Во многих городах сохранились средневековые ")
        
        let data3 = Data(name: "Средневековые замки", photo: image3, text: "Страна бесчисленных озер и прекрасных гор. Все великолепие пейзажев в этой историин")
        
        let data4 = Data(name: "Храмы Москвы", photo: image4, text: "Культовые Московские религиозные сооружения")
        
        let data5 = Data(name: "Готический Лондон", photo: image2, text: "Вся прелесть и изящество готической архитектуре в рамках сторого Лондона")
        
        let data6 = Data(name: "Лондон", photo: image5, text: "8 МАРШРУТОВ")
        
        data.append(data1)
        data.append(data3)
        data.append(data4)
        data.append(data5)
        data.append(data2)
        data.append(data6)
        
    }
    
}

