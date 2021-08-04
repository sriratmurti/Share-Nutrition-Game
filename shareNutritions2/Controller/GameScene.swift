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
   let background = SKSpriteNode (imageNamed: "background nutrition")
    let lynn = SKSpriteNode(imageNamed: "pink forward 1")
    let kidney = SKSpriteNode(imageNamed: "Ginjal sedih 1")
    let heart = SKSpriteNode (imageNamed: "Jantung sedih 1")
    let brain = SKSpriteNode (imageNamed: "Otak sedih 1")
    let lungs = SKSpriteNode (imageNamed: "Paru sedih 1")
    let muscle = SKSpriteNode (imageNamed: "Otot sedih 1")
    let pauseButton = SKSpriteNode (imageNamed: "Pause")
    


let playerContact : UInt32 = 0x1 << -2

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    override init(size: CGSize) {
        super.init(size: size)
        
        //self.view?.bounds.size = background.size
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = .zero
        physicsBody?.velocity = (CGVector(dx: 1.0, dy: 0.5))
        isUserInteractionEnabled = true
        
   
        pauseButton.size = CGSize(width: 50, height: 50)
        pauseButton.position = CGPoint(x: size.width - 75, y: size.height - 75)
        pauseButton.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        addChild(pauseButton)
        
        background.subdivisionLevels = .min
        background.size = CGSize(width: frame.size.width, height: frame.size.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = -1
        //background.anchorPoint = CGPoint(x: 0.0, y: 0.0)
    
        addChild(background)
        
    
    
  //      add pLynn
        lynn.zPosition = 1
        lynn.size = CGSize(width: 65, height: 65)
        lynn.position = CGPoint(x: size.width/2, y: 30)
        lynn.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        lynn.physicsBody = SKPhysicsBody(circleOfRadius: lynn.size.width/4)
        lynn.physicsBody?.isDynamic = true
        lynn.physicsBody?.linearDamping = 1.0
        lynn.physicsBody?.contactTestBitMask = playerContact
        lynn.name = "Lynn"
        addChild(lynn)
        
        //add Kidney
        kidney.zPosition = 1
        kidney.size = CGSize (width: 90, height: 90)
        kidney.position = CGPoint(x: ((size.width)/4) * 3.2, y: (size.height) - 135)
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
        lungs.zPosition = 1
        lungs.size = CGSize(width: 90, height: 90)
        lungs.position = CGPoint(x: ((size.width) / 8) * 0.78, y: (size.height) - 165)
        lungs.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //heart.physicsBody = SKPhysicsBody(circleOfRadius: heart.size.height/3)
        lungs.physicsBody?.isDynamic = true
        lungs.physicsBody?.linearDamping = 1.0
        lungs.physicsBody?.contactTestBitMask = playerContact
        lungs.name = "Lungs"
        lungsSad()
        addChild(lungs)
    
        //add brain
        heart.zPosition = 1
        heart.size = CGSize (width: 90, height: 90)
        heart.position = CGPoint(x: ((size.width) / 13) * 0.87, y: (size.height) - 315)
       //anchor point utk menunjukkan kordinat si nodenya
        heart.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //brain.physicsBody = SKPhysicsBody(circleOfRadius: player2.size.width/3)
        heart.physicsBody?.isDynamic = true
        heart.physicsBody?.linearDamping = 1.0
        heart.physicsBody?.contactTestBitMask = playerContact
        heart.name = "Heart"
        heartmoved()
        addChild(heart)
    
    //add lungs
        brain.zPosition = 1
        brain.size = CGSize (width: 90, height: 90)
        brain.position = CGPoint(x: (size.width / 2) * 0.89, y: size.height - 110)
        //anchor point utk menunjukkan kordinat si nodenya
        brain.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //lungs.physicsBody = SKPhysicsBody(circleOfRadius: player2.size.width/3)
        brain.physicsBody?.isDynamic = true
        brain.physicsBody?.linearDamping = 1.0
        // lungs.physicsBody?.contactTestBitMask = playerContact
        brain.name = "Brain"
        brainSad()
        addChild(brain)
        
    
       //add muscle
        muscle.zPosition = 1
        muscle.size = CGSize (width: 100, height: 100)
        muscle.position = CGPoint(x: ((size.width)/5) * 4 , y: (size.height) - 360)
        //anchor point utk menunjukkan kordinat si nodenya
        muscle.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //muscle.physicsBody = SKPhysicsBody(circleOfRadius: player2.size.width/3)//
        muscle.physicsBody?.isDynamic = true
        muscle.physicsBody?.linearDamping = 1.0
        // muscle.physicsBody?.contactTestBitMask = playerContact
        muscle.name = "Muscle"
        muscleSad()
        addChild(muscle)
    
   
}
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        let touchLocation = touch.location(in: self)
        print("touched point: \(touchLocation)")
       
        
   
if touchLocation.x >= (kidney.position.x) && touchLocation.x < (kidney.position.x) + 70 && touchLocation.y >= (kidney.position.y) {
    lynn.physicsBody?.velocity = (CGVector(dx: 0, dy: ((kidney.position.y) - 20) - (lynn.position.y)))
    pinkForward()
    
    DispatchQueue.main.async {
            AudioServicesPlayAlertSound(SystemSoundID(1151) )
        }
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
    self.lynn.physicsBody?.velocity = CGVector(dx: ((self.kidney.position.x)-(self.lynn.position.x)) + 20 , dy: 0)
    self.pinkRight()
    })
    
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(7), execute: {
    self.player2moved2()
        self.lynn.isHidden = true
        self.lynn.position = CGPoint(x: self.size.width/2, y: 30)
        self.pinkForward()
    })
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(8), execute: {
        self.lynn.isHidden = false
        
    })
    
           
}else if touchLocation.x > (lungs.position.x) && touchLocation.x <= (lungs.position.x) + 75 &&  touchLocation.y >= (lungs.position.y) && touchLocation.y < (lungs.position.y) + 75 {
    
    lynn.physicsBody?.velocity = (CGVector(dx: 0, dy: ((heart.position.y) - (lynn.position.y)) + 77))
     pinkForward()
        DispatchQueue.main.async {
            AudioServicesPlayAlertSound(SystemSoundID(1311) )
        }
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
        self.lynn.physicsBody?.velocity = (CGVector(dx: ((self.lungs.position.x) - (self.lynn.position.x)) + 200, dy:0))
        self.pinkLeft()
    })
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
        self.lynn.physicsBody?.velocity = (CGVector(dx: 0, dy:((self.lungs.position.y) - (self.lynn.position.y)) + 67 ))
        self.pinkForward()
    
    })
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
        self.lynn.physicsBody?.velocity = (CGVector(dx: ((self.lungs.position.x) + 80) - (self.lynn.position.x), dy:0))
        self.pinkLeft()
    })
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(6), execute: {
    self.lungsHappy()
        self.lynn.isHidden = true
        self.lynn.position = CGPoint(x: (self.size.width/2), y: 30)
    })
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(9), execute: {
        self.lynn.isHidden = false
        self.pinkForward()
        
    })
}else if  touchLocation.x >= (brain.position.x) && touchLocation.x < (brain.position.x) + 95 && touchLocation.y >= (brain.position.y) && touchLocation.y < (brain.position.y) + 95 {
    lynn.physicsBody?.velocity = (CGVector(dx: 0, dy: (brain.position.y) - (lynn.position.y)))
           pinkForward()
            DispatchQueue.main.async {
                AudioServicesPlayAlertSound(SystemSoundID(1322) )

            }
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
            self.lynn.isHidden = true
            self.lynn.position = CGPoint(x: (self.size.width/2) + 10, y: 30)
            self.brainHappy()
        })
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
        self.lynn.isHidden = false
    })

} else if  touchLocation.x >= (heart.position.x) && touchLocation.x < (heart.position.x) + 95 && touchLocation.y >= (heart.position.y) && touchLocation.y < (heart.position.y) + 95{
        lynn.physicsBody?.velocity = (CGVector(dx: 0, dy: ((heart.position.y)-(lynn.position.y)) + 60))
           pinkForward()
        DispatchQueue.main.async {
            AudioServicesPlayAlertSound(SystemSoundID(1309) )

        }
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
        
            self.lynn.physicsBody?.velocity = (CGVector(dx:((self.heart.position.x) - (self.lynn.position.x)) + 58, dy:0 ))
            self.pinkLeft()
            
        })
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
    
        self.lynn.isHidden = true
        self.heartmoved2()
        self.lynn.position = CGPoint(x: (self.size.width/2) + 10, y: 30)
        
    })
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(6), execute: {
    
        self.lynn.isHidden = false
        self.pinkForward()
        
    })
}else if   touchLocation.x >= (muscle.position.x) && touchLocation.x < (muscle.position.x) + 100 && touchLocation.y >= (muscle.position.y) && touchLocation.y < (muscle.position.y) + 100 {
    lynn.physicsBody?.velocity = (CGVector(dx: 0, dy: ((muscle.position.y) - (muscle.position.y)) + 60 ))

//            DispatchQueue.main.async {
//                AudioServicesPlayAlertSound(SystemSoundID(1324) )
//                self.pinkForward()
//            }
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.lynn.physicsBody?.velocity = (CGVector(dx: (self.muscle.position.x) - (self.lynn.position.x), dy: 0 ))
            self.pinkRight()
        })
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
        self.muscleHappy()
        self.lynn.isHidden = true
        self.lynn.position = CGPoint(x: (self.size.width/2) + 10, y: 30)
    })
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(6), execute: {
        self.pinkForward()
        self.lynn.isHidden = false
        
    })
}else if touchLocation.x >= pauseButton.position.x && touchLocation.x < (pauseButton.position.x) + 60 && touchLocation.y >= pauseButton.position.y && touchLocation.y < (pauseButton.position.y) + 60{
   brainHappy()
    let scene = PausePage(size: CGSize(width: size.width, height: size.height))
    scene.scaleMode = scaleMode
       // Set the scale mode to scale to fit the window
     let sKView = self.view as! SKView
        // Load the SKScene from 'GameScene.sks'
        
            
            // Present the scene

        sKView.presentScene(scene)
        sKView.ignoresSiblingOrder = true
        sKView.showsFPS = true
        sKView.showsNodeCount = true
    
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

    func lynnIdle(){
        let textureAtlas =  SKTextureAtlas(named: "Lynn")
        let Lynn = [textureAtlas.textureNamed("Lynn Idle 1"), textureAtlas.textureNamed("Lynn Idle 2"), textureAtlas.textureNamed("Lynn Idle 1"), textureAtlas.textureNamed("Lynn Idle 2"), textureAtlas.textureNamed("Lynn Idle 1"), textureAtlas.textureNamed("Lynn Idle 2"), textureAtlas.textureNamed("Lynn Idle 1")]
        
        let lynnIdleTexture = Lynn
        let animateAction = SKAction.animate(with:lynnIdleTexture, timePerFrame: 0.5)
        lynn.run(animateAction)
        }
    func lynnLeft(){
        let textureAtlas =  SKTextureAtlas(named: "Lynn")
        let Lynn = [textureAtlas.textureNamed("Lynn move kiri 1"), textureAtlas.textureNamed("Lynn move kiri 2"), textureAtlas.textureNamed("Lynn move kiri 1"), textureAtlas.textureNamed("Lynn move kiri 2"), textureAtlas.textureNamed("Lynn move kiri 1"), textureAtlas.textureNamed("Lynn move kiri 2"), textureAtlas.textureNamed("Lynn move kiri 1")]
        
        let lynnLeftTexture = Lynn
        let animateAction = SKAction.animate(with:lynnLeftTexture, timePerFrame: 0.5)
        lynn.run(animateAction)
        }
    
    func lynnRight(){
        let textureAtlas =  SKTextureAtlas(named: "Lynn")
        let Lynn = [textureAtlas.textureNamed("Lynn move kanan 1"), textureAtlas.textureNamed("Lynn move kanan 2"), textureAtlas.textureNamed("Lynn move kanan 1"), textureAtlas.textureNamed("Lynn move kanan 2"), textureAtlas.textureNamed("Lynn move kanan 1"), textureAtlas.textureNamed("Lynn move kanan 2"), textureAtlas.textureNamed("Lynn move kanan 1")]
        
        let lynnRightTexture = Lynn
        let animateAction = SKAction.animate(with:lynnRightTexture, timePerFrame: 0.5)
        lynn.run(animateAction)
        }
    
    func lynnForward(){
        let textureAtlas =  SKTextureAtlas(named: "Lynn")
        let Lynn = [textureAtlas.textureNamed("Lynn move depan 1"), textureAtlas.textureNamed("Lynn move depan 2"), textureAtlas.textureNamed("Lynn move depan 1"), textureAtlas.textureNamed("Lynn move depan 2"), textureAtlas.textureNamed("Lynn move depan 1"), textureAtlas.textureNamed("Lynn move depan 2"), textureAtlas.textureNamed("Lynn move depan 1")]
        
        let lynnForwardTexture = Lynn
        let animateAction = SKAction.animate(with:lynnForwardTexture, timePerFrame: 0.5)
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
    
    func brainHappy(){
        let textureAtlas =  SKTextureAtlas(named: "Brain")
        let Brain = [textureAtlas.textureNamed("Brain Happy 1"), textureAtlas.textureNamed("Brain Happy 2"), textureAtlas.textureNamed("Brain Happy 1"), textureAtlas.textureNamed("Brain Happy 2"), textureAtlas.textureNamed("Brain Happy 1"), textureAtlas.textureNamed("Brain Happy 2"), textureAtlas.textureNamed("Brain Happy 1")]
        
        let brainHappyTexture = Brain
        let animateAction = SKAction.animate(with:brainHappyTexture, timePerFrame: 0.5)
        brain.run(animateAction)
        }
    
    func brainSad(){
        let textureAtlas =  SKTextureAtlas(named: "Brain")
        let Brain = [textureAtlas.textureNamed("Otak sedih 1"), textureAtlas.textureNamed("Otak sedih 2"), textureAtlas.textureNamed("Otak sedih 1"), textureAtlas.textureNamed("Otak sedih 2"), textureAtlas.textureNamed("Otak sedih 1"), textureAtlas.textureNamed("Otak sedih 2"), textureAtlas.textureNamed("Otak sedih 1")]
        
        let brainSedihTexture = Brain
        let animateAction = SKAction.animate(with:brainSedihTexture, timePerFrame: 0.5)
        brain.run(animateAction)
        }
    
    func muscleHappy(){
        let textureAtlas =  SKTextureAtlas(named: "Muscle")
        let Muscle = [textureAtlas.textureNamed("Otot Happy 1"), textureAtlas.textureNamed("Otot Happy 2"), textureAtlas.textureNamed("Otot Happy 1"), textureAtlas.textureNamed("Otot Happy 2"), textureAtlas.textureNamed("Otot Happy 1"), textureAtlas.textureNamed("Otot Happy 2"), textureAtlas.textureNamed("Otot Happy 1")]
        
        let muscleHappyTexture = Muscle
        let animateAction = SKAction.animate(with:muscleHappyTexture, timePerFrame: 0.5)
        muscle.run(animateAction)
        }
    
    func muscleSad(){
        let textureAtlas =  SKTextureAtlas(named: "Muscle")
        let Muscle = [textureAtlas.textureNamed("Otot sedih 1"), textureAtlas.textureNamed("Otot sedih 2"), textureAtlas.textureNamed("Otot sedih 1"), textureAtlas.textureNamed("Otot sedih 2"), textureAtlas.textureNamed("Otot sedih 1"), textureAtlas.textureNamed("Otot sedih 2"), textureAtlas.textureNamed("Otot sedih 1")]
        
        let muscleSadTexture = Muscle
        let animateAction = SKAction.animate(with:muscleSadTexture, timePerFrame: 0.5)
        muscle.run(animateAction)
        }
    
    func lungsHappy(){
        let textureAtlas =  SKTextureAtlas(named: "Lungs")
        let Lungs = [textureAtlas.textureNamed("Paru happy 1"), textureAtlas.textureNamed("Paru happy 2"), textureAtlas.textureNamed("Paru happy 1"), textureAtlas.textureNamed("Paru happy 2"), textureAtlas.textureNamed("Paru happy 1"), textureAtlas.textureNamed("Paru happy 2"), textureAtlas.textureNamed("Paru happy 1")]
        
        let lungsHappyTexture = Lungs
        let animateAction = SKAction.animate(with:lungsHappyTexture, timePerFrame: 0.5)
        lungs.run(animateAction)
        }
    
    func lungsSad(){
        let textureAtlas =  SKTextureAtlas(named: "Lungs")
        let Lungs = [textureAtlas.textureNamed("Paru sedih 1"), textureAtlas.textureNamed("Paru sedih 2"), textureAtlas.textureNamed("Paru sedih 1"), textureAtlas.textureNamed("Paru sedih 2"), textureAtlas.textureNamed("Paru sedih 1"), textureAtlas.textureNamed("Paru sedih 2"), textureAtlas.textureNamed("Paru sedih 1")]
        
        let lungsSadTexture = Lungs
        let animateAction = SKAction.animate(with:lungsSadTexture, timePerFrame: 0.5)
        lungs.run(animateAction)
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
 
