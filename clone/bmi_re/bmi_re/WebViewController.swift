//
//  WebViewController.swift
//  bmi_re
//
//  Created by 이현호 on 2022/08/19.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet var lblWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btbNaver(_ sender: UIButton) {
        guard let url = URL(string: "https://m.naver.com") else {return}
        let request = URLRequest(url: url)
        lblWebView.load(request)
        
    }
    


}
