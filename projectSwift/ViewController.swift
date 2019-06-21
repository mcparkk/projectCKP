//
//  ViewController.swift
//  projectSwift
//
//  Created by MinCheolMac on 21/06/2019.
//  Copyright © 2019 Mincheol park. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    var tts : Tts!
    
    override func viewDidLoad() {
        print("화면실행")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tts = Tts()
        tts.speak(sentence: "안녕하세요")
        
    }


}

