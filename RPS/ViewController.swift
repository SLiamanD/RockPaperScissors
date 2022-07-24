//
//  ViewController.swift
//  RPS
//
//  Created by Алексей Грачев on 12.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playAgain.isHidden = true
    }
    
    
    
    @IBOutlet weak var robotButton: UIButton!
    @IBOutlet weak var gameStatus: UIButton!
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var stackViewForBackground: UIStackView!
    
    
    @IBAction func actionRock(_ sender: UIButton) {
        play(.rock)
    }
    @IBAction func actiocPaper(_ sender: UIButton) {
        play(.paper)
    }
    @IBAction func actionScissors(_ sender: UIButton) {
        play(.scissors)
    }
    @IBAction func actionResetPlay(_ sender: Any) {
        func reset() {
            rock.isHidden = false
            paper.isHidden = false
            scissors.isHidden = false
            playAgain.isHidden = true
        }
        reset()
    }
    
    func play(_ sign: Sign) {
        let computerSign = randdomSign()
        robotButton.setTitle(computerSign.emoji, for: .normal)
        playAgain.isHidden = false
        
        switch sign {
        case .rock:
            rock.isHidden = false
            paper.isHidden = true
            scissors.isHidden = true
        case .scissors:
            rock.isHidden = true
            paper.isHidden = true
            scissors.isHidden = false
        case .paper:
            rock.isHidden = true
            paper.isHidden = false
            scissors.isHidden = true
            
        }
        
        let result = sign.getResult(for: computerSign)
        switch result {
        case .win:
            gameStatus.setTitle("You WIN!", for: .normal)

            
        case . lose:
            gameStatus.setTitle("You lose", for: .normal)

        default:
            gameStatus.setTitle("it's draw", for: .normal)
        }
        
    }

}

