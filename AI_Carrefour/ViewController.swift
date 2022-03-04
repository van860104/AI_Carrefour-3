//
//  ViewController.swift
//  AI_Carrefour
//
//  Created by zeze on 2022/3/2.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let session = AVAudioSession.sharedInstance()
    // 錄音用
    var audioRecorder: AVAudioRecorder?
    // 播放用
    var audioPlayer: AVAudioPlayer?
    // 設定錄音檔路徑與檔名
    let tmpURL = URL(fileURLWithPath: NSTemporaryDirectory() + "audio.ima4")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(tmpURL.absoluteString)
        // 設定錄音品質
        let audioSettings = [
            AVFormatIDKey: NSNumber(value: kAudioFormatMPEG4AAC)
        ]
        
        do {
            try session.setCategory(.playAndRecord, mode: .measurement, options: [])
            try session.setActive(true)
            
            audioRecorder = try AVAudioRecorder(url: tmpURL, settings: audioSettings)
        } catch {
            print(error)
        }
    }

    
    @IBAction func recordAudio(_ sender: Any) {
        guard audioRecorder != nil else {
                      return
                  }
                  
                  if audioRecorder!.record() {
                      print("開始錄音")
                  }
    
    }
    
  

    
      
    
}

