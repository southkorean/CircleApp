//
//  KeyframeViewController.swift
//  CircleApp
//
//  Created by 김병철 on 2021/05/08.
//

import Foundation
import UIKit

class KeyframeViewController: UIViewController {
    @IBOutlet weak var objectView: UIView!
    
    func animate1() {
        let targetFrame = CGRect(x: view.center.x - 50, y: view.center.y - 50, width: 200, height: 200)
        objectView.frame = targetFrame   }
    func animate2() {     objectView.alpha = 0.0   }
    func animate3() {     let targetFrame = CGRect(x: 250, y: 200, width: 50, height: 50)
        objectView.frame = targetFrame
        objectView.alpha = 1.0   }
    
    @IBAction func animate(_ sender: Any) {
        
        UIView.animateKeyframes(withDuration: 5.0, delay: 0, options: [], animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                                        self.animate1()       }
                                    UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3) {
                                        self.animate2()       }
                                    UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                                        self.animate3()       }     }, completion: nil)   }
    
    
    
}
