//
//  GameScene.swift
//  RWCCG
//
//  Created by Brian Broom on 7/1/14.
//  Copyright (c) 2014 Brian Broom. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {

        let wolf = Card(cardNamed: CardName.CreatureWolf)
        wolf.position = CGPointMake(100, 600)
        addChild(wolf)
        
        let bear = Card(cardNamed: CardName.CreatureBear)
        bear.position = CGPointMake(210, 600)
        addChild(bear)

        let dragon = Card(cardNamed: CardName.CreatureDragon)
        dragon.position = CGPointMake(320, 600)
        addChild(dragon)
        
        let energy = Card(cardNamed: CardName.Energy)
        energy.position = CGPointMake(100, 450)
        addChild(energy)

        let energyUsed = Card(cardNamed: CardName.EnergyUsed)
        energyUsed.position = CGPointMake(210, 450)
        addChild(energyUsed)
        
        let spellDeathRay = Card(cardNamed: CardName.SpellDeathRay)
        spellDeathRay.position = CGPointMake(100, 300)
        addChild(spellDeathRay)
        
        let spellRabid = Card(cardNamed: CardName.SpellRabid)
        spellRabid.position = CGPointMake(210, 300)
        addChild(spellRabid)
        
        let spellSleep = Card(cardNamed: CardName.SpellSleep)
        spellSleep.position = CGPointMake(320, 300)
        addChild(spellSleep)
        
        let spellStoneskin = Card(cardNamed: CardName.SpellStoneskin)
        spellStoneskin.position = CGPointMake(430, 300)
        addChild(spellStoneskin)
        
        
        wolf.addChild(newDamageLabel())
        bear.addChild(newDamageLabel())
        dragon.addChild(newDamageLabel())
        energy.addChild(newDamageLabel())
        spellDeathRay.addChild(newDamageLabel())
        spellRabid.addChild(newDamageLabel())
        spellSleep.addChild(newDamageLabel())
        spellStoneskin.addChild(newDamageLabel())
    }
    
    func newDamageLabel() -> SKLabelNode {
        let damageLabel = SKLabelNode(fontNamed: "OpenSans-Bold")
        damageLabel.name = "damageLabel"
        damageLabel.fontSize = 12
        damageLabel.fontColor = UIColor(red: 0.47, green: 0.0, blue: 0.0, alpha: 1.0)
        damageLabel.text = "0"
        damageLabel.position = CGPointMake(25, 40)
        
        return damageLabel
    }
}
