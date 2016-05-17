//
//  ViewController.swift
//  DOFavoriteButton-DEMO
//
//  Created by Daiki Okumura on 2015/07/09.
//  Copyright (c) 2015 Daiki Okumura. All rights reserved.
//

import UIKit
import DOFavoriteButton

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = (self.view.frame.width - 44) / 4
        var x = width / 2
        let y = self.view.frame.height / 2 - 22
        
        // star button
        let starButton = DOFavoriteButton(frame: CGRectMake(x, y, 44, 44), image: UIImage(named: "star"))
        starButton.addTarget(self, action: #selector(ViewController.tappedButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(starButton)
        x += width
        
        // heart button
        let heartButton = DOFavoriteButton(frame: CGRectMake(x, y, 44, 44), image: UIImage(named: "heart"))
        heartButton.imageColorOn = UIColor(red: 254/255, green: 110/255, blue: 111/255, alpha: 1.0)
        heartButton.circleColor = UIColor(red: 254/255, green: 110/255, blue: 111/255, alpha: 1.0)
        heartButton.lineColor = UIColor(red: 226/255, green: 96/255, blue: 96/255, alpha: 1.0)
        heartButton.addTarget(self, action: #selector(ViewController.tappedButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(heartButton)
        x += width
        
        // like button
        let likeButton = DOFavoriteButton(frame: CGRectMake(x, y, 44, 44), image: UIImage(named: "like"))
        likeButton.imageColorOn = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        likeButton.circleColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        likeButton.lineColor = UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1.0)
        likeButton.addTarget(self, action: #selector(ViewController.tappedButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(likeButton)
        x += width
        
        // smile button
        let smileButton = DOFavoriteButton(frame: CGRectMake(x, y, 44, 44), image: UIImage(named: "smile"))
        smileButton.imageColorOn = UIColor(red: 45/255, green: 204/255, blue: 112/255, alpha: 1.0)
        smileButton.circleColor = UIColor(red: 45/255, green: 204/255, blue: 112/255, alpha: 1.0)
        smileButton.lineColor = UIColor(red: 45/255, green: 195/255, blue: 106/255, alpha: 1.0)
        smileButton.addTarget(self, action: #selector(ViewController.tappedButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(smileButton)

        
        let rectB = CGRectMake(0, 0, 100, 100)
        let cent  = CGPoint(x: 100, y: 100)
        let one = CAShapeLayer()
        one.fillColor = UIColor.redColor().CGColor
        one.bounds = rectB
        one.position = cent
        one.path = UIBezierPath(ovalInRect: rectB).CGPath
        self.view.layer.addSublayer(one)
        
        let cire = CAShapeLayer()
        cire.bounds = rectB
        cire.position = CGPoint(x: 50, y: 50)
        //  判断哪个属于内部，内部将被填充
        cire.fillRule = kCAFillRuleEvenOdd
        //  第一个路径rect
        let maskPath = UIBezierPath(rect: rectB)
        //  第二个路径圆
        maskPath.addArcWithCenter(CGPoint(x: 50,y: 50), radius: 10, startAngle: CGFloat(0.0), endAngle: CGFloat(M_PI * 2), clockwise: true)
        cire.path = maskPath.CGPath
        one.mask = cire
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tappedButton(sender: DOFavoriteButton) {
        if sender.selected {
            sender.deselect()
        } else {
            sender.select()
        }
    }
}

