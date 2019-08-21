//
//  main.swift
//  MonsterTown
//
//  Created by Michael Overman on 8/18/19.
//  Copyright © 2019 Michael Overman. All rights reserved.
//

import Foundation

var myTown = Town(population: 98765, stoplights: 7)
let ts = myTown.townSize
print(ts)
//print("Population: \(myTown.population), number of stoplights: \(myTown.numberOfStoplights)")
myTown.printTownDescription()
myTown.changePopulation(amount: 1000000)
print("Size: \(myTown.townSize); population: \(myTown.population)")
//let gm = Monster()
//gm.town = myTown
//gm.terrorizeTown()
let fredTheZombie = Zombie(limp: false, fallingApart: false)
fredTheZombie.changeName(name: "Fred the Zombie", walksWithLimp: false)
//fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDescription()

print("Victim pool: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
print("Victim pool: \(fredTheZombie.victimPool)")
print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}
