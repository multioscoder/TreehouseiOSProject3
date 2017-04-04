//
//  ViewController.swift
//  Project 3
//
//  Created by Mohamed Al Mohannadi on 4/3/17.
//  Copyright © 2017 Mohamed Al Mohannadi. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    @IBOutlet weak var event1: UILabel!
    @IBOutlet weak var event2: UILabel!
    @IBOutlet weak var event3: UILabel!
    @IBOutlet weak var event4: UILabel!
    @IBOutlet weak var timerOutlet: UIButton!
    @IBOutlet weak var hiddenYear1: UILabel!
    @IBOutlet weak var hiddenYear2: UILabel!
    @IBOutlet weak var hiddenYear3: UILabel!
    @IBOutlet weak var hiddenYear4: UILabel!
    @IBOutlet weak var oldestFounded: UILabel!
    @IBOutlet weak var recentlyFounded: UILabel!
    @IBOutlet weak var event1DownOutlet: UIButton!
    @IBOutlet weak var event2UpOutlet: UIButton!
    @IBOutlet weak var event2DownOutlet: UIButton!
    @IBOutlet weak var event3UpOutlet: UIButton!
    @IBOutlet weak var event3DownOutlet: UIButton!
    @IBOutlet weak var event4UpOutlet: UIButton!
    @IBOutlet weak var finalScore: UILabel!
    @IBOutlet weak var finalScoreLabel: UILabel!



    var currentScore = 0
    var currentRound = 1
    
    var timer = Timer()
    var counter: TimeInterval = 60
    var timeLeft = 60
    var timerRunning = false


    func displayEvents(round: Int) {
        
        event1.text = events[(arrayOfNumberOfEventsSchuffled?[(round-1+(3*(round-1)))])!].name
        event2.text = events[(arrayOfNumberOfEventsSchuffled?[(round+(3*(round-1)))])!].name
        event3.text = events[(arrayOfNumberOfEventsSchuffled?[(round+1+(3*(round-1)))])!].name
        event4.text = events[(arrayOfNumberOfEventsSchuffled?[(round+2+(3*(round-1)))])!].name
        
        hiddenYear1.text = String(events[(arrayOfNumberOfEventsSchuffled?[(round-1+(3*(round-1)))])!].year)
        hiddenYear2.text = String(events[(arrayOfNumberOfEventsSchuffled?[(round+(3*(round-1)))])!].year)
        hiddenYear3.text = String(events[(arrayOfNumberOfEventsSchuffled?[(round+1+(3*(round-1)))])!].year)
        hiddenYear4.text = String(events[(arrayOfNumberOfEventsSchuffled?[(round+2+(3*(round-1)))])!].year)
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        displayEvents(round: currentRound)
        
        resetTimer()
        beginTimer()
        updateTimer()
        
        hiddenYear1.isHidden = true
        hiddenYear2.isHidden = true
        hiddenYear3.isHidden = true
        hiddenYear4.isHidden = true
        finalScore.isHidden = true
        finalScoreLabel.isHidden = true
        
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    


    @IBAction func event1Down(_ sender: UIButton) {
        
        var event1CurrentTextForEvent1Down = event1.text
        var event2CurrentTextForEvent1Down  = event2.text
        
        event1.text = event2CurrentTextForEvent1Down
        event2.text = event1CurrentTextForEvent1Down
        
        var event1CurrentYearForEvent1Down = hiddenYear1.text
        var event2CurrentYearForEvent1Down  = hiddenYear2.text
        
        hiddenYear1.text = event2CurrentYearForEvent1Down
        hiddenYear2.text = event1CurrentYearForEvent1Down
        
        
    }
        
    @IBAction func event2Up(_ sender: UIButton) {
        
        var event1CurrentTextForEvent2Up  = event1.text
        var event2CurrentTextForEvent2Up = event2.text
        
        event1.text = event2CurrentTextForEvent2Up
        event2.text = event1CurrentTextForEvent2Up
        
        var event1CurrentYearForEvent2Up  = hiddenYear1.text
        var event2CurrentYearForEvent2Up = hiddenYear2.text
        
        hiddenYear1.text = event2CurrentYearForEvent2Up
        hiddenYear2.text = event1CurrentYearForEvent2Up
        
        
    }
        
    @IBAction func event2Down(_ sender: UIButton) {
        
        var event2CurrentTextForEvent2Down  = event2.text
        var event3CurrentTextForEvent2Down = event3.text
        
        event2.text = event3CurrentTextForEvent2Down
        event3.text = event2CurrentTextForEvent2Down
        
        var event2CurrentYearForEvent2Down  = hiddenYear2.text
        var event3CurrentYearForEvent2Down = hiddenYear3.text
        
        hiddenYear2.text = event3CurrentYearForEvent2Down
        hiddenYear3.text = event2CurrentYearForEvent2Down
    
    }
        
    @IBAction func event3Up(_ sender: UIButton) {
        
        var event2CurrentTextForEvent3Up  = event2.text
        var event3CurrentTextForEvent3Up = event3.text
        
        event2.text = event3CurrentTextForEvent3Up
        event3.text = event2CurrentTextForEvent3Up
        
        var event2CurrentYearForEvent3Up  = hiddenYear2.text
        var event3CurrentYearForEvent3Up = hiddenYear3.text
        
        hiddenYear2.text = event3CurrentYearForEvent3Up
        hiddenYear3.text = event2CurrentYearForEvent3Up
        
    }
        
    @IBAction func event3Down(_ sender: UIButton) {
        
        var event3CurrentTextForEvent3Down = event3.text
        var event4CurrentTextForEvent3Down = event4.text
        
        event3.text = event4CurrentTextForEvent3Down
        event4.text = event3CurrentTextForEvent3Down
        
        var event3CurrentYearForEvent3Down = hiddenYear3.text
        var event4CurrentYearForEvent3Down = hiddenYear4.text
        
        hiddenYear3.text = event4CurrentYearForEvent3Down
        hiddenYear4.text = event3CurrentYearForEvent3Down
        
    }
        
    @IBAction func event4Up(_ sender: UIButton) {
        
        var event3CurrentTextForEvent4Up = event3.text
        var event4CurrentTextForEvent4Up = event4.text
        
        event3.text = event4CurrentTextForEvent4Up
        event4.text = event3CurrentTextForEvent4Up
        
        var event3CurrentYearForEvent4Up = hiddenYear3.text
        var event4CurrentYearForEvent4Up = hiddenYear4.text
        
        hiddenYear3.text = event4CurrentYearForEvent4Up
        hiddenYear4.text = event3CurrentYearForEvent4Up
    }
    

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
      
        let finalTextYear1ForShake = hiddenYear1.text
        let finalTextYear2ForShake = hiddenYear2.text
        let finalTextYear3ForShake = hiddenYear3.text
        let finalTextYear4ForShake = hiddenYear4.text
        
        switch motion {
        case .motionShake:
            timer.invalidate()
            timerOutlet.isEnabled = true
            event1DownOutlet.isEnabled = false
            event2UpOutlet.isEnabled = false
            event2DownOutlet.isEnabled = false
            event3UpOutlet.isEnabled = false
            event3DownOutlet.isEnabled = false
            event4UpOutlet.isEnabled = false
            if Int(finalTextYear4ForShake!)! > Int(finalTextYear3ForShake!)! && Int(finalTextYear3ForShake!)! > Int(finalTextYear2ForShake!)! && Int(finalTextYear2ForShake!)! > Int(finalTextYear1ForShake!)! { timerOutlet.setImage(#imageLiteral(resourceName: "next_round_success"), for: .normal)
                currentScore += 1} else {
                timerOutlet.setImage(#imageLiteral(resourceName: "next_round_fail"), for: .normal)
            }        default:
            print("\(motion) ended. Event: \(event)")
        }
    }
 
    func updateTimer() {
        
        let finalTextYear1 = hiddenYear1.text
        let finalTextYear2 = hiddenYear2.text
        let finalTextYear3 = hiddenYear3.text
        let finalTextYear4 = hiddenYear4.text
        

        
        timeLeft -= 1
        timerOutlet.setTitle("0:\(timeLeft)", for: .normal)
        if timeLeft == 0 {
            timerOutlet.isEnabled = true
            
            event1DownOutlet.isEnabled = false
            event2UpOutlet.isEnabled = false
            event2DownOutlet.isEnabled = false
            event3UpOutlet.isEnabled = false
            event3DownOutlet.isEnabled = false
            event4UpOutlet.isEnabled = false
            
            timer.invalidate()

            if Int(finalTextYear4!)! > Int(finalTextYear3!)! && Int(finalTextYear3!)! > Int(finalTextYear2!)! && Int(finalTextYear2!)! > Int(finalTextYear1!)! { timerOutlet.setImage(#imageLiteral(resourceName: "next_round_success"), for: .normal)
            currentScore += 1} else {
                timerOutlet.setImage(#imageLiteral(resourceName: "next_round_fail"), for: .normal)
            }
            
        } else { timerOutlet.isEnabled = false
        
            event1DownOutlet.isEnabled = true
            event2UpOutlet.isEnabled = true
            event2DownOutlet.isEnabled = true
            event3UpOutlet.isEnabled = true
            event3DownOutlet.isEnabled = true
            event4UpOutlet.isEnabled = true
        
        
        
        
        }
        if timeLeft <= 9 && timeLeft >= 1 {
            timerOutlet.setTitle("0:0\(timeLeft)", for: .normal)
        }
    }
    
    func beginTimer() {
        if timerRunning == false {
            counter = 60
            timeLeft = 60
            timerRunning = true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        }
    }

    func resetTimer() {
        timeLeft = 60
        counter = 60
        timerRunning = false
    }

    @IBAction func nextRound(_ sender: UIButton) {
      currentRound += 1
        if currentRound == 7 {
        
        oldestFounded.isHidden = true
        recentlyFounded.isHidden = true
        timerOutlet.isHidden = true
        event1.isHidden = true
            event2.isHidden = true
            event3.isHidden = true
            event4.isHidden = true
            event1DownOutlet.isHidden = true
            event2UpOutlet.isHidden = true
            event2DownOutlet.isHidden = true
            event3UpOutlet.isHidden = true
            event3DownOutlet.isHidden = true
            event4UpOutlet.isHidden = true
            
            finalScore.isHidden = false
            finalScoreLabel.isHidden = false
            
            finalScore.text = "\(currentScore) / 6"
            
            
            
        
        } else {
        timerOutlet.setImage(nil, for: .normal)
        displayEvents(round: currentRound)
        resetTimer()
        beginTimer()
        updateTimer()
        
    }
    }
    

    
}

