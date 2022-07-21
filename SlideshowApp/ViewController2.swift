//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 松﨑 祐太 on 2022/07/21.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var bigImageView: UIImageView!
    var name: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let name = name {
            bigImageView.image = UIImage(named: name)
        }
    }
}

