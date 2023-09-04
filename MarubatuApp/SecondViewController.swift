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
        if let newText = textView.text {
        let newQuestions: [String: Any] = ["question": newText]
            questions.append(newQuestions)
            questions.append(["answer": answer])
            textView.text = ""
            print(questions)
        }
        
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        questions.isEmpty
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
