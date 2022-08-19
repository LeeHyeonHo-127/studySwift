//
//  ViewController.swift
//  bmi_re
//
//  Created by 이현호 on 2022/08/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bmiImage: UIImageView!
    @IBOutlet var lblResult: UILabel!
    @IBOutlet var txtWeight: UITextField!
    @IBOutlet var txtHeight: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func sexSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            bmiImage.image = UIImage(named: "womanBMIImage")
        }else{
            bmiImage.image = UIImage(named: "manBMIImage")
        }
    }
    @IBAction func calcButton(_ sender: UIButton) {
        if(txtHeight.text == "" || txtWeight.text == ""){
            lblResult.textColor = UIColor(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            lblResult.text = "키와 몸무게를 입력 해주세요"
        }
        else{
            let weight = Double(txtWeight.text!)!
            let height = Double(txtHeight.text!)!
            let bmi = weight / (height * height * 0.0001)
            let shortenedBmi = String(format: "%.1f", bmi)
            var body = ""
            var color = UIColor.white
            
            if bmi >= 30 {
                body = "3단계 비만"
                color = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            } else if bmi >= 25 && bmi < 30 {
                body = "2단계 비만"
                color = UIColor(displayP3Red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0)
            } else if bmi >= 23 && bmi < 25 {
                body = "1단계 비만"
                color = UIColor(displayP3Red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)
            } else if bmi >= 18.5 && bmi < 23 {
                body = "정상"
                color = UIColor(displayP3Red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
            } else {
                body = "저체중"
                color = UIColor(displayP3Red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
            }
            lblResult.textColor = color
            lblResult.text = "BMI : \(shortenedBmi), 판정 : \(body)"
            
        }
    }
    

}

