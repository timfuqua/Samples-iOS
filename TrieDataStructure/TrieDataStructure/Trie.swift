//
//  Trie.swift
//  TrieDataStructure
//
//  Created by Tim Fuqua on 6/23/19.
//  Copyright © 2019 Norswedgian Studios. All rights reserved.
//

import Foundation

class Trie {
    
    typealias Node = TrieNode<Character>
    private let root: Node
    
    init() {
        root = Node()
    }
    
}

extension String {
    subscript(offset: Int) -> Character? {
        guard offset < count else { return nil }
        let idx = index(startIndex, offsetBy: offset)
        return self[idx]
    }
}

extension Trie {
    func insert(word: String) {
        guard word.isNotEmpty else { return }
        
        var currentNode = root
        
        let characters = word.lowercased()
        var currentIndex = 0
        
        while let char = characters[currentIndex] {
            if let child = currentNode.children[char] {
                currentNode = child
            } else {
                currentNode.add(child: char)
                currentNode = currentNode.children[char]!
            }
            
            currentIndex += 1
        }
        
        currentNode.isTerminating = true
    }
}

extension Trie {
    func contains(word: String) -> Bool {
        guard word.isNotEmpty else { return true }
        
        var currentNode = root
        
        let characters = word.lowercased()
        var currentIndex = 0
        
        while let char = characters[currentIndex], let child = currentNode.children[char] {
            currentIndex += 1
            currentNode = child
        }
        
        return currentIndex == characters.count && currentNode.isTerminating
    }
}
