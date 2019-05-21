//
//  ViewController.swift
//  Untangler
//
//  Created by Prudhvi Gadiraju on 5/20/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentLevel = 0
    var connections = [ConnectionView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        levelUp()
    }
    
    func levelUp() {
        currentLevel += 1
        
        connections.forEach { $0.removeFromSuperview() }
        connections.removeAll()
        
        for _ in 1...(currentLevel+4) {
            let connection = ConnectionView(frame: CGRect(origin: .zero, size: CGSize(width: 44, height: 44)))
            connection.backgroundColor = .white
            connection.layer.cornerRadius = 22
            connection.layer.borderWidth = 2
            connection.layer.borderColor = UIColor.black.cgColor
            connections.append(connection)
            view.addSubview(connection)
        }
        
        connections.forEach(place)
    }
    
    func place(_ connection: ConnectionView) {
        let randomX = CGFloat.random(in: 20...view.bounds.maxX - 20)
        let randomY = CGFloat.random(in: 50...view.bounds.maxY - 50)
        connection.center = CGPoint(x: randomX, y: randomY)
    }


}

