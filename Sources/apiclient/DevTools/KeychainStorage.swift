//
//  KeychainStorage.swift
//  Astronomy Picute Today
//
//  Created by José Lino Neto on 03/03/2022.
//

import Foundation
import KeychainAccess

class KeychainStorage {
    private var keyChainWrapper: Keychain
    private init() {
        keyChainWrapper = Keychain()
    }

    static var shared: KeychainStorage = KeychainStorage()
    
    func getValueForKey(_ key: String) -> String? {
        try? keyChainWrapper.getString(key)
    }
    
    func set(newValue: String, forKey: String) {
        try? keyChainWrapper.set(newValue, key: forKey)
    }
    
    func clearStorage() {
        try? keyChainWrapper.removeAll()
    }
}
