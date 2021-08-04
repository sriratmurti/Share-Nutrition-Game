// Function

import SpriteKit
import GameplayKit
import AudioToolbox

class PausePage: SKScene {

let background = SKSpriteNode (imageNamed: "starting nutrition")
let popUp = SKSpriteNode (imageNamed: "pop up game")
let help = SKSpriteNode (imageNamed: "Tanda tanya")
let out = SKSpriteNode (imageNamed: "Out")
let labelOut = SKLabelNode (fontNamed: "Chalkboard SE")
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    override init(size: CGSize) {
        super.init(size: size)
        
        labelOut.fontSize = 36
        labelOut.fontColor = .white
        labelOut.position = CGPoint (x: (size.width/2) + 40, y: (size.height/2) - 70)
        labelOut.text = "Keluar"
        labelOut.zPosition = 2
        addChild(labelOut)
        
        
        background.size = CGSize(width: size.width, height: size.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = 0
        addChild(background)
     
        popUp.size = CGSize(width: 375, height: 375)
        popUp.position = CGPoint(x: size.width/2, y: size.height/2)
        popUp.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        popUp.zPosition = 1
        addChild(popUp)
        
        help.size = CGSize(width: 70, height: 70)
        help.position = CGPoint(x: (size.width/2) - 50, y: (size.height/2) + 60)
        help.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        help.zPosition = 2
        addChild(help)
        
        out.size = CGSize(width: 70, height: 70)
        out.position = CGPoint(x: (size.width/2) - 50, y: (size.height/2) - 60)
        out.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        out.zPosition = 2
        addChild(out)
    }
    
}
    
    


