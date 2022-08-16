//
//  ViewController.swift
//  bmi
//
//  Created by 이현호 on 2022/08/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtHeight: UITextField!
    @IBOutlet var txtWeight: UITextField!
    @IBOutlet var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func calcBMI(_ sender: UIButton) {
        if(txtHeight.text == "" || txtWeight.text == ""){
            lblResult.textColor = UIColor(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            lblResult.text = "키와 체중을 모두 입력해주세요."
            return
        }
        else{
            let height = Double(txtHeight.text!)! // textfield.text => <String!> 형
            let weight = Double(txtWeight.text!)!
            print(height,weight)
            
            let bmi = weight/(height*height*0.0001)
            let shortenedBmi = String(format: "%.1f", bmi)
            var body = ""
            var color = UIColor.white
            
            if bmi >= 40 {
                body = "3단계 비만"
                color = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            } else if bmi >= 30 && bmi < 40 {
                body = "2단계 비만"
                color = UIColor(displayP3Red: 0.7, green: 0.0, blue: 0.0, alpha: 1.0)
            } else if bmi >= 25 && bmi < 30 {
                body = "1단계 비만"
                color = UIColor(displayP3Red: 0.4, green: 0.0, blue: 0.0, alpha: 1.0)
            } else if bmi >= 18.5 && bmi < 25 {
                body = "정상"
                color = UIColor(displayP3Red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
            } else {
                body = "저체중"
                color = UIColor(displayP3Red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
            }
            print("BMI:\(shortenedBmi), 판정:\(body)")
            lblResult.textColor = color
            lblResult.clipsToBounds = true
            lblResult.layer.cornerRadius = 7
            lblResult.text = "BMI:\(shortenedBmi)      판정:\(body)"
            
        }
        
        
    }
    

}

