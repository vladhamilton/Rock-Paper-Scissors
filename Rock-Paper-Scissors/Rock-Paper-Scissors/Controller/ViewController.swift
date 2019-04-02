//
//  HomeVC.swift
//  Rock-Paper-Scissors
//
//  Created by Vladyslav Kolomiets on 4/1/19.
//  Copyright © 2019 Vladyslav Kolomiets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var cpuChoiceLabel: UILabel!
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var rockButton: UIButton!
  @IBOutlet weak var paperButton: UIButton!
  @IBOutlet weak var scissorsButton: UIButton!
  @IBOutlet weak var retryButton: UIButton!
  @IBOutlet weak var playerScoreLabel: UILabel!
  @IBOutlet weak var cpuScoreLabel: UILabel!
  
  
  var playerScore = 0
  var cpuScore = 0
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent 
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    resetBoard()
  }
  
  func resetBoard() {
    cpuChoiceLabel.text = "🤖"
    statusLabel.text = "Rock, Paper, Scissors?"
    rockButton.isHidden = false
    rockButton.isEnabled = true
    paperButton.isHidden = false
    paperButton.isEnabled = true
    scissorsButton.isHidden = false
    scissorsButton.isEnabled = true
    retryButton.isHidden = true
    super.view.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.2392156863, blue: 0.2392156863, alpha: 1)
  }
  
  func play(_ playerTurn: Sign) {
    rockButton.isEnabled = false
    paperButton.isEnabled = false
    scissorsButton.isEnabled = false
    
    let cpu = randomSign()
    cpuChoiceLabel.text = cpu.emoji
    
    let gameResult = playerTurn.makeTurn(cpu)
    
    switch gameResult {
    case .draw:
      statusLabel.text = "It's a draw."
    case .win:
      playerScore += 1
      playerScoreLabel.text = String(playerScore)
      statusLabel.text = "You win!"
      playSound()
      super.view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    case .lose:
      cpuScore += 1
      cpuScoreLabel.text = String(cpuScore)
      statusLabel.text = "Sorry, you lose."
      super.view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    case .start:
      statusLabel.text = "Rock, Paper, Scissors?"
    }
    
    switch playerTurn {
    case .rock:
      rockButton.isHidden = false
      paperButton.isHidden = true
      scissorsButton.isHidden = true
    case .paper:
      rockButton.isHidden = true
      paperButton.isHidden = false
      scissorsButton.isHidden = true
    case .scissors:
      rockButton.isHidden = true
      paperButton.isHidden = true
      scissorsButton.isHidden = false
    }
    retryButton.isHidden = false
  }
  
  @IBAction func rockButtonPressed(_ sender: Any) {
    play(Sign.rock)
  }
  @IBAction func paperButtonPressed(_ sender: Any) {
    play(Sign.paper)
  }
  @IBAction func scissorsButtonPressed(_ sender: Any) {
    play(Sign.scissors)
  }
  @IBAction func retryButtonPressed(_ sender: Any) {
    resetBoard()
  }
  @IBAction func resetScoreButton(_ sender: Any) {
    self.playerScore = 0
    playerScoreLabel.text = "\(self.playerScore)"
    self.cpuScore = 0
    cpuScoreLabel.text = "\(self.cpuScore)"
  }
}

