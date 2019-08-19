//
//  main.swift
//  MonsterTown
//
//  Created by Michael Overman on 8/18/19.
//  Copyright © 2019 Michael Overman. All rights reserved.
//

import Foundation

var myTown = Town()
//print("Population: \(myTown.population), number of stoplights: \(myTown.numberOfStoplights)")
myTown.printTownDescription()
myTown.changePopulation(amount: 500)
myTown.printTownDescription()
//let gm = Monster()
//gm.town = myTown
//gm.terrorizeTown()
let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDescription()
