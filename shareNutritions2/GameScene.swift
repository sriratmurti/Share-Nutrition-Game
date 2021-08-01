////
////  GameScene.swift
////  shareNutritions2
////
////  Created by Sri Endah Ramurti on 01/08/21.
////
//
//import SpriteKit
//import GameplayKit
//
//class GameScene: SKScene {
//
//    private var label : SKLabelNode?
//    private var spinnyNode : SKShapeNode?
//
//    override func didMove(to view: SKView) {
//
//        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
//
//        // Create shape node to use during mouse interaction
//        let w = (self.size.width + self.size.height) * 0.05
//        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
//
//        if let spinnyNode = self.spinnyNode {
//            spinnyNode.lineWidth = 2.5
//
//            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                              SKAction.fadeOut(withDuration: 0.5),
//                                              SKAction.removeFromParent()]))
//        }
//    }
//
//
//    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
//    }
//
//    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
//    }
//
//    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
//
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//
//
//    override func update(_ currentTime: TimeInterval) {
//        // Called before each frame is rendered
//    }
//}
//
//  GameScene.swift
//  spriteee
//
//  Created by Sri Endah Ramurti on 30/07/21.
//

import SpriteKit
import GameplayKit
import AudioToolbox

class GameScene: SKScene {
 
    //Logic game will be written in GameScene
    let background = SKSpriteNode (imageNamed: "background game 2.0 a")
    let lynn = SKSpriteNode(imageNamed: "Lynn Idle 1")
    let kidney = SKSpriteNode(imageNamed: "Ginjal sedih 1")
    let heart = SKSpriteNode (imageNamed: "Jantung sedih 1")
    let brain = SKSpriteNode (imageNamed: "Otak sedih 1")
    let lungs = SKSpriteNode (imageNamed: "Paru sedih 1")
    let muscle = SKSpriteNode (imageNamed: "Otot sedih 1")
    let nutritions = SKSpriteNode (imageNamed: "pink nutrition")



let playerContact : UInt32 = 0x1 << -2
    let hitSound = SKAction.playSoundFileNamed("hit", waitForCompletion: false)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    override init(size: CGSize) {
        super.init(size: size)
        
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = .zero
        physicsBody?.velocity = (CGVector(dx: 0.5, dy: 0.5))
        isUserInteractionEnabled = true
        
   
        
        background.subdivisionLevels = .min
        background.size = CGSize(width: size.width, height: size.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(background)
    
    
  //      add pLynn
        lynn.zPosition = 1
        lynn.size = CGSize(width: 70, height: 70)
        lynn.position = CGPoint(x: size.width/2, y: 30)
        lynn.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        lynn.physicsBody = SKPhysicsBody(circleOfRadius: lynn.size.width/4)
        lynn.physicsBody?.isDynamic = true
        lynn.physicsBody?.linearDamping = 1.0
        lynn.physicsBody?.contactTestBitMask = playerContact
        lynn.name = "Lynn"
        addChild(lynn)
        
        //add Kidney
        kidney.size = CGSize (width: 70, height: 70)
        kidney.position = CGPoint(x: (size.width/5)*4, y: size.height - 80)
        //anchor point utk menunjukkan kordinat si nodenya
        kidney.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //player2.physicsBody = SKPhysicsBody(circleOfRadius: player2.size.width/3)
        kidney.physicsBody?.isDynamic = true
        kidney.physicsBody?.linearDamping = 1.0
        kidney.physicsBody?.contactTestBitMask = playerContact
        kidney.name = "Kidney "
        player2moved()
        addChild(kidney)
        
        
        //add heart
        heart.size = CGSize(width: 70, height: 70)
        heart.position = CGPoint(x: 0, y: size.height-80)
        heart.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //heart.physicsBody = SKPhysicsBody(circleOfRadius: heart.size.height/3)
        heart.physicsBody?.isDynamic = true
        heart.physicsBody?.linearDamping = 1.0
        heart.physicsBody?.contactTestBitMask = playerContact
        heart.name = "Heart"
        heartmoved()
        addChild(heart)
    
        //add brain
        brain.size = CGSize (width: 70, height: 70)
        brain.position = CGPoint(x: (size.width/5)*3, y: size.height - 80)
       //anchor point utk menunjukkan kordinat si nodenya
        brain.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //brain.physicsBody = SKPhysicsBody(circleOfRadius: player2.size.width/3)
        brain.physicsBody?.isDynamic = true
        brain.physicsBody?.linearDamping = 1.0
        brain.physicsBody?.contactTestBitMask = playerContact
        brain.name = "Brain"
        //player2moved()
        addChild(brain)
    
    //add lungs
        lungs.size = CGSize (width: 70, height: 70)
        lungs.position = CGPoint(x: (size.width/5)*2, y: size.height - 80)
        //anchor point utk menunjukkan kordinat si nodenya
        lungs.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //lungs.physicsBody = SKPhysicsBody(circleOfRadius: player2.size.width/3)
        lungs.physicsBody?.isDynamic = true
        lungs.physicsBody?.linearDamping = 1.0
        // lungs.physicsBody?.contactTestBitMask = playerContact
        lungs.name = "Lungs"
        //player2moved()
        addChild(lungs)
        
    
       //add muscle
        muscle.size = CGSize (width: 70, height: 70)
        muscle.position = CGPoint(x: size.width/5, y: size.height - 80)
        //anchor point utk menunjukkan kordinat si nodenya
        muscle.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //muscle.physicsBody = SKPhysicsBody(circleOfRadius: player2.size.width/3)//
        muscle.physicsBody?.isDynamic = true
        muscle.physicsBody?.linearDamping = 1.0
        // muscle.physicsBody?.contactTestBitMask = playerContact
        muscle.name = "Muscle"
        //player2moved()
        addChild(muscle)
    
    //add nutritions
        nutritions.size = CGSize (width: 45, height: 45)
        nutritions.position = CGPoint(x: 0, y: 30)
        //anchor point utk menunjukkan kordinat si nodenya
        nutritions.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //nutritions.physicsBody = SKPhysicsBody(circleOfRadius: player2.size.width/3)
        nutritions.physicsBody?.isDynamic = true
        nutritions.physicsBody?.linearDamping = 1.0
        //nutritions.physicsBody?.contactTestBitMask = playerContact
        nutritions.name = "Nutritions"
 
        addChild(nutritions)
}
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        let touchLocation = touch.location(in: self)
        print("touched point: \(touchLocation)")
        
   
    if touchLocation.x >= (kidney.position.x) && touchLocation.y >= (kidney.position.y) {
    lynn.physicsBody?.velocity = (CGVector(dx: (kidney.position.x)-(lynn.position.x), dy: (kidney.position.y)-(lynn.position.y)))
    pinkLeft()
        DispatchQueue.main.async {
            AudioServicesPlayAlertSound(SystemSoundID(1151) )
        
        }
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
    self.player2moved2()
    self.lynn.physicsBody?.velocity = CGVector(dx: (self.size.width/2)-(self.lynn.position.x) , dy: 30 - (self.lynn.position.y))
    })
    
    lynn.isHidden = false
           
    }else if touchLocation.x < 120 && touchLocation.y >= (heart.position.y) {
        lynn.physicsBody?.velocity = (CGVector(dx: (heart.position.x)-(lynn.position.x), dy: (heart.position.y)-(lynn.position.y)))
     pinkLeft()
    
        DispatchQueue.main.async {
            AudioServicesPlayAlertSound(SystemSoundID(1311) )
        
        }
        } else if  288 <= touchLocation.x && touchLocation.x < 358 && touchLocation.y >= (brain.position.y) {
        lynn.physicsBody?.velocity = (CGVector(dx: (brain.position.x)-(lynn.position.x), dy: (brain.position.y)-(lynn.position.y)))
           pinkLeft()
            DispatchQueue.main.async {
                AudioServicesPlayAlertSound(SystemSoundID(1322) )
            
            }
            
        } else if  200 <= touchLocation.x && touchLocation.x < 288 && touchLocation.y >= (lungs.position.y) {
        lynn.physicsBody?.velocity = (CGVector(dx: (lungs.position.x)-(lynn.position.x), dy: (lungs.position.y)-(lynn.position.y)))
           pinkLeft()
        DispatchQueue.main.async {
            AudioServicesPlayAlertSound(SystemSoundID(1309) )
        
        }
        }else if   touchLocation.x >= 120 && touchLocation.x < 200 && touchLocation.y >= (muscle.position.y) {
        lynn.physicsBody?.velocity = (CGVector(dx: (muscle.position.x)-(lynn.position.x), dy:0 ))
            player1moved()
            DispatchQueue.main.async {
                AudioServicesPlayAlertSound(SystemSoundID(1324) )
            
            }
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
        self.takeNutritions()
        self.lynn.physicsBody?.velocity = (CGVector(dx:0, dy:(self.muscle.position.y)-(self.lynn.position.y) ))
        self.player1moved()
            
        })
        
        } else if  touchLocation.x <= 50 && touchLocation.y <= 50 {
        
        lynn.physicsBody?.velocity = (CGVector(dx: (nutritions.position.x)-(lynn.position.x), dy:0 ))
            player1moved()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
        self.takeNutritions()
        self.lynn.physicsBody?.velocity = (CGVector(dx:0, dy:(self.nutritions.position.y)-(self.lynn.position.y) ))
        self.player1moved()
        AudioServicesPlayAlertSound(SystemSoundID(1355) )
        })
        
        
        
        }
            
    }
func pinkLeft(){
let textureAtlas = SKTextureAtlas(named: "Pink")
let pinky = [textureAtlas.textureNamed("pink left 1"), textureAtlas.textureNamed("pink left 1"), textureAtlas.textureNamed("pink left 2"), textureAtlas.textureNamed("pink left 1"), textureAtlas.textureNamed("pink left 2"), textureAtlas.textureNamed("pink left 1"), textureAtlas.textureNamed("pink left 2"), textureAtlas.textureNamed("pink left 1")]
let pinkLeftTexture = pinky
let animateAction = SKAction.animate(with:pinkLeftTexture, timePerFrame: 0.5)
lynn.run(animateAction)
}
func pinkRight(){
let textureAtlas = SKTextureAtlas(named: "Pink")
let pinky = [textureAtlas.textureNamed("pink right 1"), textureAtlas.textureNamed("pink right 1"), textureAtlas.textureNamed("pink right 2"), textureAtlas.textureNamed("pink right 1"), textureAtlas.textureNamed("pink right 2"), textureAtlas.textureNamed("pink right 1"), textureAtlas.textureNamed("pink right 2"), textureAtlas.textureNamed("pink right 1")]
let pinkRightTexture = pinky
let animateAction = SKAction.animate(with:pinkRightTexture, timePerFrame: 0.5)
lynn.run(animateAction)
}
func pinkForward(){
let textureAtlas = SKTextureAtlas(named: "Pink")
let pinky = [textureAtlas.textureNamed("pink forward 1"), textureAtlas.textureNamed("pink forward 1"), textureAtlas.textureNamed("pink forward 2"), textureAtlas.textureNamed("pink forward 1"), textureAtlas.textureNamed("pink forward 2"), textureAtlas.textureNamed("pink forward 1"), textureAtlas.textureNamed("pink forward 2"), textureAtlas.textureNamed("pink forward 1")]
let pinkForwardTexture = pinky
let animateAction = SKAction.animate(with:pinkForwardTexture, timePerFrame: 0.5)
lynn.run(animateAction)
}

func redLeft(){
let textureAtlas = SKTextureAtlas(named: "Red")
let reddy = [textureAtlas.textureNamed("red left 1"), textureAtlas.textureNamed("red left 1"), textureAtlas.textureNamed("red left 2"), textureAtlas.textureNamed("red left 1"), textureAtlas.textureNamed("red left 2"), textureAtlas.textureNamed("red left 1"), textureAtlas.textureNamed("red left 2"), textureAtlas.textureNamed("red left 1")]
let redLeftTexture = reddy
let animateAction = SKAction.animate(with:redLeftTexture, timePerFrame: 0.5)
lynn.run(animateAction)
}
    func redRight(){
    let textureAtlas = SKTextureAtlas(named: "Red")
    let reddy = [textureAtlas.textureNamed("red right 1"), textureAtlas.textureNamed("red right 1"), textureAtlas.textureNamed("red right 2"), textureAtlas.textureNamed("red right 1"), textureAtlas.textureNamed("red right 2"), textureAtlas.textureNamed("red right 1"), textureAtlas.textureNamed("red right 2"), textureAtlas.textureNamed("red right 1")]
    let redRightTexture = reddy
    let animateAction = SKAction.animate(with:redRightTexture, timePerFrame: 0.5)
    lynn.run(animateAction)
    }
    
    func redForward(){
    let textureAtlas = SKTextureAtlas(named: "Red")
    let reddy = [textureAtlas.textureNamed("red forward 1"), textureAtlas.textureNamed("red forward 1"), textureAtlas.textureNamed("red forward 2"), textureAtlas.textureNamed("red forward 1"), textureAtlas.textureNamed("red forward 2"), textureAtlas.textureNamed("red forward 1"), textureAtlas.textureNamed("red forward 2"), textureAtlas.textureNamed("red forward 1")]
    let redForwardTexture = reddy
    let animateAction = SKAction.animate(with:redForwardTexture, timePerFrame: 0.5)
    lynn.run(animateAction)
    }
    
func greenLeft(){
let textureAtlas = SKTextureAtlas(named: "Green")
let greenz = [textureAtlas.textureNamed("green left 1"), textureAtlas.textureNamed("green left 1"), textureAtlas.textureNamed("green left 2"), textureAtlas.textureNamed("green left 1"), textureAtlas.textureNamed("green left 2"), textureAtlas.textureNamed("green left 1"), textureAtlas.textureNamed("green left 2"), textureAtlas.textureNamed("green left 1")]
let greenLeftTexture = greenz
let animateAction = SKAction.animate(with:greenLeftTexture, timePerFrame: 0.5)
lynn.run(animateAction)
}
    
    func greenRight(){
    let textureAtlas = SKTextureAtlas(named: "Green")
    let greenz = [textureAtlas.textureNamed("green right 1"), textureAtlas.textureNamed("green right 1"), textureAtlas.textureNamed("green right 2"), textureAtlas.textureNamed("green right 1"), textureAtlas.textureNamed("green right 2"), textureAtlas.textureNamed("green right 1"), textureAtlas.textureNamed("green right 2"), textureAtlas.textureNamed("green right 1")]
    let greenRightTexture = greenz
    let animateAction = SKAction.animate(with:greenRightTexture, timePerFrame: 0.5)
    lynn.run(animateAction)
    }
    
    func greenForward(){
    let textureAtlas = SKTextureAtlas(named: "Green")
    let greenz = [textureAtlas.textureNamed("green forward 1"), textureAtlas.textureNamed("green forward 1"), textureAtlas.textureNamed("green forward 2"), textureAtlas.textureNamed("green forward 1"), textureAtlas.textureNamed("green forward 2"), textureAtlas.textureNamed("green forward 1"), textureAtlas.textureNamed("green forward 2"), textureAtlas.textureNamed("green forward 1")]
    let greenForwardTexture = greenz
    let animateAction = SKAction.animate(with:greenForwardTexture, timePerFrame: 0.5)
    lynn.run(animateAction)
    }


func takeNutritions(){
let textureAtlas = SKTextureAtlas(named: "Pink")
let frame0 = textureAtlas.textureNamed("pink Idle 1")
let frame1 = textureAtlas.textureNamed("pink Idle 2")
let takeTexture = [frame0,frame1,frame0,frame1,frame0,frame1]

let animateAction = SKAction.animate(with:takeTexture, timePerFrame: 0.5)
lynn.run(animateAction)
}

    func player1moved(){
        let textureAtlas = SKTextureAtlas(named: "Lynn")
        let frame0 = textureAtlas.textureNamed("Lynn Idle 1")
        let frame1 = textureAtlas.textureNamed("Lynn move kanan 1")
        let frame2 = textureAtlas.textureNamed("Lynn move kanan 2")
        let frame3 = textureAtlas.textureNamed("Lynn Idle 2")
        let player1Texture = [frame0,frame1,frame2,frame3,frame0]
        
        let animateAction = SKAction.animate(with:player1Texture, timePerFrame: 0.5)
        lynn.run(animateAction)
        
    }
    func player2moved(){
        let textureAtlas = SKTextureAtlas(named: "Kidney")
        let frame0 = textureAtlas.textureNamed("Ginjal sedih 1")
        let frame1 = textureAtlas.textureNamed("Ginjal sedih 2")
    
        let player2Texture = [frame0,frame1,frame0,frame1,frame0,frame1]
        
        let animateAction = SKAction.animate(with:player2Texture, timePerFrame: 0.5)
        kidney.run(animateAction)
        
    }
    func player2moved2(){
        let textureAtlas = SKTextureAtlas(named: "Kidney")
        let frame0 = textureAtlas.textureNamed("Ginjal happy 1")
        let frame1 = textureAtlas.textureNamed("Ginjal happy 2")
    
        let player2Texture = [frame0,frame1]
        
        let animateAction = SKAction.animate(with:player2Texture, timePerFrame: 0.2)
        kidney.run(animateAction)
        
    }
    func heartmoved(){
        let textureAtlas = SKTextureAtlas(named: "Heart")
        let frame0 = textureAtlas.textureNamed("Jantung sedih 1")
        let frame1 = textureAtlas.textureNamed("Jantung sedih 2")
        let frame2 = textureAtlas.textureNamed("Jantung sedih 1")
        let frame3 = textureAtlas.textureNamed("Jantung sedih 2")
    
        let player2Texture = [frame0,frame1,frame2,frame3]
        
        let animateAction = SKAction.animate(with:player2Texture, timePerFrame: 0.5)
        heart.run(animateAction)
    }
    func heartmoved2(){
        let textureAtlas = SKTextureAtlas(named: "Heart")
        let frame0 = textureAtlas.textureNamed("Jantung happy 1")
        let frame1 = textureAtlas.textureNamed("Jantung happy 2")
        let frame2 = textureAtlas.textureNamed("Jantung happy 1")
        let frame3 = textureAtlas.textureNamed("Jantung happy 2")
    
        let player2Texture = [frame0,frame1,frame2,frame3]
        
        let animateAction = SKAction.animate(with:player2Texture, timePerFrame: 0.5)
        heart.run(animateAction)
    }
//    override func update(_ currentTime: TimeInterval) {
//        let reveal = SKTransition.flipHorizontal(withDuration: 1.0)
//        var winner = String()
//
//        if player1.position.x <= 10{
//            print("player 2 menang")
//            winner = "Player 2"
//            let gameOverScene = GameOverscene(size: self.size, winner: winner)
//            view?.presentScene(gameOverScene)
//        }else if player2.position.x >= 478{
//            print("player 1 menang")
//            winner = "Player 1"
//            let gameOverScene = GameOverscene(size: self.size, winner: winner)
//            view?.presentScene(gameOverScene)
//        }
//    }
}
extension GameScene: SKPhysicsContactDelegate{
    func didBegin(_ contact: SKPhysicsContact) {
        //check sudah tabrakan atau belum?
        print("Sudah nabrak!")
        
   
      
        
    }
}
 
