//
//  ViewController.swift
//  FirsNewApp
//
//  Created by 노민우 on 2022/12/28.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    // viewDidLoad() 위에 생성했기 때문에 자동으로 Outlet로 생성
    @IBOutlet weak var slider: UISlider!
    weak var timer: Timer?
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI(){
        mainLabel.text = "초를 선택하세요"
        // 슬라이더 가운데 설정
        slider.value = 0.5
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        // slider의 벨류값을 가지고 main lable의 text를 setting
        // 1초씩 지나갈때마다 무언가를 실행
        let seconds = Int(slider.value * 60)
        mainLabel.text = "\(seconds) 초"
        number = seconds
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 지정한 초에서 1초씩 감소되는 기능
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in // [self] 를 사용하면 밑에서 코드(클로저 안에)를 작성할때 self를 붙여주지 않아도 된다.
            // do something here
            // 반복을 하고 싶은 코드
            
            if number > 0 {
                number -= 1 //  weak self 라고 선언이 돼어있으면 self? 해야한다.
                slider.value = Float(number) / Float(60)// 숫자를 개산해줘야함
                mainLabel.text = "\(number)"
            } else { // number가 0 보다 작으면 소리나게
                number = 0
                mainLabel.text = "초를 선택해야한다."
                timer?.invalidate()
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }
           
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        // reset 시 슬라이더 가운데 설정
        // slider.setValue(0.5, animated: true)
        // slider.value = 0.5
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }
    
}

