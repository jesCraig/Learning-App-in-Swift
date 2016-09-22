//
//  ViewController.swift
//  Learning-Swift
//
//  Created by Jessica Craig on 9/13/16.
//  Copyright © 2016 Jessica Craig. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var permanentView: UIImageView!
   
    @IBOutlet weak var tempView: UIImageView!
   
    
    var lastPoint = CGPoint.zero
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var swiped = false
    
    let colors: [(CGFloat, CGFloat, CGFloat)] = [(0, 0, 0),  (105.0 / 255.0, 105.0 / 255.0, 105.0 / 255.0),
            (1.0, 0, 0), (0, 0, 1.0), (51.0 / 255.0, 204.0 / 255.0, 1.0), (102.0 / 255.0, 204.0 / 255.0, 0),
            (102.0 / 255.0, 1.0, 0), (160.0 / 255.0, 82.0 / 255.0, 45.0 / 255.0), (1.0, 102.0 / 255.0, 0),
            (1.0, 1.0, 0), (1.0, 1.0, 1.0),]
    
    @IBAction func Clear(_ sender: AnyObject) {
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
