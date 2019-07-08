//
//  ViewController.swift
//  RPS2
//
//  Created by byteCode on 11/06/2019.
//  Copyright © 2019 Григорий Пигаев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var robotButton: UIButton!
    @IBOutlet weak var statusLable: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetButton.isHidden = true
        
    }
    
    func play(_ sign: Sign) {
        let computerSign = randomSing()
        robotButton.setTitle(computerSign.emoji, for: .normal)
        
        switch sign {
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
        resetButton.isHidden = false
        
        
        let result = sign.takeTurn(_oposite: computerSign)
        
        switch result {
        case .win:
        statusLable.text = "You WIN!"
            self.view.backgroundColor = UIColor.green
        case .start:
            reset()
        case .lose:
            statusLable.text = "You LOSE!"
            self.view.backgroundColor = UIColor.red
        case .draw:
            statusLable.text = "It's a DRAW"
            self.view.backgroundColor = UIColor.blue
        }
    }
    
    func reset(){
        statusLable.text = "Rock, Paper, Scissors?"
        self.view.backgroundColor = UIColor.white
        robotButton.isHidden = false
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        resetButton.isHidden = true
        
    }
    
    // MARK: - IBAction
    
    @IBAction func rockButtonPressed(_ sender: Any) {
        play(.rock)
    }
    
    
    @IBAction func paperButtonPressed(_ sender: Any) {
        play(.paper)
    }
    
    
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        play(.scissors)
    }
    
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        reset()
        
    }
    
    @IBAction func robotButtonPressed(_ sender: Any) {
        
    }
    
    
}




