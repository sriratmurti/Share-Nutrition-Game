//MainMenuScene

import Foundation
import SpriteKit

class MainMenuScene: SKScene {
    let background = SKSpriteNode(imageNamed: "starting page nutrition")
    
    override func didMove(to view: SKView) {
        background.size = CGSize(width: frame.maxX, height: frame.maxY)
        background.position = CGPoint(x: size.width/2,
                                          y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.name = "starting page nutrition"
        background.zPosition = -1
        addChild(background)
    }
    
    #if os(iOS)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sceneTapped()
    }
    #else
    override func mouseDown(with theEvent: NSEvent) {
        sceneTapped()
    }

    #endif
    
    func sceneTapped() {
        let gameScene = GameScene(size: size)
        gameScene.scaleMode = scaleMode
        
        let transition = SKTransition.fade(withDuration: 1.5)
        view?.presentScene(gameScene, transition: transition)
    }
}
