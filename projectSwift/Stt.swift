//
//  Stt.swift
//  OpenCameraTest
//
//  Created by MinCheolMac on 20/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit
import AVFoundation
import Speech

class Stt {
    
    public var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    public var recogntionTask: SFSpeechRecognitionTask?
    public let audioEngine = AVAudioEngine()
    let audioSession = AVAudioSession.sharedInstance()
    public let speechReconizer = SFSpeechRecognizer(locale: .init(identifier: "ko_KR"))
    
    //    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool, button:UIButton) {
    //        if available{
    //            button.isEnabled = true
    //            //code
    //        }else{
    //            button.isEnabled = false
    //            //code
    //        }
    //    }
    
    func startRecoding (botton : UIButton) {
        if recogntionTask != nil{
            recogntionTask?.cancel()
            recogntionTask = nil
        }
        do{
            try audioSession.setCategory(AVAudioSession.Category.playAndRecord, options: .mixWithOthers)
            try audioSession.setMode(AVAudioSession.Mode.measurement)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        }catch{
            print("오디오세션 에러")
        }
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        guard let inputNode: AVAudioNode  = audioEngine.inputNode else {fatalError("녹음장치가 없당")}
        
        guard let recognitionRequest = recognitionRequest else {fatalError("서버에 음성전달 못함ㅠㅠ")}
        
        recognitionRequest.shouldReportPartialResults = true
        
        recogntionTask = speechReconizer?.recognitionTask(with: recognitionRequest, resultHandler: {(result, Error) in
            var isFinal = false
            
            if result != nil{
                
                
                //result?.bestTranscription.formattedString를 원하는 형식에 저장
                isFinal = (result?.isFinal)!
            }
            if(Error != nil || isFinal) {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.recognitionRequest = nil
                self.recogntionTask = nil
                
            }
        })
        
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat){ (buffer, when) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        
        do{
            try audioEngine.start()
        }catch{
            print("에러때문에 오디오 엔진 실행 안된다능")
        }
        
        
    }
    
}
