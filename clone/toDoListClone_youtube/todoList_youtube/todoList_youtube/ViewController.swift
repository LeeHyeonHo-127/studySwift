//
//  ViewController.swift
//  todoList_youtube
//
//  Created by 이현호 on 2022/11/03.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet var tableView: UITableView!
    
    var tasks = [String]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tasks" //여기의 self는 누구를 가르키는 것 일까?
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        //setup
        //초기 저장 메커니즘. 하나도 저장 값이 없을 때 하는 작업
        if !UserDefaults().bool(forKey: "setup"){ //setup이 안되었을 경우
            UserDefaults().set(true, forKey: "setup")//setup을 true로 지정해주고
            UserDefaults().set(0, forKey: "count") //count = 0 으로 설정
        }
        //get all current saved data
        updateTasks()
}
    
    func updateTasks(){ // 메인 화면으로 돌아올 때 마다, count값 들을 조화히며 todo 리스트 출력기능.(?)
        
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
        
        for x in 0..<count {
            if let task = UserDefaults().value(forKey: "task_\(x+1)") as? String{
                tasks.append(task)
            }
        }
        
        tableView.reloadData()
        
    }
    @IBAction func didTapAdd(){ //add button이 눌렸을 때, EntryViewController 인스턴스를 불러와서 업데이트를 한다.
        let vc = storyboard?.instantiateViewController(identifier: "entry" ) as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)  //다시 공부하기
        
        //task를 클릭 했을 때 task의 화면으로 전환.
        let vc = storyboard?.instantiateViewController(identifier: "task" ) as! TaskViewController
        vc.title = "New Task"
        vc.task = tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell;
        
    }
    
}

