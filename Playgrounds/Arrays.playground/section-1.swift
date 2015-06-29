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

func test01() {
  for animalGroup in zoo {
    for animalName in animalGroup {
      print("\(animalName)")
    }
  }
}

func test02() {
  let someMammals: [String] = Array(mammals[1...2])
  
  println(someMammals)
}

func test03() {
  println(zoo[1...2])
}

test01()
test02()
test03()




