//
//  File.swift
//  MonsterTown
//
//  Created by Michael Overman on 8/19/19.
//  Copyright © 2019 Michael Overman. All rights reserved.
//

import Foundation

class Zombie: Monster {
    
    override class var spookyNoise: String {
        return "Brains...."
    }
    
    var walksWithLimp = true
    private(set) var isFallingApart = false
    
    final override func terrorizeTown() {
        if(!isFallingApart) {
            town?.changePopulation(amount: -10)
        }
        super.terrorizeTown()
    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
}
