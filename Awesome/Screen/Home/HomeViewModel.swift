//
//  HomeViewModel.swift
//  Awesome
//
//  Created by Lion Parcel on 08/02/24.
//

import Foundation

class HomeViewModel {
    
    private final let keyObject = "avengers"
    
    var listData: [HomeModel] = []
    
    func getStorageData() {
        let list = self.getAllObjects()
        if !list.isEmpty {
            listData = list
        } else {
            listData = HomeModel.defaultData
        }
    }
    
    func updateStorageData() {
        self.saveAllObjects(allObjects: listData)
    }
    
    private func getAllObjects() -> [HomeModel] {
        if let objects = UserDefaults.standard.value(forKey: keyObject) as? Data {
            let decoder = JSONDecoder()
            if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [HomeModel] {
                return objectsDecoded
            } else {
                return HomeModel.defaultData
            }
        } else {
            return HomeModel.defaultData
        }
    }

    private func saveAllObjects(allObjects: [HomeModel]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(allObjects){
            UserDefaults.standard.set(encoded, forKey: keyObject)
        } else {
            print("failed")
        }
    }
    
}
