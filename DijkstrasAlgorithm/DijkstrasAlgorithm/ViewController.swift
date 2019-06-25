//
//  ViewController.swift
//  DijkstrasAlgorithm
//
//  Created by Tim Fuqua on 6/24/19.
//  Copyright © 2019 Norswedgian Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

}

// MARK:- lifecycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let seattle = Node(value: "Seattle")
        let portland = Node(value: "Portland")
        let vancouver = Node(value: "Vancouver")
        let spokane = Node(value: "Spokane")
        let northBend = Node(value: "North Bend")
        let forks = Node(value: "Forks")
        
        seattle.connections.append(Connection(to: portland, weight: 175))
        seattle.connections.append(Connection(to: vancouver, weight: 150))
        seattle.connections.append(Connection(to: northBend, weight: 30))
        
        portland.connections.append(Connection(to: seattle, weight: 175))
        portland.connections.append(Connection(to: spokane, weight: 350))

        vancouver.connections.append(Connection(to: seattle, weight: 150))

        spokane.connections.append(Connection(to: portland, weight: 350))
        spokane.connections.append(Connection(to: northBend, weight: 250))
        
        northBend.connections.append(Connection(to: seattle, weight: 30))
        northBend.connections.append(Connection(to: spokane, weight: 250))
        

        tryPath(from: seattle, to: portland)
        tryPath(from: northBend, to: vancouver)
        tryPath(from: northBend, to: portland)
        tryPath(from: northBend, to: spokane)
        tryPath(from: vancouver, to: portland)
        tryPath(from: vancouver, to: spokane)
        tryPath(from: portland, to: spokane)

        tryPath(from: forks, to: seattle)
    }
}

extension ViewController {
    private func tryPath<T: Hashable>(from source: Node<T>, to dest: Node<T>) {
        if let sourceToDestPath = shortestPath(from: source, to: dest) {
            let readablePath = sourceToDestPath.asArray.reversed().map({ $0.value })
            print("\(source.value) to \(dest.value): \(readablePath); weight: \(sourceToDestPath.cumulativeWeight)")
        } else {
            print("No path between \(source.value) and \(dest.value)")
        }
    }
    
    private func shortestPath<T: Hashable>(from source: Node<T>, to dest: Node<T>) -> Path<T>? {
        var frontier: [Path<T>] = [] { // replace with PriorityQueue
            didSet { frontier.sort(by: <) }
        }
        var visited = Set<Node<T>>()
        
        frontier.append(Path(to: source))
        
        while frontier.isEmpty == false {
            let cheapestPathInFrontier = frontier.removeFirst()
            guard visited.contains(cheapestPathInFrontier.node) == false else { continue }
            
            if cheapestPathInFrontier.node === dest {
                return cheapestPathInFrontier
            }
            
            visited.insert(cheapestPathInFrontier.node)
            
            for connection in cheapestPathInFrontier.node.connections where visited.contains(connection.to) == false {
                frontier.append(Path(to: connection.to, via: connection, previousPath: cheapestPathInFrontier))
            }
        }
        
        return nil
    }
}
