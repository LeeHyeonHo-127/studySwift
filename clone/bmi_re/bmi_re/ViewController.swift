//
//  ViewController.swift
//  bmi_re
//
//  Created by 이현호 on 2022/08/19.
//

import UIKit

//MARK: - Class - ViewController
///**Class TodoListViewController**
///- note: UIViewController 클래스
///- authors: 이현호
class ViewController: UIViewController {
    
    //MARK: 변수 설정
    @IBOutlet var bmiImage: UIImageView!
    @IBOutlet var lblResult: UILabel!
    @IBOutlet var txtWeight: UITextField!
    @IBOutlet var txtHeight: UITextField!
    
    ///**앱을 화면에 들어오면 처음 실행시키는 함수**
    ///- note:
    ///- parameters:
    ///- returns:
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    //MARK: 메서드 선언
    ///**segment 설정에 따라 bmiImage객체를 변환하는 함수**
    ///- note: segment 값 변화에 따라 bmiImage 의 이미지를 변환한다.
    ///- parameters: UISegmentedContol
    ///- returns:
    @IBAction func sexSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            bmiImage.image = UIImage(named: "womanBMIImage")
        }else{
            bmiImage.image = UIImage(named: "manBMIImage")
        }
    }
    
    ///**BMI 값 계산을 시작하는 함수**
    ///- note: 버튼이 눌렸을 시, 키와 몸무게의 값이 입력되어 있다면 BMI를 계산한다.
    ///- parameters: UIButton
    ///- returns:
    @IBAction func calcButton(_ sender: UIButton) {
        if(txtHeight.text == "" || txtWeight.text == ""){ //키와 몸무게 값이 둘 다 있지 않을 경우 재입력 문장 출력.
            lblResult.textColor = UIColor(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            lblResult.text = "키와 몸무게를 입력 해주세요"
        }
        else{ //BMI 계산. 각 단계에 따라 글씨 색 변환.
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

