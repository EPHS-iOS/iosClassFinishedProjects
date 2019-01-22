//
//  ViewController.swift
//  ConnectThree
//
//  Created by 90301422 on 9/17/18.
//  Copyright © 2018 Nico D. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer1 = AVAudioPlayer()
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath:  Bundle.main.path(forResource: "song", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        }
    catch {
            print(error)
        }
        do { audioPlayer1 = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath:  Bundle.main.path(forResource: "fail", ofType: "mp3")!))
        audioPlayer1.prepareToPlay()
        }
        catch {
            print(error)
        }
    }

    
    
    class ViewController: UIViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        

    var playerTurn = 1
    
    var A1v = 0
    var A2v = 0
    var A3v = 0
    
    var B1v = 0
    var B2v = 0
    var B3v = 0
    
    var C1v = 0
    var C2v = 0
    var C3v = 0

    @IBOutlet weak var button1s: UIButton!
    @IBOutlet weak var button2s: UIButton!
    @IBOutlet weak var button3s: UIButton!

    @IBOutlet weak var A3Button: UIButton!
    @IBOutlet weak var A2Button: UIButton!
    @IBOutlet weak var A1Button: UIButton!
    
    @IBOutlet weak var B1Button: UIButton!
    @IBOutlet weak var B2Button: UIButton!
    @IBOutlet weak var B3Button: UIButton!
    
    @IBOutlet weak var C1Button: UIButton!
    @IBOutlet weak var C2Button: UIButton!
    @IBOutlet weak var C3Button: UIButton!
    
    
    @IBOutlet weak var turnLabel: UILabel!
    
    func blueArrowsAll() {
        button1s.setBackgroundImage(UIImage(named: "blueArrow"), for: UIControl.State.normal)
        button2s.setBackgroundImage(UIImage(named: "blueArrow"), for: UIControl.State.normal)
        button3s.setBackgroundImage(UIImage(named: "blueArrow"), for: UIControl.State.normal)
    }
    
    func redArrowsAll() {
        button1s.setBackgroundImage(UIImage(named: "redArrow"), for: UIControl.State.normal)
        button2s.setBackgroundImage(UIImage(named: "redArrow"), for: UIControl.State.normal)
        button3s.setBackgroundImage(UIImage(named: "redArrow"), for: UIControl.State.normal)
    }
    func changePlayer() {
        if playerTurn == 1 {
            playerTurn = 2
            redArrowsAll()
            turnLabel.text = "Red's Turn"
        }
        else if playerTurn == 2 {
            playerTurn = 1;
            blueArrowsAll()
            turnLabel.text = "Blue's Turn"
    }
    }
    func checkBlueA() {
        if A3v == 0 {
            A3v = 1
        A3Button.setBackgroundImage(UIImage(named: "blue"), for: UIControl.State.normal)
            changePlayer()
        }
            else if A2v == 0 {
                A2v = 1
            A2Button.setBackgroundImage(UIImage(named: "blue"), for: UIControl.State.normal)
                changePlayer()
        }
            else if A1v == 0 {
                A1v = 1
            A1Button.setBackgroundImage(UIImage(named: "blue"), for: UIControl.State.normal)
                changePlayer()
        }
        
    }
    
    func checkBlueB() {
        if B3v == 0 {
            B3v = 1
            B3Button.setBackgroundImage(UIImage(named: "blue"), for: UIControl.State.normal)
            changePlayer()
        }
        else if B2v == 0 {
            B2v = 1
            B2Button.setBackgroundImage(UIImage(named: "blue"), for: UIControl.State.normal)
            changePlayer()
        }
        else if B1v == 0 {
            B1v = 1
           B1Button.setBackgroundImage(UIImage(named: "blue"), for: UIControl.State.normal)
            changePlayer()
        }
        
    }
    
    func checkBlueC() {
        if C3v == 0 {
            C3v = 1
            C3Button.setBackgroundImage(UIImage(named: "blue"), for: UIControl.State.normal)
            changePlayer()
        }
        else if C2v == 0 {
            C2v = 1
            C2Button.setBackgroundImage(UIImage(named: "blue"), for: UIControl.State.normal)
            changePlayer()
        }
        else if C1v == 0 {
            C1v = 1
            C1Button.setBackgroundImage(UIImage(named: "blue"), for: UIControl.State.normal)
            changePlayer()
        }
        
    }
    
    func checkRedA() {
        if A3v == 0 {
            A3v = 2
            A3Button.setBackgroundImage(UIImage(named: "red"), for: UIControl.State.normal)
            changePlayer()
        }
        else if A2v == 0 {
            A2v = 2
            A2Button.setBackgroundImage(UIImage(named: "red"), for: UIControl.State.normal)
            changePlayer()
        }
        else if A1v == 0 {
            A1v = 2
            A1Button.setBackgroundImage(UIImage(named: "red"), for: UIControl.State.normal)
            changePlayer()
        }
    }
    
    func checkRedB() {
        if B3v == 0 {
            B3v = 2
            B3Button.setBackgroundImage(UIImage(named: "red"), for: UIControl.State.normal)
            changePlayer()
        }
        else if B2v == 0 {
            B2v = 2
            B2Button.setBackgroundImage(UIImage(named: "red"), for: UIControl.State.normal)
            changePlayer()
        }
        else if B1v == 0 {
            B1v = 2
            B1Button.setBackgroundImage(UIImage(named: "red"), for: UIControl.State.normal)
            changePlayer()
        }
    }
    
    func checkRedC() {
        if C3v == 0 {
            C3v = 2
            C3Button.setBackgroundImage(UIImage(named: "red"), for: UIControl.State.normal)
            changePlayer()
        }
        else if C2v == 0 {
            C2v = 2
            C2Button.setBackgroundImage(UIImage(named: "red"), for: UIControl.State.normal)
            changePlayer()
        }
        else if C1v == 0 {
            C1v = 2
            C1Button.setBackgroundImage(UIImage(named: "red"), for: UIControl.State.normal)
            changePlayer()
        }
    }
    
    func blueWins() {
        playerTurn = 3
        turnLabel.text = "Blue Wins!"
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        audioPlayer1.play()
        blueArrowsAll()
    }
    func redWins() {
        playerTurn = 3
        turnLabel.text = "Red Wins!"
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        redArrowsAll()
        audioPlayer.play()
    }
    
        func checkWinner() {
            if A1v == 1 && A2v == 1 && A3v == 1 {
                blueWins()
            }
            else if A1v == 2 && A2v == 2 && A3v == 2{
                redWins()
            }
            else if B1v == 1 && B2v == 1 && B3v == 1{
                blueWins()
            }
            else if B1v == 2 && B2v == 2 && B3v == 2{
                redWins()
            }
            else if C1v == 1 && C2v == 1 && C3v == 1{
                blueWins()
            }
            else if C1v == 2 && C2v == 2 && C3v == 2{
                redWins()
            }
            else if A1v == 1 && B1v == 1 && C1v == 1{
                blueWins()
            }
            else if A1v == 2 && B1v == 2 && C1v == 2{
                redWins()
            }
            else if A2v == 1 && B2v == 1 && C2v == 1{
                blueWins()
            }
            else if A2v == 2 && B2v == 2 && C2v == 2{
                redWins()
            }
            else if A3v == 1 && B3v == 1 && C3v == 1{
                blueWins()
            }
            else if A3v == 2 && B3v == 2 && C3v == 2{
                redWins()
            }
            else if A1v == 1 && B2v == 1 && C3v == 1{
                blueWins()
            }
            else if A1v == 2 && B2v == 2 && C3v == 2{
                redWins()
            }
            else if A3v == 1 && B2v == 1 && C1v == 1{
                blueWins()
            }
            else if A3v == 2 && B2v == 2 && C1v == 2{
                redWins()
            }
            else if A1v > 0 && A2v > 0 && A3v > 0 && B1v > 0 && B2v > 0 && B3v > 0 && C1v > 0 && C2v > 0 && C3v > 0{
            playerTurn = 3
                turnLabel.text = "Tie Game!"; AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    
            }
    }
    
    @IBAction func A1Button(_ sender: UIButton) {
        if playerTurn == 1 {
            checkBlueA() }
        else if playerTurn == 2 {
            checkRedA()
        }
        checkWinner()
    }
    
    
    @IBAction func A2Button(_ sender: UIButton) {
        if playerTurn == 1 {
            checkBlueA() }
        else if playerTurn == 2 {
            checkRedA()
        }
        checkWinner()
    }
    
    @IBAction func A3Button(_ sender: UIButton) {
        if playerTurn == 1 {
            checkBlueA() }
        else if playerTurn == 2 {
            checkRedA()
        }
        checkWinner()
    }
    
    @IBAction func B1Button(_ sender: UIButton) {
        if playerTurn == 1 {
            checkBlueB() }
        else if playerTurn == 2 {
            checkRedB()
        }
        checkWinner()
    }
    
    @IBAction func B2Button(_ sender: UIButton) {
        if playerTurn == 1 {
            checkBlueB() }
        else if playerTurn == 2 {
            checkRedB()
        }
        checkWinner()
    }
    
    @IBAction func B3Button(_ sender: UIButton) {
        if playerTurn == 1 {
            checkBlueB() }
        else if playerTurn == 2 {
            checkRedB()
        }
        checkWinner()
    }
    
    @IBAction func C1Button(_ sender: UIButton) {
        if playerTurn == 1 {
            checkBlueC() }
        else if playerTurn == 2 {
            checkRedC()
        }
        checkWinner()
    }
    
    @IBAction func C2Button(_ sender: UIButton) {
        if playerTurn == 1 {
            checkBlueC() }
        else if playerTurn == 2 {
            checkRedC()
        }
        checkWinner()
    }
    
    @IBAction func C3Button(_ sender: UIButton) {
        if playerTurn == 1 {
            checkBlueC() }
        else if playerTurn == 2 {
            checkRedC()
        }
        checkWinner()
    }
    
    
    
    
    
    
    @IBAction func button1(_ sender: UIButton) {
        if playerTurn == 1 {
         checkBlueA() }
        else if playerTurn == 2 {
            checkRedA()
             }
        checkWinner()
        
    }
    @IBAction func button2(_ sender: UIButton) {
        checkWinner()
        if playerTurn == 1 {
            checkBlueB() }
        else if playerTurn == 2 {
            checkRedB()
        }
    checkWinner()
}
    @IBAction func button3(_ sender: UIButton) {
        checkWinner()
        if playerTurn == 1 {
            checkBlueC() }
        else if playerTurn == 2 {
            checkRedC()
        }
    checkWinner()
}
    
    @IBAction func resetButton(_ sender: UIButton) {
        playerTurn = 1
        A1v = 0
        A2v = 0
        A3v = 0
        
        B1v = 0
        B2v = 0
        B3v = 0
        
        C1v = 0
        C2v = 0
        C3v = 0
        blueArrowsAll()
        turnLabel.text = "Blue's Turn"
       A1Button.setBackgroundImage(UIImage(named: "gray"), for: UIControl.State.normal)
        A2Button.setBackgroundImage(UIImage(named: "gray"), for: UIControl.State.normal)
        A3Button.setBackgroundImage(UIImage(named: "gray"), for: UIControl.State.normal)
        
        B1Button.setBackgroundImage(UIImage(named: "gray"), for: UIControl.State.normal)
        
        B2Button.setBackgroundImage(UIImage(named: "gray"), for: UIControl.State.normal)
        
        B3Button.setBackgroundImage(UIImage(named: "gray"), for: UIControl.State.normal)
        
        C1Button.setBackgroundImage(UIImage(named: "gray"), for: UIControl.State.normal)
        
        C2Button.setBackgroundImage(UIImage(named: "gray"), for: UIControl.State.normal)
        
        C3Button.setBackgroundImage(UIImage(named: "gray"), for: UIControl.State.normal)
        
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        
        audioPlayer1.stop()
        audioPlayer1.currentTime = 0
    }
    
    
}
