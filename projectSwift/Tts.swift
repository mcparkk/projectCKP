//
//  Tts.swift
//  opencvframeworktest
//
//  Created by Sunbin Kang on 21/06/2019.
//  Copyright © 2019 none. All rights reserved.
//


import UIKit
import Speech
import AVFoundation

class Tts {
    
    
    
    func speak(sentence : String){
        
        let synthesizer = AVSpeechSynthesizer()
        
        let utterance = AVSpeechUtterance(string : sentence)
        utterance.voice = AVSpeechSynthesisVoice(language : "ko-KR")
        utterance.rate = 0.4
        synthesizer.speak(utterance)
        
        
               
    }
}
