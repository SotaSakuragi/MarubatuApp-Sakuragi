//
//  SecondViewController.swift
//  MarubatuApp
//
//  Created by 櫻木颯大 on 2023/09/04.
//

import UIKit

class SecondViewController: UIViewController {
    var questions: [[String: Any]] = []
    var answer = false
    
    
    @IBOutlet weak var textView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard
        //"add"というキーで保存された値がなにかある -> 値をtaskArrayへ
        if userDefaults.object(forKey: "add") != nil {
            questions = userDefaults.object(forKey: "add") as! [[String: Any]]
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func topButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func marubatuSeg(_ sender: Any) {
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0:
            answer = false
        case 1:
            answer = true
        default:
            break
        }
    }
    
    @IBAction func setButton(_ sender: Any) {
        if textView.text != "" {
            if let newText = textView.text {
                var newQuestions: [String: Any] = [:]
                newQuestions["question"] = newText
                newQuestions["answer"] = answer
                questions.append(newQuestions)
                textView.text = ""
                print(questions)
                let userDefaults = UserDefaults.standard
                userDefaults.set(questions, forKey: "add")
            }
        } else {
            showAlert(title: "空です", message: "問題が入力されてません")
        }
        
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        questions = []
        let userDefaults = UserDefaults.standard
        userDefaults.set(questions, forKey: "add")
        showAlert(title: "削除！！", message: "問題が削除されました")
        
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert) // 表示作成
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)           // ボタン作成
        alert.addAction(alertAction)                                                          // 表示にボタンを追加
        present(alert, animated: true)                                                        // 画面に表示
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
