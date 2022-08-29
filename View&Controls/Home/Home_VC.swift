//
//  Home_VC.swift
//  View&Controls
//
//  Created by Kim Nghĩa on 22/08/2022.
//

import UIKit

class Home_VC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var bicycleName = ["Moutain DownHill", "Organce TOP 2"]
    var bicycleImage: [UIImage] = [
        UIImage(named: "Moutain DownHill")!,
        UIImage(named: "Organce Top2")!
    ]

    @IBOutlet weak var coll: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coll.dataSource = self
        coll.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
//
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moutaindownhillcell", for: indexPath) as! MoutainDownHillCell
            cell.bicycleView.layer.cornerRadius = 10
            cell.cellView.layer.borderColor = UIColor.orange.cgColor
            cell.cellView.layer.borderWidth = 1
            cell.cellView.layer.cornerRadius = 10
            cell.priceView.layer.cornerRadius = 10
            cell.color1.backgroundColor = .orange
            cell.color2.backgroundColor = .red
            cell.color1.layer.cornerRadius = 5
            cell.color2.layer.cornerRadius = 5
            cell.bicycleName.setTitle("\((bicycleName[indexPath.row]))", for: .normal)
            cell.bicycleImage.image = bicycleImage[indexPath.row]
        return cell

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 67) / 2  , height: coll.frame.height)
    }
    
}


