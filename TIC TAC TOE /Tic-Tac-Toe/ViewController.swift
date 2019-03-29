// NAME - Ketan Bhandari
// STUDENT NUMBER - 991539241
// ASSIGNMENT - 2

//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Ketan Bhandari on 2019-02-12.
//  Copyright © 2019 Ketan Bhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var playerOne: String?
    var playerTwo: String?
    
    
    @IBOutlet var over: UILabel!
    @IBOutlet var turn: UILabel!
   
    
    var player = 1 // Player 1 is a CROSS
    var game = [0, 0, 0, 0, 0, 0, 0, 0, 0] // initial stage
    
    
    let win = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]] // winning combination
    var gamePlaying = true

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        over.isHidden = true
        
        turn.isHidden = true
        
        self.playAgain()
        
        
        
        
    }

    @IBAction func play(_ sender: UIButton)
    {
        
            
        let position = sender.tag-1
        if (game[position] == 0 && gamePlaying == true)
        {
            game[position] = player
            if player == 1
            {
                
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State())
                
                player = 2
            }else
            {
                
                sender.setImage(UIImage(named: "circle.png"), for: UIControl.State())
                
                player = 1
            }
            
        }
        
        if player == 1{
            turn.isHidden = false
            turn.text = "\(self.playerOne!)'S TURN"
            
            
        }else{
            turn.isHidden = false
            turn.text = "\(self.playerTwo!)'S TURN"
            
        
                
            
        }
        
        
        for combination in win
        {
            var winner : String
            if game[combination[0]] != 0 && game[combination[0]] == game[combination[1]] && game[combination[1]] == game[combination[2]]
            {
                gamePlaying = false
                
                if game[combination[0]] == 1{
                    
                    winner = "\(self.playerOne!) HAS WON"
                    over.text = "GAME OVER"
                    
                }else{
                    
                    winner = "\(self.playerTwo!) HAS WON"
                    over.text = "GAME OVERE"
                    
                    
                }
                
                let alertMessage = UIAlertController(title: "Result", message: winner, preferredStyle: .alert)
                
                alertMessage.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                
                alertMessage.addAction(UIAlertAction(title: "Play Again?", style: .default, handler: {_ in self.playAgain()}))
                
                self.present(alertMessage, animated: true, completion: nil)
               
                over.isHidden = false
                
                turn.isHidden = true
                
            }
            
        }
        
        gamePlaying = false
        
        for i in game
        {
            if i == 0
            {
                gamePlaying = true
                break
            }
        }
        if gamePlaying == false
        {
            over.text = "GAME OVER"
            over.isHidden = false
           
            turn.isHidden = true
            
       
            let alertMessage = UIAlertController(title: "Result", message: "IT'S A DRAW", preferredStyle: .alert)
        
            alertMessage.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
            alertMessage.addAction(UIAlertAction(title: "Play Again?", style: .default, handler: {_ in self.playAgain()}))
        
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        
      }
    
    func playAgain()
    {
        game = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gamePlaying = true
        player = 1
        
        
        over.isHidden = true
        
        turn.isHidden = true
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    
}
