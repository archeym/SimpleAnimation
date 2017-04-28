//
//  ButtonViewController.swift
//  SimpleAnimation
//
//  Created by Arkadijs Makarenko on 28/04/2017.
//  Copyright © 2017 ArchieApps. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {
    var topButton = UIButton()
    var topLeftButton = UIButton()
    var buttons = [UIButton]()
    var isMenuOpened = true
    var animator : UIDynamicAnimator!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        for color in [UIColor.red, UIColor.blue, UIColor.yellow, UIColor.cyan]{
            let button = createButton(color: color)
            
            buttons.append(button)
            view.addSubview(button)
        }
        topButton = createButton(color: .green)
        topButton.addTarget(self, action: #selector(topButtonTapped), for: .touchUpInside)
        view.addSubview(topButton)
        
        animator = UIDynamicAnimator(referenceView: view)
        
    }
    
    func topButtonTapped(){
        animator.removeAllBehaviors()
        if isMenuOpened{
            closeMenu()
        }else{
        openMenu()
        }
        isMenuOpened = !isMenuOpened
    }
    
    func openMenu(){
        var btnIndex = 0
        for xDir in [-1,1]{
            for yDir in [-1,1]{
                let button = buttons[btnIndex]
                let destinationPoint = CGPoint(x:Int(topButton.center.x) + (xDir * 100), y:Int(topButton.center.y) + (yDir * 100))
                let snap = UISnapBehavior(item: button, snapTo: destinationPoint)
                animator.addBehavior(snap)
                btnIndex += 1
            }
        }
    }
    
    func closeMenu(){
        for btn in buttons{
            let snap = UISnapBehavior(item: btn, snapTo: topButton.center)
            animator.addBehavior(snap)
        }
    }
    
    func createButton(color :UIColor)->UIButton{
        let newButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        newButton.center = view.center
        newButton.backgroundColor = color
        newButton.layer.cornerRadius = 40.0
        newButton.layer.masksToBounds = true
        return newButton
    }

}
