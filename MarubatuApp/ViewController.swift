//
//  ViewController.swift
//  MarubatuApp
//
//  Created by 櫻木颯大 on 2023/09/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    var currentQuestionNum: Int = 0
    
    let questions: [[String: Any]] = [
            [
                "question": "iPhoneアプリを開発する統合環境はZcodeである",
                "answer": false
            ],
            [
                "question": "Xcode画面の右側にはユーティリティーズがある",
                "answer": true
            ],
            [
                "question": "UILabelは文字列を表示する際に利用する",
                "answer": true
            ]
        ]
    
    func showQuestion() {
        let question = questions[currentQuestionNum]
        if let que = question["question"] as? String {
            questionLabel.text = que
        }
    }
    
    func checkAnswer(yourAnswer: Bool) {
        let question = questions[currentQuestionNum]
        if let ans = question["answer"] as? Bool {
            if yourAnswer == ans {
                currentQuestionNum += 1
                showAlert(message: "正解")
            } else {
                showAlert(message: "不正解")
            }
        }
        
        if currentQuestionNum >= questions.count {
            currentQuestionNum = 0
        }
        showQuestion()
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedNoButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
    }
    
    @IBAction func tappedYesButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
        
    }
    
    
}

