//
//  ViewController.swift
//  audioRecorder
//
//  Created by WANKI KIM on 2020/01/27.
//  Copyright © 2020 WANKI KIM. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate, UITableViewDelegate, UITableViewDataSource {
    var recordingSession:AVAudioSession!
    var audioRecorder:AVAudioRecorder!
    var audioPlayer:AVAudioPlayer!
    @IBOutlet weak var myTableView: UITableView!
    var numberOfRecords:Int = 0
    @IBOutlet weak var buttonLabel: UIButton!
    @IBAction func record(_ sender: Any)
    {
        //Check if we have an active recoder
        if audioRecorder == nil
        {
            numberOfRecords += 1
            let filename  = getDirectory().appendingPathComponent("\(numberOfRecords).m4a")
            
            let settings = [AVFormatIDKey : Int(kAudioFormatMPEG4AAC), AVSampleRateKey: 12000, AVNumberOfChannelsKey: 1, AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
            //Start audio recording
            do
            {
               audioRecorder = try AVAudioRecorder(url: filename, settings: settings)
                audioRecorder.delegate = self
                audioRecorder.record()
                
                buttonLabel.setTitle("Stop Recording" , for: .normal)
           }
           catch
           {
                displayAlert(title: "Oops", message: "Recording failed")
           }
        }
        else{
            //Stop audio recording
            audioRecorder.stop()
            audioRecorder = nil
            
            //
            UserDefaults.standard.set(numberOfRecords, forKey: "myNumber")
            myTableView.reloadData()
            buttonLabel.setTitle("Start Recording", for: .normal)
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Setting up session
        recordingSession = AVAudioSession.sharedInstance()
        
        if let number:Int = UserDefaults.standard.object(forKey: "myNumber") as? Int{
            numberOfRecords = number
        }
        AVAudioSession.sharedInstance().requestRecordPermission { (hasPermission) in
            if hasPermission{
                print ("ACCEPT")
            }
        }
        // 실행상 조금 문제가 있는 듯 하지만, 녹음 기능은 확실히 되는 것 같다.
//        if (recordingSession.responds(to: #selector(AVAudioSession.requestRecordPermission(_:)))) {
//                   AVAudioSession.sharedInstance().requestRecordPermission({(granted: Bool)-> Void in
//                       if granted {
//
//
//                           print("granted")
//
//                           do {
//                            try self.recordingSession.setCategory(AVAudioSession.Category.playAndRecord)
//                               try self.recordingSession.setActive(true)
//                           }
//                           catch {
//
//                               print("Couldn't set Audio session category")
//                           }
//                       } else{
//                           print("not granted")
//                       }
//                   })
//               }
    }

    //function that get path to directory
    func getDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory
    }
    //function that display an alert
    func displayAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"dismiss", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    //Setting up table view//
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRecords
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row + 1)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let path = getDirectory().appendingPathComponent("\(numberOfRecords + 1).m4a")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: path)
            audioPlayer.play()
        }
        catch
        {
            
        }
    }
    
}

