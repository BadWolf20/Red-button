//
//  StorageManager.swift
//  Red button
//
//  Created by Roman on 02.01.2023.
//

import Foundation
import UIKit


enum StorageManagerKey: String, CaseIterable {
    case userId
    case notFirstLaunch
}

protocol AppDelegateStorageManager {
    func hasFirstLaunch() -> Bool
    func setHasFirstLaunch(bool: Bool)
}

protocol UserDefaultsStorageManager {
    func saveBoolToUserDefaults(bool: Bool, key: StorageManagerKey)
    func removeFromUserDefaults(key: StorageManagerKey)
    func getBoolFromUserDefaults(key: StorageManagerKey) -> Bool
    func getStringFromUserDefaults(key: StorageManagerKey) -> String?
    func saveStringToUserDefaults(string: String, key: StorageManagerKey)
    func getObjectFromUserDefaults(key: StorageManagerKey) -> Any
    func saveDataToUserDefaults(data: Data, key: StorageManagerKey)
}


extension StorageManager: AppDelegateStorageManager {
    func hasFirstLaunch() -> Bool {
        getBoolFromUserDefaults(key: StorageManagerKey.notFirstLaunch)
    }

    func setHasFirstLaunch(bool: Bool) {
        saveBoolToUserDefaults(bool: bool, key: StorageManagerKey.notFirstLaunch)
    }


}

extension StorageManager: UserDefaultsStorageManager {
    func saveBoolToUserDefaults(bool: Bool, key: StorageManagerKey) {
        UserDefaults.standard.set(bool, forKey: key.rawValue)
    }

    func saveDataToUserDefaults(data: Data, key: StorageManagerKey) {
        UserDefaults.standard.set(data, forKey: key.rawValue)
    }

    func removeFromUserDefaults(key: StorageManagerKey) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }

    func getBoolFromUserDefaults(key: StorageManagerKey) -> Bool {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }

    func getStringFromUserDefaults(key: StorageManagerKey) -> String? {
        UserDefaults.standard.string(forKey: key.rawValue)
    }

    func saveStringToUserDefaults(string: String, key: StorageManagerKey) {
        UserDefaults.standard.set(string, forKey: key.rawValue)
    }

    func getObjectFromUserDefaults(key: StorageManagerKey) -> Any {
        UserDefaults.standard.object(forKey: key.rawValue) as Any
    }
}

class StorageManager {
    private struct Constants {
        static let serviceId = "StorageManagerKeychain.Service.Id"
    }
}
