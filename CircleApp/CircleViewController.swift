//
//  CircleViewController.swift
//  CircleApp
//
//  Created by 김병철 on 2021/05/08.
//

import Foundation
import UIKit

class CircleViewController: UIViewController {

    @IBOutlet weak var object: UIView!
    @IBOutlet weak var animationToggle: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        reset()
    }
    
    @IBAction func animationToggle(_ sender: UISwitch) {
        sender.isOn ? start() : reset()
    }
    
    private func start() {
        var frame = object.frame
        frame.origin = CGPoint(x: 100, y: 400)
        frame.size = CGSize(width: 200, height: 200)
        
        UIView.animate(withDuration: 1.0, animations: {
            //하나만 가능한게 아니고 동시에 여러개의 속성의 애니메이션이 가능하다
            self.object.frame = frame
            self.object.alpha = 0.5
            self.object.backgroundColor = .magenta
        }, completion: { finished in
            UIView.animate(withDuration: 1.0) {
                
                self.reset()
            }
        })
        
    }
    
    private func reset() {
        object.frame = CGRect(x: 50, y: 150, width: 50, height: 50)
        object.alpha = 1.0
        object.backgroundColor = UIColor.yellow
    }
    
}
