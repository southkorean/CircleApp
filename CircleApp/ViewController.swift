//
//  ViewController.swift
//  CircleApp
//
//  Created by 김병철 on 2021/05/08.
//

import UIKit

class ViewController: UIViewController {

    //cause 'merica
        var colorView = UIView()
        var button = UIButton()

        var colorViewWidth : NSLayoutConstraint!
        var colorViewHeight : NSLayoutConstraint!

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.




            //button for action
//            button = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width - 20, height: 50))
//            button.center = self.view.center
//            button.center.y = self.view.bounds.height - 20
//            button.addTarget(self, action: #selector(ViewController.pressed(sender:)), for: .touchUpInside)
//            button.setTitle("Animate", for: .normal)
//            button.setTitleColor(.blue, for: .normal)
//
//            self.view.addSubview(button)
            self.circle()
            self.pressed()


        }
    func circle(){
        colorView.frame = CGRect(x: 0, y: 0, width: 750, height: 750)
        colorView.center = self.view.center
        colorView.backgroundColor = .systemBlue
        colorView.layer.cornerRadius = 350
        colorView.clipsToBounds = true
        colorView.layer.allowsEdgeAntialiasing = true
        colorView.translatesAutoresizingMaskIntoConstraints = false

        //set up constraints

        colorViewWidth = NSLayoutConstraint(item: colorView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 750)
        colorViewWidth.isActive = true

        colorViewHeight = NSLayoutConstraint(item: colorView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 750)
        colorViewHeight.isActive = true

        self.view.addSubview(colorView)
        colorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        colorView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    
    func pressed() {

            self.colorViewWidth.constant = 100
            self.colorViewHeight.constant = 100

//            UIView.animate(withDuration: 1.0,
//                           delay: 0,
//                           options: .curveEaseIn,
//                           animations: {
//                            self.view.layoutIfNeeded()
//
//            },
//
//                           completion: { finished in
//
//            })
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       options: [.curveEaseIn,.repeat, .autoreverse, .curveEaseOut],
                       animations: {
                        self.view.layoutIfNeeded()

        },

                       completion: { finished in

        })
        
        
            //animate cornerRadius and update model
            let animation = CABasicAnimation(keyPath: "cornerRadius")
            animation.duration = 1.0
            //super important must match
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
            animation.fromValue = colorView.layer.cornerRadius
            animation.toValue = 50
            colorView.layer.add(animation, forKey: nil)
            //update model important
            colorView.layer.cornerRadius = 50

        }


}

