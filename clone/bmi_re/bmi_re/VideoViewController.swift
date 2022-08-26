//
//  VideoViewController.swift
//  bmi_re
//
//  Created by 이현호 on 2022/08/19.
//

import UIKit
import AVKit


//MARK: - Class - VideoViewController
///**Class VideoViewController**
///- note: VideoViewController 클래스
///- authors: 이현호
class VideoViewController: UIViewController {

    ///**화면에 들어오면 처음 실행시키는 함수**
    ///- note:
    ///- parameters:
    ///- returns:
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: 메서드 설정
    ///**지정된 비디오를 재생시켜주는(영상 화면으로 이동하는) 함수**
    ///- note:
    ///- parameters: UIButton
    ///- returns:
    @IBAction func videoPlay(_ sender: UIButton) {
        let file: String? = Bundle.main.path(forResource: "whatIsBMI", ofType: "mp4")
        let url = NSURL(fileURLWithPath: file!)
        let playerController = AVPlayerViewController()
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        self.present(playerController, animated: true)
        player.play()
        
        
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
