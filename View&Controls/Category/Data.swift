//
//  Data.swift
//  View&Controls
//
//  Created by Kim Nghĩa on 25/08/2022.
//

import UIKit


struct list {
    var name: String?
    var selectedView: Bool
//    var ishiden: Bool
}

//var newlist: [list] = [
//    list(name: "Tất cả Danh Mục", selectedView: true),
//    list(name: "Xem nhiều", selectedView: false),
//    list(name: "Giảm giá", selectedView: false),
//    list(name: "Xu hướng", selectedView: false),
//    list(name: "Đề xuất", selectedView: false),
//]



class data{
    var imageBicycle: UIImage
    var nameBicycle: String
    var colorList: UIColor
    var number: Int
    var index: Int
    
    init(imageBicycle: UIImage, nameBicycle:String, colorList:UIColor, number: Int, index: Int){
        self.imageBicycle = imageBicycle
        self.nameBicycle = nameBicycle
        self.colorList = colorList
        self.number = number
        self.index = index
    }
}


  

//    imageBicycle: [
//        UIImage(named: "xe1")!,
//        UIImage(named: "xe2")!,
//        UIImage(named: "xe3")!,
//        UIImage(named: "xe4")!,
//        UIImage(named: "xe5")!,
//        UIImage(named: "xe6")!,
//        UIImage(named: "xe7")!,
//        UIImage(named: "xe8")!
//    ],
//    nameBicycle: [
//        "Xe Đạp Thể Thao",
//        "Xe Đạp Thông Dụng",
//        "Xe Đạp Đua",
//        "Xe Đạp Thời Trang",
//        "Xe Đạp Gấp",
//        "Xe Đạp Trẻ Em",
//        "Xe 7",
//        "Xe 8"
//    ],
//    colorList: [
//        UIColor(red: 211/255, green: 230/255, blue: 247/255, alpha: 1),
//        UIColor(red: 239/255, green: 247/255, blue: 211/255, alpha: 1),
//        UIColor(red: 247/255, green: 211/255, blue: 234/255, alpha: 1),
//        UIColor(red: 211/255, green: 247/255, blue: 224/255, alpha: 1),
//        UIColor(red: 247/255, green: 228/255, blue: 211/255, alpha: 1),
//        UIColor(red: 219/255, green: 211/255, blue: 247/255, alpha: 1),
//        UIColor(red: 211/255, green: 230/255, blue: 247/255, alpha: 1),
//        UIColor(red: 239/255, green: 247/255, blue: 211/255, alpha: 1)
//    ],
//    number: [
//        0,
//        0,
//        0,
//        0,
//        0,
//        0,
//        0,
//        0
//    ]
//)

