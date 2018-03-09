//
//  ViewController.swift
//  iOS Example
//
//  Created by Joseph Kalash on 2/15/18.
//  Copyright © 2018 Joseph Kalash. All rights reserved.
//

import UIKit
import Croc

class ViewController: UIViewController {

    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var emojiDescriptionLabel : UILabel!
    @IBOutlet var groupSelector: UISegmentedControl!
    @IBOutlet var groupNameLabel: UILabel!
    
    @IBOutlet weak var refPNGImage: UIImageView!
    
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
            let groupType = Croc.groupTypes[self.groupSelector.selectedSegmentIndex]
            
            let randEmoji = Croc.emojis(for: groupType).randomElement()!
            self.emojiLabel.text = String(randEmoji)
            self.emojiDescriptionLabel.text = randEmoji.emojiDescription?.uppercased()
            
        }
        
        refPNGImage.image = String("👨🏾‍🌾")[0].png(ofSize: 8.0)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer?.invalidate()
    }

    @IBAction func changedGroup(sender: AnyObject) {
        groupNameLabel.text = Croc.groupTypes[groupSelector.selectedSegmentIndex].rawValue
    }
    
}

extension Collection where Index == Int {
    
    /**
     Picks a random element of the collection.
     
     - returns: A random element of the collection.
     */
    func randomElement() -> Iterator.Element? {
        return isEmpty ? nil : self[Int(arc4random_uniform(UInt32(endIndex)))]
    }
    
}
