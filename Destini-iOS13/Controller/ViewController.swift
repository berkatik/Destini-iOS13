//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateQuestion()
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        storyBrain.nextDestination(userAnswer)
        
        sender.alpha = 0.5
        
        Timer.scheduledTimer(timeInterval:0.2, target:self, selector:#selector(updateQuestion), userInfo:nil, repeats: false)
    }
    

    
    @objc func updateQuestion() {
        storyLabel.text = storyBrain.getQuestionDesc()
        choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
        
        choice1Button.alpha = 1.0
        choice2Button.alpha = 1.0
    }

}

