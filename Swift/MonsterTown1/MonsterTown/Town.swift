//
//  Town.swift
//  MonsterTown
//
//  Created by Michael Overman on 8/19/19.
//  Copyright © 2019 Michael Overman. All rights reserved.
//

import Foundation

class Town {
    var population = 5422
    var numberOfStoplights = 4
    
    func printTownDescription() {
        print("Population: \(myTown.population), number of stoplights: \(myTown.numberOfStoplights)")
    }
    
    func changePopulation(amount: Int) {
        print("Starting pop: \(population)")
        print("changing population by \(amount)")
        population += amount
        if population < 0 {
            population = 0
        }
        print("Ending pop: \(population)")
    }
}
