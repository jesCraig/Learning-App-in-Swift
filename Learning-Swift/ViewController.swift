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
    
    @IBAction func Clear(_ sender: UIButton) {
        permanentView.image = nil
    }
    
    
    func touchesBegan(_ touches: Set<NSObject>, with event: UIEvent?) {
        swiped = false
        if let touch = touches.first as? UITouch{
            lastPoint = touch.location(in: self.view)
        }
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        
        
        UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        tempView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        
        context!.move(to: fromPoint)
        //CGContextMoveToPoint(context, fromPoint.x, fromPoint.y)
        context!.addLine(to: toPoint)
        //CGContextAddLineToPoint(context, toPoint.x, toPoint.y)
        
       
        context!.setLineCap(CGLineCap.round)
        context!.setLineWidth(brushWidth)
        context!.setStrokeColor(red: red, green: green, blue: blue, alpha: 1.0)
        context!.setBlendMode(CGBlendMode.normal)
        
        
        context!.strokePath()
        
        
        tempView.image = UIGraphicsGetImageFromCurrentImageContext()
        tempView.alpha = opacity
        UIGraphicsEndImageContext()
        
    }
    
    func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        swiped = true
        if let touch = touches.first as? UITouch {
            let currentPoint = touch.location(in: view)
            drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
            
            lastPoint = currentPoint
        }
    }
    
    func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        if !swiped {
            // draw a single point
            drawLineFrom(fromPoint: lastPoint, toPoint: lastPoint)
        }
        
        // Merge tempImageView into mainImageView
        UIGraphicsBeginImageContext(permanentView.frame.size)
        permanentView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: CGBlendMode.normal, alpha: 1.0)
        tempView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: CGBlendMode.normal, alpha: opacity)
        permanentView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        tempView.image = nil
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
