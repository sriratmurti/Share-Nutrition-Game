//MainMenuScene

import Foundation
import SpriteKit

class MainMenuScene: SKScene {
    let background = SKSpriteNode(imageNamed: "starting nutrition")
    let bubble = SKSpriteNode(imageNamed: "Bubble")
    let lynn1 = SKSpriteNode(imageNamed: "Lynn move depan 1")
    override func didMove(to view: SKView) {
        background.size = CGSize(width: frame.maxX, height: frame.maxY)
        background.position = CGPoint(x: size.width/2,
                                          y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.name = "starting nutrition"
        background.zPosition = -1
        addChild(background)
        bubble.position = CGPoint(x: (size.width/2) + 70, y: size.height - 150)
        bubble.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bubble.size = CGSize(width: 600, height: 274)
        addChild(bubble)
        
        lynn1.position = CGPoint(x: bubble.position.x - 325, y: bubble.position.y - 80)
        lynn1.zPosition = 1
        lynn1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        lynn1.size = CGSize(width: 250, height: 250)
        addChild(lynn1)
    }
    
    #if os(iOS)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//                  let location = touch.location(in: self)
//                  let touchedNode = atPoint(location)
//                  if touchedNode.name == "HelloButton" {
//                       // Call the function here.
                    sceneTapped()
               //   }
        
    }
    #else
    override func mouseDown(with theEvent: NSEvent) {
        sceneTapped()
    }

    #endif
    
    func sceneTapped() {
        let gameScene = GameScene(size: size)
        gameScene.scaleMode = scaleMode
        
        let transition = SKTransition.doorway(withDuration: 1.5)
        view?.presentScene(gameScene, transition: transition)
    }
}
