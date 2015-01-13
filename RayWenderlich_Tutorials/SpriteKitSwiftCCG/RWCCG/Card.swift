//
//  Card.swift
//  RWCCG
//
//  Created by Brian Broom on 7/22/14.
//  Copyright (c) 2014 Brian Broom. All rights reserved.
//

import Foundation
import SpriteKit

enum CardName: Int {
    case CreatureWolf = 0,
    CreatureBear,
    CreatureDragon,
    Energy,
    EnergyUsed,
    SpellDeathRay,
    SpellRabid,
    SpellSleep,
    SpellStoneskin
}

class Card : SKSpriteNode {
    
    let frontTexture: SKTexture
    let backTexture: SKTexture
    var largeTexture: SKTexture?
    let largeTextureFilename: String
    
    var faceUp = true
    
    var enlarged = false
    var savedPosition = CGPointZero
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(cardNamed: CardName) {
        
        // initialize properties
        backTexture = SKTexture(imageNamed: "card_back.png")
        
        switch cardNamed {
        case .CreatureWolf:
            frontTexture = SKTexture(imageNamed: "card_creature_wolf.png")
            largeTextureFilename = "card_creature_wolf_large.png"
            
        case .CreatureBear:
            frontTexture = SKTexture(imageNamed: "card_creature_bear.png")
            largeTextureFilename = "card_creature_bear_large.png"
            
        case .CreatureDragon:
            frontTexture = SKTexture(imageNamed: "card_creature_dragon.png")
            largeTextureFilename = "card_creature_dragon_large.png"
            
        case .Energy:
            frontTexture = SKTexture(imageNamed: "card_energy.png")
            largeTextureFilename = "card_energy_large.png"
            
        case .EnergyUsed:
            frontTexture = SKTexture(imageNamed: "card_energy_used.png")
            largeTextureFilename = "card_energy_used_large.png"
            
        case .SpellDeathRay:
            frontTexture = SKTexture(imageNamed: "card_spell_death_ray.png")
            largeTextureFilename = "card_spell_death_ray_large.png"
            
        case .SpellRabid:
            frontTexture = SKTexture(imageNamed: "card_spell_rabid.png")
            largeTextureFilename = "card_spell_rabid_large.png"
            
        case .SpellSleep:
            frontTexture = SKTexture(imageNamed: "card_spell_sleep.png")
            largeTextureFilename = "card_spell_sleep_large.png"
            
        case .SpellStoneskin:
            frontTexture = SKTexture(imageNamed: "card_spell_stoneskin.png")
            largeTextureFilename = "card_spell_stoneskin_large.png"
            
        default:
            frontTexture = SKTexture(imageNamed: "card_back.png")
            largeTextureFilename = "card_back_large.png"
        }
        
        // call designated initializer on super
        super.init(texture: frontTexture, color: nil, size: frontTexture.size())
        
        
        // set properties defined in super
        userInteractionEnabled = true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch in touches {
            
//            if touch.tapCount > 1 {
//                flip()
//            }

            if touch.tapCount > 1 {
                enlarge()
            }
            
            if enlarged {
                removeActionForKey("wiggle")
                runAction(SKAction.rotateToAngle(0, duration: 0.2), withKey:"rotate")
                return
            }
            
            zPosition = 15
            let liftUp = SKAction.scaleTo(1.2, duration: 0.2)
            runAction(liftUp, withKey: "pickup")
            
//            let wiggleIn = SKAction.scaleXTo(1.0, duration: 0.2)
//            let wiggleOut = SKAction.scaleXTo(1.2, duration: 0.2)
//            let wiggle = SKAction.sequence([wiggleIn, wiggleOut])
//            let wiggleRepeat = SKAction.repeatActionForever(wiggle)
//            runAction(wiggleRepeat, withKey: "wiggle")
            
            let rotR = SKAction.rotateByAngle(0.15, duration: 0.2)
            let rotL = SKAction.rotateByAngle(-0.15, duration: 0.2)
            let cycle = SKAction.sequence([rotR, rotL, rotL, rotR])
            let wiggle = SKAction.repeatActionForever(cycle)
            runAction(wiggle, withKey: "wiggle")
        }
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        if enlarged { return }
        for touch in touches {
            let location = touch.locationInNode(scene)
            let touchedNode = nodeAtPoint(location)
            touchedNode.position = location
        }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        if enlarged { return }
        for touch in touches {
            zPosition = 0
            
            let dropDown = SKAction.scaleTo(1.0, duration: 0.2)
            runAction(dropDown, withKey: "drop")
            
            removeActionForKey("wiggle")
            runAction(SKAction.rotateToAngle(0, duration: 0.2), withKey:"rotate")
        }
    }
    
//    func flip() {
//        if faceUp {
//            self.texture = self.backTexture
//            if let damageLabel = self.childNodeWithName("damageLabel") {
//                damageLabel.hidden = true
//            }
//            self.faceUp = false
//        } else {
//            self.texture = self.frontTexture
//            if let damageLabel = self.childNodeWithName("damageLabel") {
//                damageLabel.hidden = false
//            }
//            self.faceUp = true
//        }
//    }
    func flip() {
        let firstHalfFlip = SKAction.scaleXTo(0.0, duration: 0.4)
        let secondHalfFlip = SKAction.scaleXTo(1.0, duration: 0.4)
        
        setScale(1.0)
        
        if faceUp {
            runAction(firstHalfFlip) {
                self.texture = self.backTexture
                if let damageLabel = self.childNodeWithName("damageLabel") {
                    damageLabel.hidden = true
                }
                self.faceUp = false
                self.runAction(secondHalfFlip)
            }
        } else {
            runAction(firstHalfFlip) {
                self.texture = self.frontTexture
                if let damageLabel = self.childNodeWithName("damageLabel") {
                    damageLabel.hidden = false
                }
                self.faceUp = true
                self.runAction(secondHalfFlip)
            }
        }
    }
    
//    func enlarge() {
//        if enlarged {
//            enlarged = false
//            zPosition = 0
//            position = savedPosition
//            setScale(1.0)
//        } else {
//            enlarged = true
//            savedPosition = position
//            zPosition = 20
//            position = CGPointMake(CGRectGetMidX(parent!.frame), CGRectGetMidY(parent!.frame))
//            removeAllActions()
//            setScale(5.0)
//        }
//    }

    func enlarge() {
        if enlarged {
            let slide = SKAction.moveTo(savedPosition, duration:0.3)
            let scaleDown = SKAction.scaleTo(1.0, duration:0.3)
            runAction(SKAction.group([slide, scaleDown])) {
                self.enlarged = false
                self.zPosition = 0
            }
        } else {
            enlarged = true
            savedPosition = position
            
            if largeTexture != nil {
                texture = largeTexture
            } else {
                largeTexture = SKTexture(imageNamed: largeTextureFilename)
                texture = largeTexture
            }
            
            zPosition = 20
            
            let newPosition = CGPointMake(CGRectGetMidX(parent!.frame), CGRectGetMidY(parent!.frame))
            removeAllActions()
            
            let slide = SKAction.moveTo(newPosition, duration:0.3)
            let scaleUp = SKAction.scaleTo(5.0, duration:0.3)
            runAction(SKAction.group([slide, scaleUp]))
        }
    }
}
