//
//  ViewController.swift
//  projectSwift
//
//  Created by MinCheolMac on 21/06/2019.
//  Copyright © 2019 Mincheol park. All rights reserved.
//

import UIKit
import AVFoundation
import Speech

class ViewController: UIViewController, SFSpeechRecognizerDelegate{
    
    var tts = Tts()
    var stt = Stt()
    var string : String!
    
    
    
    
    @IBOutlet var btn: UIButton!
    
    override func viewDidLoad() {
        print("화면실행")
        super.viewDidLoad()
        stt.speechReconizer?.delegate = self
        
    }
    
    
    
    
    
    @IBAction func btnClick(_ sender: Any) {
        
        if stt.audioEngine.isRunning{
            stt.audioEngine.stop()
            stt.recognitionRequest?.endAudio()
            btn.isEnabled = false
            btn.setTitle("인식", for: .normal)
        }else{
            
            btn.setTitle("인식중", for: .normal)
            
        }
        
    }
}




