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
        //field의 delegate(대리자)를 EntryViewController로 지정
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))//selector 는 함수를 가져오는 기능?

        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //UITextFieldDelegate 프로토콜에 정의된 함수이다.
        //이후 연결된 item에 이벤트 발생시 함수가 실행되며, 필요한 작업이 진행 될 것이다
        //이 코드는 textField와 관련된 이벤트가 진행되면, task를 save하는 작업이 진행 될 것임을 예상할 수 있다.
        saveTask()
        
        return true
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
        UserDefaults().set(text, forKey: "task_\(newCount)") //newCount에 해당하는 UserDefaults의 값을 text로 set
        
        update?()
        
        navigationController?.popViewController(animated: true) //화면을 pop후 stack의 제일 하단에 위치한 ViewController를 화면에 보이게 설정
        
        
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

