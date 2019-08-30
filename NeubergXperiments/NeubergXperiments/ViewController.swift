//
//  ViewController.swift
//  NeubergXperiments
//
//  Created by Michael Overman on 8/28/19.
//  Copyright © 2019 Michael Overman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let v = UIView(frame:CGRect(x: 100, y: 100, width: 50, height: 50))
//        v.backgroundColor = .red
//        self.view.addSubview(v)
        
        let v1 = UIView(frame: CGRect(20, 111, 132, 194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView(frame:v1.bounds)
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
//        let v3 = UIView(frame: CGRect(x: 43, y: 197, width: 160, height: 230))
//        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(v1)
        v1.addSubview(v2)
//        self.view.addSubview(v3)
        
//        v2.transform = CGAffineTransform(rotationAngle: 45 * .pi/180)
//        v2.transform = CGAffineTransform(translationX: 100, y: 0).rotated(by: 45 * .pi/180)
//        v2.transform = CGAffineTransform(rotationAngle: 45 * .pi/180).translatedBy(x: 100, y: 0)
        v1.transform = CGAffineTransform(a: 1, b: 0, c: -0.2, d: 1, tx: 0, ty: 0)
    }


}

extension CGRect {
    init(_ x:CGFloat, _ y:CGFloat, _ w:CGFloat, _ h:CGFloat) {
        self.init(x:x, y:y, width:w, height:h)
    }
}
