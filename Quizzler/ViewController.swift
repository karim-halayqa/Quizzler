//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestion = questionBank()
    
    var pickedAnswer:Bool = false
    
    var questionNumber:Int = 0
    
    var score:Int = 0
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       nextQuestion()
        
    }
    


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()
  
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
      
    }
    

    func nextQuestion() {
        
        if questionNumber <= 12 {
            
            questionLabel.text = allQuestion.list[questionNumber].questionText
            updateUI()
        }
        
        else {
            
            print("end of quiz")
            questionNumber = 0
            let alert = UIAlertController(title: "Congratulations, You Are Done!", message: "Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        
        
  
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestion.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Correct")
            score += 1
            
        }
        else {
            ProgressHUD.showError(" Wrong")
        }
        
        
    }
    
    
    func startOver() {
        
        questionNumber = 0
        score = 0
        nextQuestion()
       
    }
    

    
}