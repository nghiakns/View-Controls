//
//  Category_VC.swift
//  View&Controls
//
//  Created by Kim Nghĩa on 22/08/2022.
//

import UIKit

class Category_VC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var listCollectionView: UICollectionView!
    @IBOutlet weak var coll: UICollectionView!
    var currentIndex = 0
    
    var newlist: [list] = []
    var info: [data] = [data(imageBicycle: UIImage(named: "xe1")!, nameBicycle: "Xe Đạp Thể Thao", colorList: UIColor(red: 211/255, green: 230/255, blue: 247/255, alpha: 1), number: 0, index: 0),
                        data(imageBicycle: UIImage(named: "xe2")!, nameBicycle: "Xe Đạp Thông Dụng", colorList: UIColor(red: 239/255, green: 247/255, blue: 211/255, alpha: 1), number: 0, index: 1),
                        data(imageBicycle: UIImage(named: "xe3")!, nameBicycle: "Xe Đạp Đua", colorList: UIColor(red: 247/255, green: 211/255, blue: 234/255, alpha: 1), number: 0, index: 2),
                        data(imageBicycle: UIImage(named: "xe4")!, nameBicycle: "Xe Đạp Thời Trang", colorList: UIColor(red: 211/255, green: 247/255, blue: 224/255, alpha: 1), number: 0, index: 3),
                        data(imageBicycle: UIImage(named: "xe5")!, nameBicycle: "Xe Đạp Gấp", colorList: UIColor(red: 247/255, green: 228/255, blue: 211/255, alpha: 1), number: 0, index: 4),
                        data(imageBicycle: UIImage(named: "xe6")!, nameBicycle: "Xe Đạp Trẻ Em", colorList: UIColor(red: 219/255, green: 211/255, blue: 247/255, alpha: 1), number: 0, index: 5),
                        data(imageBicycle: UIImage(named: "xe7")!, nameBicycle: "Xe 7", colorList: UIColor(red: 211/255, green: 230/255, blue: 247/255, alpha: 1), number: 0, index: 6),
                        data(imageBicycle: UIImage(named: "xe8")!, nameBicycle: "Xe 8", colorList: UIColor(red: 239/255, green: 247/255, blue: 211/255, alpha: 1), number: 0, index: 7)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coll.dataSource = self
        coll.delegate = self
        listCollectionView.dataSource = self
        listCollectionView.delegate = self
        
        newlist = [list(name: "Tất cả Danh Mục", selectedView: true),
                   list(name: "Xem nhiều", selectedView: false),
                   list(name: "Giảm giá", selectedView: false),
                   list(name: "Xu hướng", selectedView: false),
                   list(name: "Đề xuất", selectedView: false),]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.coll {
            return newlist.count
        }
        return info.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.coll{
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "danhmuc", for: indexPath) as! DanhMucCell
            
            //set colorTextListDefault
            if newlist[indexPath.row].selectedView {
                cell1.list.textColor = UIColor(red: 0.239, green: 0.188, blue: 0.078, alpha: 1)
                cell1.selectedView.isHidden = false
            }else{
                cell1.list.textColor = UIColor(red: 0.85, green: 0.847, blue: 0.826, alpha: 1)
                cell1.selectedView.isHidden = true
            }

            //set cornerRadiusSelectList
            cell1.selectedView.layer.cornerRadius = 3
            
            //add listName
            cell1.list.text = newlist[indexPath.row].name //
            return cell1
        }
        else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "danhmucview", for: indexPath) as! DanhMucViewCell
            cell2.numberTest.text = String(info[indexPath.row].number)
            cell2.nameBicycle.text = info[indexPath.row].nameBicycle
            cell2.imageBicycle.image = info[indexPath.row].imageBicycle
            cell2.listView.backgroundColor = info[indexPath.row].colorList
            cell2.listView.layer.cornerRadius = 20
            return cell2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == coll.self {
            if(indexPath.row == 0){
                return CGSize(width: ((view.frame.width - 24) / 5) + 40, height: 25)
            }else {
                return CGSize(width: ((view.frame.width - 24) / 5) - 10, height: 25)
            }
        }else {
            return CGSize(width: ((view.frame.width - 68) / 2), height: ((listCollectionView.frame.height - 97) / 3))
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        //Case1
        
//        newlist[newIndex].selectedView = true
//        newlist[currentIndex].selectedView = false
//        currentIndex = newIndex
//        collectionView.reloadData()
//        newlist[indexPath.row].selectedView = true
        
        //Case2
        if collectionView == self.coll {
            let newIndex = indexPath.row
            if let index = newlist.firstIndex(where: { $0.selectedView }) {
                newlist[index].selectedView = false
            }
            newlist[newIndex].selectedView = true
            collectionView.reloadData()
        }
        if collectionView == self.listCollectionView {
            let newIndex = indexPath.row
            var max = info.max { $0.number < $1.number }?.number
            if info[newIndex].number == 0 {
                max! += 1
                info[newIndex].number = Int(max!)
            }else {
                let newArray = info.filter { $0.number > info[newIndex].number}
                
                for item in newArray {
                    item.number -= 1
                }
                info[newIndex].number = 0
                max! -= 1
            }
            collectionView.reloadData()
        }
    }
}
