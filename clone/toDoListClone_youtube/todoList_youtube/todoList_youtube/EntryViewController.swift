//
//  EntryViewController.swift
//  todoList_youtube
//
//  Created by 이현호 on 2022/11/03.
//

import UIKit

class EntryViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!
    
    var update: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))//selector 는 함수를 가져오는 기능?

        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        
        return true;
    }
    
    @objc func saveTask(){
        
        guard let text = field.text, !text.isEmpty else{
            return
        }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count") //count를 업데이트
        UserDefaults().set(text, forKey: "task_\(newCount)") //다시.. 아마 번호로 접근해서 데이터 변조 or 데이터 출력..
        
        update?()
        
        navigationController?.popViewController(animated: true)
        
        
    }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

