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

struct HomeModel: Codable {
    var id: Int
    var name: String
    var star: String
    var image: String
    
    init(id: Int, name: String, star: String, image: String) {
        self.id = id
        self.name = name
        self.star = star
        self.image = image
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case star = "star"
        case image = "image"
    }
}

extension HomeModel {
    static let defaultData: [HomeModel] = [
        HomeModel(id: 1, name: "Super Man", star: StarEnum.veryGood.rawValue, image: .superMan),
        HomeModel(id: 2, name: "Iron Man", star: StarEnum.normal.rawValue, image: .ironMan),
        HomeModel(id: 2, name: "Hulk", star: StarEnum.awesome.rawValue, image: .hulk)
    ]
}
