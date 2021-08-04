import SpriteKit
import GameplayKit
import AudioToolbox

class function: SKScene {
    let brain = SKSpriteNode (imageNamed: "Otak sedih 1")
    
    func brainSenang(){
        let textureAtlas =  SKTextureAtlas(named: "Brain")
        let Brain = [textureAtlas.textureNamed("Otak sedih 1"), textureAtlas.textureNamed("Otak sedih 2"), textureAtlas.textureNamed("Otak sedih 1"), textureAtlas.textureNamed("Otak sedih 2"), textureAtlas.textureNamed("Otak sedih 1"), textureAtlas.textureNamed("Otak sedih 2"), textureAtlas.textureNamed("Otak sedih 1")]
        
        let brainSedihTexture = Brain
        let animateAction = SKAction.animate(with:brainSedihTexture, timePerFrame: 0.5)
        brain.run(animateAction)
    }
}
