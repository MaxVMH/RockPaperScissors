//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Maxim Van Meerhaeghe on 16/06/2020.
//  Copyright © 2020 Mixam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        updateUI(gameState: .start)
    }
    
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func rockButtonTapped(_ sender: Any) {
        play(player1Sign: .rock)
    }
    @IBAction func paperButtonTapped(_ sender: Any) {
        play(player1Sign: .paper)
    }
    @IBAction func scissorsButtonTapped(_ sender: Any) {
        play(player1Sign: .scissors)
    }
    @IBAction func playAgainButtonTapped(_ sender: Any) {
        updateUI(gameState: .start)
    }
    
    func updateUI(gameState: GameState) {
        
        switch gameState {
        case .start:
            player2Label.text = "🤖"
            gameStatusLabel.text = "Rock, Paper, Scissors?"
            gameStatusLabel.textColor = UIColor.systemGray
            rockButton.isHidden = false
            rockButton.isEnabled = true
            paperButton.isHidden = false
            paperButton.isEnabled = true
            scissorsButton.isHidden = false
            scissorsButton.isEnabled = true
            playAgainButton.isHidden = true
        case .win:
            gameStatusLabel.text = "You win!"
            gameStatusLabel.textColor = UIColor.systemGreen
        case .lose:
            gameStatusLabel.text = "You lose!"
            gameStatusLabel.textColor = UIColor.systemRed
        case .draw:
            gameStatusLabel.text = "It's a draw!"
            gameStatusLabel.textColor = UIColor.systemGray
        }
    }
    
    func play(player1Sign: Sign) {
        
        let player2Sign:Sign = randomSign()
        let gameState: GameState = player1Sign.playAgainst(otherSign: player2Sign)
        updateUI(gameState: gameState)
        
        player2Label.text = player2Sign.emoji
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        switch player1Sign {
        case .rock:
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
        }
        
        playAgainButton.isHidden = false
    }
    
}

