//
//  HomeVC.swift
//  Rock-Paper-Scissors
//
//  Created by Vladyslav Kolomiets on 4/1/19.
//  Copyright © 2019 Vladyslav Kolomiets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var cpuLabel: UILabel!
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var rockButton: UIButton!
  @IBOutlet weak var paperButton: UIButton!
  @IBOutlet weak var scissorsButton: UIButton!
  @IBOutlet weak var retryButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    resetBoard()
  }
  
  func resetBoard() {
    cpuLabel.text = "🤖"
    statusLabel.text = "Rock, Paper, Scissors?"
    rockButton.isHidden = false
    rockButton.isEnabled = true
    paperButton.isHidden = false
    paperButton.isEnabled = true
    scissorsButton.isHidden = false
    scissorsButton.isEnabled = true
    retryButton.isHidden = true
  }
  
  func play(_ playerTurn: Sign) {
    rockButton.isEnabled = false
    paperButton.isEnabled = false
    scissorsButton.isEnabled = false
    
    let cpu = randomSign()
    cpuLabel.text = cpu.emoji
    
    let gameResult = playerTurn.makeTurn(cpu)
    
    switch gameResult {
    case .draw:
      statusLabel.text = "It's a draw."
    case .win:
      statusLabel.text = "You win!"
    case .lose:
      statusLabel.text = "Sorry, you lose."
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
}

