// Playground - noun: a place where people can play

import UIKit

func factorial(n: Int) -> Int {
    
    return n == 1 ? 1 : n * factorial(n - 1)
}

var factorialedNumber: Int = factorial(3)
var bruteForceFactorialedNumber: Int = 3*2*1

println(factorialedNumber)
println(bruteForceFactorialedNumber)

println(factorial(10))


class LLNode<T> {
    
    var key: T? = nil
    var next: LLNode? = nil
    var previous: LLNode? = nil
}

public class LinkedList<T: Equatable> {
    private var head: LLNode<T> = LLNode<T>()
    
    func addLink(key: T) {
        
        if head.key == nil {
            
            head.key = key
            return
        }
        
        var current: LLNode? = head
        
        while current != nil {
            
            if current?.next != nil {
                
                var childToUse: LLNode = LLNode<T>()
                
                childToUse.key = key
                childToUse.previous = current
                current!.next = childToUse
                break
            }
            
            current = current?.next
        }
    }
    
    func removeLinkAtIndex(index: Int) {
        
        var current: LLNode<T>? = head
        var trailer: LLNode<T>? = nil
        var listIndex: Int = 0
        
        if index == 0 {
            
            current = current?.next
            head = current!
            return
        }
        
        while current != nil {
            
            if listIndex == index {
                
                trailer!.next = current?.next
                current = nil
                break
            }
        }
    }
}

