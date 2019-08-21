//
//  Town.swift
//  MonsterTown
//
//  Created by Michael Overman on 8/19/19.
//  Copyright © 2019 Michael Overman. All rights reserved.
//

import Foundation

struct Town {
    let region: String
    var population: Int {
        didSet(oldPopulation) {
            if population < oldPopulation {
                print("The population has changed from \(oldPopulation) to \(population).")
            }
        }
    }
    var numberOfStoplights: Int
    init(region: String, population: Int, stoplights: Int) {
        self.region = region
        self.population = population
        numberOfStoplights = stoplights
    }
    init(population: Int, stoplights: Int) {
        self.init(region: "N/A", population: population, stoplights: stoplights)
    }
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
        print("Population: \(population); number of stoplights: \(numberOfStoplights); region: \(region)")
    }
    
    mutating func changePopulation(amount: Int) {
        population += amount
        if population < 0 {
            population = 0
        }
    }
}
