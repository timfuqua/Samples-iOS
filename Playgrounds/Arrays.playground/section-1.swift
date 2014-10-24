// Playground - noun: a place where people can play

import UIKit


var mammals:[String] = [ "human", "dog", "cat" ]
mammals[0]
mammals[1]
mammals[2]

var reptiles:[String] = [ "turtle", "snake", "lizard" ]
var fish:[String] = [ "tuna", "salmon", "goldfish" ]

var zoo:[[String]] = [ mammals, reptiles, fish ]
zoo[0][0]
zoo[0][1]
zoo[0][2]
zoo[1][0]
zoo[1][1]
zoo[1][2]
zoo[2][0]
zoo[2][1]
zoo[2][2]

for animalGroup in zoo {
    
    for animalName in animalGroup {
        
        print( "\(animalName) " )
    }
}

