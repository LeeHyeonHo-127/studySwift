//
//  WebViewController.swift
//  bmi_re
//
//  Created by 이현호 on 2022/08/19.
//

import UIKit
import WebKit


//MARK: - Class - WebViewController
///**Class WebViewController**
///- note: WebViewController 클래스
///- authors: 이현호
class WebViewController: UIViewController {

    //MARK: 변수 설정
    @IBOutlet var lblWebView: WKWebView!
    
    ///**화면에 들어오면 처음 실행시키는 함수**
    ///- note:
    ///- parameters:
    ///- returns:
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: 메서드 설정
    ///**버튼이 눌리면 지정된 웹페이지를 띄우는 함수**
    ///- note: 버튼이 눌리면 네이버 웹 사이트를 WebView Label에(lblWebView)에 띄운다
    ///- parameters:UIButton
    ///- returns:
    @IBAction func btbNaver(_ sender: UIButton) {
        guard let url = URL(string: "https://m.naver.com") else {return}
        let request = URLRequest(url: url)
        lblWebView.load(request)
        
    }
    


}
