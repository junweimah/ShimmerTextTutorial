//
//  ViewController.swift
//  ShimmerAnimation
//
//  Created by Tandem on 20/06/2018.
//  Copyright © 2018 Tandem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .black
        
        //dark text color in the back
        let lblDarkText = UILabel()
        lblDarkText.text = "Shimmer"
        lblDarkText.textColor = UIColor(white: 1, alpha: 0.2)
        lblDarkText.font = UIFont.systemFont(ofSize: 80)
        lblDarkText.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        lblDarkText.textAlignment = .center
        
        //lighter text color in the front
        let lblShinyText = UILabel()
        lblShinyText.text = "Shimmer"
        lblShinyText.textColor = .white
        lblShinyText.font = UIFont.systemFont(ofSize: 80)
        lblShinyText.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        lblShinyText.textAlignment = .center
        
        view.addSubview(lblDarkText)
        view.addSubview(lblShinyText)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor,UIColor.white.cgColor,UIColor.clear.cgColor,]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.frame = lblShinyText.frame
        
        let angle = 45 * CGFloat.pi / 180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        
        lblShinyText.layer.mask = gradientLayer
        
        //animation
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 2
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.repeatCount = Float.infinity
        
        gradientLayer.add(animation, forKey: "dontmatter")
        
    }

}

