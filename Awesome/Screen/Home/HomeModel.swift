//
//  HomeModel.swift
//  Awesome
//
//  Created by Lion Parcel on 08/02/24.
//

import UIKit

enum StarEnum: String {
    case normal = "Normal"
    case veryGood = "Very Good"
    case awesome = "Awesome"
}

struct HomeModel {
    var id: Int
    var name: String
    var star: StarEnum
    var image: UIImage?
    
    init(id: Int, name: String, star: StarEnum, image: UIImage?) {
        self.id = id
        self.name = name
        self.star = star
        self.image = image
    }
}

extension HomeModel {
    static let defaultData: [HomeModel] = [
        HomeModel(id: 1, name: "Super Man", star: .veryGood, image: .superMan),
        HomeModel(id: 2, name: "Iron Man", star: .normal, image: .ironMan),
        HomeModel(id: 2, name: "Hulk", star: .awesome, image: .hulk)
    ]
}
