//
//  StoreDataMgr.swift
//  Amazing meteor
//
//  Created by venus on 9/21/21.
//

import SwiftUI

class StoreDataMgr: ObservableObject {
 
    
    
    func load() -> [MeteorModel] {
        if let data = UserDefaults.standard.data(forKey: String.StorageName) {
            if let decoded = try? JSONDecoder().decode([MeteorModel].self, from: data) {
                return decoded
            }
        }
        return [MeteorModel]()
    }
    
    func save(meteor: MeteorModel) {
        var meteors = self.load()
        let val = meteors.contains{$0.id == meteor.id}
        if(val == false){
            meteors.append(meteor)
        }
        if let encoded = try? JSONEncoder().encode(meteors) {
            UserDefaults.standard.set(encoded, forKey: String.StorageName)
        }
    }
    
    func delete(meteor: MeteorModel) {
        var meteors = self.load()
        let val = meteors.contains{$0.id == meteor.id}
        if(val == true){
            meteors.removeAll{$0.id == meteor.id}
        }
        if let encoded = try? JSONEncoder().encode(meteors) {
            UserDefaults.standard.set(encoded, forKey: String.StorageName)
        }
    }
    
    func isSavedMeteor(meteor: MeteorModel) -> Bool {
        print("isSavedMeteor")
        let meteors = self.load()
        print("isSavedMeteor 1")
        let val = meteors.contains{$0.id == meteor.id}
        print("isSavedMeteor 2 : \(val)")
        return val
    }
}
