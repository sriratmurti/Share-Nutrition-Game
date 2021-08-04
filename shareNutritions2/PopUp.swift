//
//  PopUp.swift
//  shareNutritions2
//
//  Created by Sri Endah Ramurti on 04/08/21.
//

import SpriteKit
import GameplayKit


class popUpScene: SKScene {
    
    let brain = SKSpriteNode (imageNamed: "Brain Happy 1")
    let kidney = SKSpriteNode (imageNamed: "Ginjal happy 1")
    let heart = SKSpriteNode (imageNamed: "Jantung happy 1")
    let muscle = SKSpriteNode (imageNamed: "Otot Happy 1")
    let lungs = SKSpriteNode (imageNamed: "Paru happy 1")
    let background = SKSpriteNode (imageNamed: "starting nutrition")
    let popUp = SKSpriteNode (imageNamed: "pop up help")
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    override init(size: CGSize) {
        super.init(size: size)
    
        background.size = CGSize(width: size.width, height: size.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(background)
        
        popUp.size = CGSize(width: 510, height: 340)
        popUp.position = CGPoint(x: size.width/2, y: size.height/2)
        popUp.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        addChild(popUp)
        
    }
    func brainPop() {
        brain.size = CGSize(width: 100, height: 100)
        brain.position = CGPoint(x: (size.width/2) - 100, y: (size.height/2))
        addChild(brain)
    }
    
    func kidneyPop() {
        kidney.size = CGSize(width: 100, height: 100)
        kidney.position = CGPoint(x: (size.width/2) - 100, y: (size.height/2))
        addChild(kidney)
    }
    
    func heartPop() {
        heart.size = CGSize(width: 100, height: 100)
        heart.position = CGPoint(x: (size.width/2) - 100, y: (size.height/2))
        addChild(heart)
    }
    
    func lungsPop() {
        lungs.size = CGSize(width: 100, height: 100)
        lungs.position = CGPoint(x: (size.width/2) - 100, y: (size.height/2))
        addChild(lungs)
    }
    
    func musclePop() {
        muscle.size = CGSize(width: 100, height: 100)
        muscle.position = CGPoint(x: (size.width/2) - 100, y: (size.height/2))
        addChild(muscle)
    }
}
