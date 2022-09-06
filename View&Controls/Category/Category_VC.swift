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
    var count = 1
    
    var newlist: [list] = []
    
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
        return info.imageBicycle.count
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
            cell2.numberTest.text = String(info.number[indexPath.row])
            cell2.nameBicycle.text = info.nameBicycle[indexPath.row]
            cell2.imageBicycle.image = info.imageBicycle[indexPath.row]
            cell2.listView.backgroundColor = info.colorList[indexPath.row]
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
            
            if info.number[newIndex] == 0 {
                info.number[newIndex] = Int(count)
                count += 1
            }else {
                // element of array > element of newIndex
                var index = info.number.filter { $0 > info.number[newIndex]}
                let max = info.number.max()
                
                if info.number[newIndex] != max {
                    // -1 index array
                    for i in 0...index.count - 1{
                        index[i] -= 1
                    }
                    
                    //number element of index
                    var j = 0
                    
                    //update new number
                    for i in 0...info.number.count - 1 {
                        if info.number[i] > info.number[newIndex] {
                            info.number[i] = index[j]
                            j += 1
                        }else {
                            info.number[i] = info.number[i]
                        }
                    }
                }
                info.number[newIndex] = 0
                count -= 1
            }
            collectionView.reloadData()
        }
    }
}
