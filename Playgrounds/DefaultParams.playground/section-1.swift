// Playground - noun: a place where people can play

import UIKit

func function(param1: Int, param2: Int? = nil, param3: Int? = nil, param4: Int? = nil) {
    println(param1)
    println(param2)
    println(param3)
    println(param4)
    println()
}

function(1)

function(1, param2: 2)
function(1, param3: 3)
function(1, param4: 4)

function(1, param2: 2, param3: 3)
function(1, param2: 2, param4: 4)
function(1, param3: 3, param4: 4)

function(1, param2: 2, param3: 3, param4: 4)


class foo {
    struct bar {
        var param2: Int?
        var param3: Int?
        var param4: Int?
    }
    
    var b: bar?
    
    init(param1: Int,
        override3: Int? = nil,
        override4: Int? = nil,
        param2: Int? = nil, param3: Int? = nil, param4: Int? = nil) {
            
        println(param1)
        
        b = {
            var p2: Int? = param2?
            var p3: Int? = (param3? == nil) ? override3 : param3
            var p4: Int? = (param4? == nil) ? override4 : param4
            return bar(param2: p2, param3: p3, param4: p4)
            }()
        
        println(b?.param2)
        println(b?.param3)
        println(b?.param4)
        println()
    }
}

foo(param1: 1)

foo(param1: 1, param2: 2)
foo(param1: 1, param3: 3)
foo(param1: 1, param4: 4)

foo(param1: 1, param2: 2, param3: 3)
foo(param1: 1, param2: 2, param4: 4)
foo(param1: 1, param3: 3, param4: 4)

foo(param1: 1, param2: 2, param3: 3, param4: 4)




