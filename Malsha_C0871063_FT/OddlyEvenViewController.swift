//
//  ViewController.swift
//  Malsha_C0871063_FT
//
//  Created by Malsha Lambton on 2022-11-07.
//

import UIKit

class OddlyEvenViewController: UIViewController {

    @IBOutlet weak var answerImage: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var evenNumberTap: UIButton!
    @IBOutlet weak var oddNumberTap: UIButton!
    
    var answerList : [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        startGame()
    }

    @IBAction func evenNumberBtnTap() {
        oddNumberTap.isEnabled = false
        evenNumberTap.isEnabled = false
        
        let selectedNumber = Int(numberLabel.text ?? "") ?? 0
        let isEven = checkEvenNumber(number: selectedNumber)
        var evenOrOdd = "is Even"
        let answer  = (numberLabel.text ?? "") + " " + evenOrOdd
        var correctAnswer : Bool
        if isEven {
            answerImage.image = UIImage(named: "Correct")
            correctAnswer = true
        }else{
            evenOrOdd = "is Odd"
            answerImage.image = UIImage(named: "InCorrect")
            correctAnswer = false
        }
        appendAnswer(answer: answer, correctAnswer: correctAnswer)
        displayAlert(answer: evenOrOdd, correctAnswer: correctAnswer)
    }
    
    @IBAction func oddNumberBtnTap() {
        oddNumberTap.isEnabled = false
        evenNumberTap.isEnabled = false
        let selectedNumber = Int(numberLabel.text ?? "") ?? 0
        let isEven = checkEvenNumber(number: selectedNumber)
        var evenOrOdd = "is Odd"
        let answer  = (numberLabel.text ?? "") + " " + evenOrOdd
        var correctAnswer : Bool
        if isEven {
            answerImage.image = UIImage(named: "InCorrect")
            evenOrOdd = "is Even"
            correctAnswer = false
        }else{
            answerImage.image = UIImage(named: "Correct")
            correctAnswer = true
        }
        appendAnswer(answer: answer, correctAnswer: correctAnswer)
        displayAlert(answer: evenOrOdd, correctAnswer: correctAnswer)
    }
    
    private func appendAnswer(answer : String, correctAnswer : Bool) {
        let givenAnswer = Answer(answer: answer, correctAnswer: correctAnswer)
        answerList.append(givenAnswer)
    }
    
    private func startGame(){
        oddNumberTap.isEnabled = true
        evenNumberTap.isEnabled = true
        answerImage.image = nil
        let randomInt = Int.random(in: 0..<1000)
        numberLabel.text = String(randomInt)
    }
    
    private func checkEvenNumber(number : Int) -> Bool {
        
        if number % 2 == 0 {
            return true
        }else{
            return false
        }
    }
    
    private func displayAlert(answer : String, correctAnswer : Bool){
        var message = ""
        if correctAnswer {
            message = "Your answer is correct..."
        }else{
            message = "Oops...Wrong answer... \n Correct answer " + answer
        }
        
        let alert = UIAlertController(title: "Result", message: message, preferredStyle: .alert)
        let showProgressAction = UIAlertAction(title: "Show Progress", style: .default, handler: {_ in
            self.navigateAnswerList()
        })
        let playAgainAction = UIAlertAction(title: "Play Again!", style: .default, handler: {_ in
            self.startGame()
        })
        alert.addAction(playAgainAction)
        alert.addAction(showProgressAction)

        self.present(alert, animated: true)
    }
    
    private func navigateAnswerList() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let answerListController = storyboard.instantiateViewController(withIdentifier: "AnswerListViewController") as! AnswerListViewController
        answerListController.answerList = self.answerList
        navigationController?.pushViewController(answerListController, animated: true)
    }

}

