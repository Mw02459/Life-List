//
//  ViewController.swift
//  QuizApp
//
//  Created by girlswhocode on 7/10/19.
//  Copyright © 2019 girlswhocode. All rights reserved.
//



import UIKit

class ViewController: UIViewController {
    
    func checkAnswer(choiceNo: Int) {
        if(choiceNo == currentQuestion!.correctAnswer) {
            score += 1
            loadNextQuestion()
        }
        else {
            loadNextQuestion()
        }
    }
    
    let backroundImageView = UIImageView()

    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var answer0: UIButton!
    
    @IBAction func handleSubmitanswer0(_ sender: Any) {
        checkAnswer(choiceNo: 0)
    }
    @IBOutlet weak var answer1: UIButton!
    
    @IBAction func handleSubmitanswer1(_ sender: Any) {
        checkAnswer(choiceNo: 1)
    }
    
    @IBAction func handleSubmitanswer2(_ sender: Any) {
        checkAnswer(choiceNo: 2)
    }
    @IBOutlet weak var answer2: UIButton!
   
    @IBOutlet weak var answer3: UIButton!
    
    @IBAction func handleSubmitanswer3(_ sender: Any) {
        checkAnswer(choiceNo: 3)
    }
   
    struct Question{
        let question: String
        let answerlist:[String]
        let correctAnswer: Int
        
    }
    
    var questions: [Question] = [
        Question(question: "Define Abstruse",
                 answerlist: ["hard to penetrate", "very difficult", "out of the ordinary", "stubbord"],
                 correctAnswer: 0),
        Question(question: "Define Contravene",
                 answerlist: ["to work together", "to go against rules", "to plot against someone", "to aid"],
                 correctAnswer: 1),
        Question(question: "Define Munificent",
                 answerlist: ["destructive/harmful", "extremely efficient/diligent", "commanding", "very generous"],
                 correctAnswer: 3),
        ]
    
    var currentQuestion: Question?
    var currentQuestionPosition: Int = 0
    var score: Int = 0
    
    func setQuestion() {
        QuestionLabel.text = currentQuestion!.question
        answer0.setTitle(currentQuestion!.answerlist[0], for: .normal)
        answer1.setTitle(currentQuestion!.answerlist[1], for: .normal)
        answer2.setTitle(currentQuestion!.answerlist[2], for: .normal)
        answer3.setTitle(currentQuestion!.answerlist[3], for: .normal)
    
    }
        func loadNextQuestion() {
            if ((currentQuestionPosition + 1) == questions.count) {
                performSegue(withIdentifier: "sgShowResults", sender: nil)
        }
            else {
            currentQuestionPosition += 1
            currentQuestion = questions[currentQuestionPosition]
            setQuestion()
        }
    }
    


   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setBackround()
        // Setup the question and reset currentQuestion
        currentQuestion = questions[0]
        setQuestion()
    }
    
    func setBackround() {
        view.addSubview(backroundImageView)
        backroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backroundImageView.image = UIImage(named: "sunflower")
        view.sendSubviewToBack(backroundImageView)

}
}


