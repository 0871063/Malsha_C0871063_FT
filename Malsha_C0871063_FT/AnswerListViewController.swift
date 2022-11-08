//
//  MarkListViewController.swift
//  Malsha_C0871063_FT
//
//  Created by Malsha Lambton on 2022-11-07.
//

import UIKit

class AnswerListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var answerList : [Answer] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Answer List"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    // MARK: - TableView Delegation
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        answerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerTableViewCell",
                                                 for: indexPath) as! AnswerTableViewCell
        let answer = answerList[indexPath.row]
        cell.answerLabel?.text = answer.answer
        cell.answerImage?.image = answer.correctAnswer ? UIImage(named: "Correct") : UIImage(named: "InCorrect")
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
