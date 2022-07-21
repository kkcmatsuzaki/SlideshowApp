//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 松﨑 祐太 on 2022/07/21.
//

import UIKit

class ViewController: UIViewController {

    let images = [
        "food_fried_garlic",
        "food_fried_onion",
        "food_perimeni",
    ]
    var index = 0
    var timer: Timer!
    var timer_sec: Float = 2

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:))))
    }

    @objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "toNext", sender: nil)
    }

    @IBAction func next(_ sender: Any) {
        if index == images.count-1 {
            index = 0
        } else {
            index += 1
        }
        imageView.image = UIImage(named: images[index])
    }
    @IBAction func back(_ sender: Any) {
        if index == 0 {
            index = images.count - 1
        } else {
            index -= 1
        }
        imageView.image = UIImage(named: images[index])
    }
    @IBAction func startStop(_ sender: Any) {
        if self.timer == nil {
            nextButton.isEnabled = false
            backButton.isEnabled = false
            startStopButton.setTitle("停止", for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        } else {
            nextButton.isEnabled = true
            backButton.isEnabled = true
            startStopButton.setTitle("再生", for: .normal)
            self.timer.invalidate()
            self.timer = nil
        }
    }
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec -= 0.1
        if self.timer_sec <= 0 {
            next(self)
            self.timer_sec = 2
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController2
        vc.name = images[index]
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

