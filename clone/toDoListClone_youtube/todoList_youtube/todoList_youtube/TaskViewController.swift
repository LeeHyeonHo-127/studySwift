//
//  TaskViewController.swift
//  todoList_youtube
//
//  Created by 이현호 on 2022/11/03.
//

import UIKit

class TaskViewController: UIViewController {
   
    var update: (() -> Void)?
    var index:Int?
    
    @IBOutlet var label: UILabel!
    
    var task: String?
    var newCount:Int!
    var changeIndex:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask(){
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
        
        print("count = %d",count)
        print("index = %d",index)
        changeIndex = index! + 2
        

        if(changeIndex > count){
            UserDefaults().set(count-1, forKey: "count")
        }else{
            for x in changeIndex...count {
                if let task = UserDefaults().value(forKey: "task_\(x)") as? String{
                    UserDefaults().set(task, forKey: "task_\(x-1)")
                }
            }
            UserDefaults().set(count-1, forKey: "count")
        }
    
        update?()

        navigationController?.popViewController(animated: true) //화면을 pop후 stack의 제일 하단에 위치한 ViewController를 화면에 보이게 설정

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
