
import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var queue = AVQueuePlayer()
    var items = [AVPlayerItem]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player1?.delegate = self
        player2?.delegate = self
        player3?.delegate = self
        
        let asset1 = AVPlayerItem(url: url1)
        let asset2 = AVPlayerItem(url: url2)
        let asset3 = AVPlayerItem(url: url3)
        let asset4 = AVPlayerItem(url: url4)
        
        items = [asset1, asset2, asset3, asset4]
        
        queue = AVQueuePlayer(items: items)
        for item in queue.items() {
            NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd(notification:)), name: .AVPlayerItemDidPlayToEndTime, object: item)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let music1 = Bundle.main.bundleURL.appendingPathComponent("music1.mp3")
    let music2 = Bundle.main.bundleURL.appendingPathComponent("music2.mp3")
    let music3 = Bundle.main.bundleURL.appendingPathComponent("music3.mp3")
    let music4 = Bundle.main.bundleURL.appendingPathComponent("music4.mp3")

    
    
    let url1 = Bundle.main.bundleURL.appendingPathComponent("music1.mp3")
    let url2 = Bundle.main.bundleURL.appendingPathComponent("music2.mp3")
    let url3 = Bundle.main.bundleURL.appendingPathComponent("music3.mp3")
    let url4 = Bundle.main.bundleURL.appendingPathComponent("music4.mp3")


    @IBOutlet weak var yourButton1: customButton!
    @IBOutlet weak var yourButton2: customButton!
    @IBOutlet weak var yourButton3: customButton!
    @IBOutlet weak var yourButton4: customButton!
    
    
    
    fileprivate var player1:AVAudioPlayer?
    fileprivate var player2:AVAudioPlayer?
    fileprivate var player3:AVAudioPlayer?

    
    
    @IBAction func pushButton1(_ sender: UIButton) {
        //audioPlayer3(url: url1, url2: url2)
        sender.isSelected = true
        queue.play()
    }
    
    @IBAction func pushButton2(sender: UIButton) {
        audioPlayer1(url: url1)
    }
    
    @IBAction func pushButton3(sender: UIButton) {
        audioPlayer2(url: url2)
    }
    
    
    @IBAction func pushButton4(_ sender: UIButton) {
    }


    
        func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
            if (player === player1) {
                yourButton2.isSelected = false
            } else if (player === player2) {
                yourButton3.isSelected = false
            }
        }
    
    
    func playerItemDidReachEnd(notification: NSNotification) {
        
        if notification.object as? AVPlayerItem == items[0] {
            yourButton1.isSelected = false
            yourButton2.isSelected = true
        }
        
        if notification.object as? AVPlayerItem == items[1] {
            yourButton2.isSelected = false
            yourButton3.isSelected = true
        }
        
        if notification.object as? AVPlayerItem == items[2] {
            yourButton3.isSelected = false
            yourButton4.isSelected = true
            //yourButton1.isSelected = true
        }
        
        if notification.object as? AVPlayerItem == items[3] {
            yourButton4.isSelected = false
            print("item 3")
        }
        
//        if let theQueue = notification.object  {
//            
//        }
//        yourButton1.isSelected = false
//        print("hello there")
    }
    
    
    func audioPlayer1(url: URL) {
        do {
            try player1 = AVAudioPlayer(contentsOf:url)
            player1!.play()
            yourButton2.isSelected = true
            player1!.delegate = self
        } catch {
            print(error)
        }
    }
    
    func audioPlayer2(url: URL) {
        do {
            try player2 = AVAudioPlayer(contentsOf:url)
            player2!.play()
            yourButton3.isSelected = true
            player2!.delegate = self
            
        } catch {
            print(error)
        }
    }

}



