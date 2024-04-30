//
//  ViewController.swift
//  iKid
//
//  Created by vinh on 4/29/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var goodLabel: UILabel!
    @IBOutlet weak var punLabel: UILabel!
    @IBOutlet weak var dadLabel: UILabel!
    @IBOutlet weak var kkLabel: UILabel!
    
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var punButton: UIButton!
    @IBOutlet weak var dadButton: UIButton!
    @IBOutlet weak var kkButton: UIButton!
    
    let jokes : [String: [String]] = [
        "Good": ["Why did the chicken cross the road?", "To get to the other side 🤣🤣🤣"],
        "Pun": ["I went on a date with a girl, but she said I was a 5/10", "I thought that was mean"],
        "Dad": ["Why are balloons so expensive nowadays?", "Inflation"],
        "Knock Knock": ["Knock knock", "Who's there?", "To", "To who?", "It's actually 'to whom'"]
    ]
    
    var kkCount : Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        switch self.title {
        case "Good":
            goodLabel.text = jokes["Good"]![0]
            goodButton.isHidden = false
        case "Pun":
            punLabel.text = jokes["Pun"]![0]
            punButton.isHidden = false
        case "Dad":
            dadLabel.text = jokes["Dad"]![0]
            dadButton.isHidden = false
        case "Knock Knock":
            kkCount = 1
            kkLabel.text = jokes["Knock Knock"]![0]
            kkButton.isHidden = false
        default:
            break
        }
    }
    
    func updateLabel() {
        switch self.title {
        case "Good":
            goodLabel.text = jokes["Good"]![1]
        case "Pun":
            punLabel.text = jokes["Pun"]![1]
        case "Dad":
            dadLabel.text = jokes["Dad"]![1]
        case "Knock Knock":
            kkLabel.text = jokes["Knock Knock"]![kkCount]
            kkCount += 1
        default:
            break
        }
        
    }
    
    @IBAction func transitionPunchline(_ sender: UIButton) {
        let label : UILabel
        
        switch self.title {
        case "Good":
            label = goodLabel
            sender.isHidden = true
        case "Pun":
            label = punLabel
            sender.isHidden = true
        case "Dad":
            label = dadLabel
            sender.isHidden = true
        case "Knock Knock":
            label = kkLabel
            if kkCount == 4 {
                sender.isHidden = true
            }
        default:
            label = goodLabel
            break
        }
        
        UIView.transition(with: label, duration: 1, options: .transitionFlipFromLeft, animations: { self.updateLabel() }, completion: nil)
        
    }
    

}

