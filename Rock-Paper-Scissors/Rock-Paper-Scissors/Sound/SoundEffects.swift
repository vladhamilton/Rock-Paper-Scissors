//
//  SoundEffects.swift
//  Rock-Paper-Scissors
//
//  Created by Vladyslav Kolomiets on 4/2/19.
//  Copyright © 2019 Vladyslav Kolomiets. All rights reserved.
//

import UIKit
import AVFoundation

let victorySoundPath = "victory.mp3"

var soundEffect: AVAudioPlayer?
func playSound() {
  let path = Bundle.main.path(forResource: "\(victorySoundPath)", ofType: nil)!
  let url = URL(fileURLWithPath: path)
  do {
    soundEffect = try AVAudioPlayer(contentsOf: url)
    soundEffect?.play()
  } catch let error {
    print(error.localizedDescription)
  }
}
