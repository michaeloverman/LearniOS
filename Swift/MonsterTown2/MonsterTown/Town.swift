//
//  Town.swift
//  MonsterTown
//
//  Created by Michael Overman on 8/19/19.
//  Copyright © 2019 Michael Overman. All rights reserved.
//

import Foundation

class Town {
    static let region = "South"
    var population = 5422 {
        didSet(oldPopulation) {
            if population < oldPopulation {
                print("The population has changed from \(oldPopulation) to \(population).")
            }
        }
    }
    var numberOfStoplights = 4
    
    enum Size {
        case Small
        case Medium
        case Large
    }
    var townSize: Size {
        get {
            switch self.population {
            case 0...10000:
                return .Small
            case 10001...100000:
                return .Medium
            default:
                return .Large
            }
        }
    }
    func printTownDescription() {
        print("Population: \(myTown.population), number of stoplights: \(myTown.numberOfStoplights)")
    }
    
    func changePopulation(amount: Int) {
//        print("Starting pop: \(population)")
//        print("changing population by \(amount)")
        population += amount
        if population < 0 {
            population = 0
        }
//        print("Ending pop: \(population)")
    }
}
