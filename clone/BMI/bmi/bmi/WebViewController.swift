//
//  WebViewController.swift
//  bmi
//
//  Created by 이현호 on 2022/08/18.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet var webView: WKWebView!
    @IBOutlet var naverWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func naverButton(_ sender: UIButton) {
        guard let url = URL(string: "https://m.naver.com") else {return}
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    
    

   
}
