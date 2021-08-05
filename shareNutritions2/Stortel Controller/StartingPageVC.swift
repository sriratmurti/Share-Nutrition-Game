//
//  StartingPageVC.swift
//  shareNutritions2
//
//  Created by Tenti Atika Putri on 05/08/21.
//

import UIKit

class StartingPageVC: UIViewController {

    @IBOutlet weak var quitButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func quitButtonTapped(_ sender: Any) {
        print("Quit Button Tapped")
        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
    }
    
    @IBAction func infoButtonTapped(_ sender: Any) {
        print("Info Button Tapped")
        
//        let aboutLynn = storyboard?.instantiateViewController(identifier: "About Lynn") as! AboutLynnVC
//        aboutLynn.modalPresentationStyle = .fullScreen
//        
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromTop
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        view.window!.layer.add(transition, forKey: kCATransition)
//        present(aboutLynn, animated: false, completion: nil)
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        print("Mulai Button Tapped")
        
//        let homeScreen = storyboard?.instantiateViewController(identifier: "Home Screen") as! HomeScreenVC
//        homeScreen.modalPresentationStyle = .fullScreen
//
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromRight
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        view.window!.layer.add(transition, forKey: kCATransition)
//        present(homeScreen, animated: false, completion: nil)
    }
}
