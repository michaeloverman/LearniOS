//
//  Person.swift
//  CyclicalAssets
//
//  Created by Michael Overman on 9/9/19.
//  Copyright © 2019 Michael Overman. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    let name: String
    let accountant = Accountant()
    var assets = [Asset]()
    
    var description: String {
        return "Person(\(name))"
    }
    
    init(name: String) {
        self.name = name
        
        accountant.netWorthChangedHandler = {
            [weak self] netWorth in
            
            self?.netWorthDidChange(netWorth: netWorth)
            return
        }
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
    
    func takeOwnershipOfAsset(asset: Asset) {
        asset.owner = self
        assets.append(asset)
        accountant.gainedNewAsset(asset: asset)
    }
    
    func rescindOwnershipOf(asset: Asset) {
        asset.owner = nil
        for var i = 0; i < assets.count; ++i {
            if assets[i].equals(asset) {
                assets.remove(at: i)
            }
        }
        accountant.removedOldAsset(asset: asset)
    }
    
    func netWorthDidChange(netWorth: Double) {
        print("The net worth of \(self) is now \(netWorth)")
    }
}
