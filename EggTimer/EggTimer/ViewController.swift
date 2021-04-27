//
//  ViewController.swift
//  EggTimer
//
//  Created by Zain Ahmed on 02/25/2021.
//  Copyright © 2020 Zain Ahmed. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var topLabel: UILabel!
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        topLabel.text = hardness
    
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            playSound()
            topLabel.text = "DONE!"
            timer.invalidate()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    

}
