// NAME - Ketan Bhandari
// STUDENT NUMBER - 991539241
// ASSIGNMENT - 2

//
//  IntroViewController.swift
//  Tic-Tac-Toe
//
//  Created by Ketan Bhandari on 2019-02-14.
//  Copyright © 2019 Ketan Bhandari. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet var txtName1: UITextField!
    @IBOutlet var txtName2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startPlaying(_ sender: UIButton) {
        
        let name1 = txtName1.text
        let name2 = txtName2.text
        
        //launch the GameScene
        
        //refer the storyboard
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //scene from storyboard
        //let gameVC = mainSB.instantiateViewController(withIdentifier: "GameScene")
        let gameVC = mainSB.instantiateViewController(withIdentifier: "GameScene") as! ViewController
        
        gameVC.playerOne = name1
        gameVC.playerTwo = name2
        
        //push it on navigation stack
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
