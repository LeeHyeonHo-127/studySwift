//
//  ViewController.swift
//  todoList_youtube
//
//  Created by 이현호 on 2022/11/03.
//

import UIKit


//MARK: - Class - ViewController
///**Class ViewController**
///- note: UIViewController 클래스
///- authors: 이현호
class ViewController: UIViewController {
  
    @IBOutlet var tableView: UITableView!
    
    var tasks = [String]()
        
    ///**func viewDidLoad**
    ///- note: 화면 출력시키기 전 실핼시키는 함수. 기본 설정을 세팅한다,
    ///- authors: 이현호
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tasks" //viewController의 id를 지정
        
        tableView.delegate = self //table의 delegate기능을 구현하기 위해선 필요한 작업. delegate pattern 관련 되어 있음. 추후 깊은 공부 필요
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
    
    func updateTasks(){ //UserDefaults를 통해 count를 조회, count에 해당하는 task들을 tableView에 출력하는 함수
        
        tasks.removeAll() //tasks가 삭제 되었을 가능성이 있으므로 배열을 지운다.
        
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
        navigationController?.pushViewController(vc, animated: true)//EntryViewController 를 push해서 제일 화면 상단에 보이게 설정
    }
    

}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //tableView내의 모든 cell을 선택해제하겠다는 메소드.
        // 특정 cell 선택시 생기는 음영을 모두 해제한 상태로 만들겠다는 의미이다.
        
        //task를 클릭 했을 때 task의 화면으로 전환.
        //cell click이 어디에 있지.?? -> cell click이 아니라 tableView 에서 채택한 UITableViewDelegates의 함수에서 구현한 기능
        let vc = storyboard?.instantiateViewController(identifier: "task" ) as! TaskViewController
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }

        vc.task = tasks[indexPath.row]
        vc.index = indexPath.row
        navigationController?.pushViewController(vc, animated: true)//ViewController가 push됐을 시 taskViewController 로 이동
        
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    //tableview의 row의 section수를 정해주는 것이다.
    //task와 cell이 서로 대응되기에 cell 하나하나를 각각의 row section으로 나눠질 수 있게 돕는다
    //예를 들어 tasks 배열의 요소 개수가 5개라면 5개의 section으로 나눠줄 것이다.
    
     
    //TableViewCell을 받아 texts의 String 값을 cell에 넣는 함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell;
    }
    
}

