//
//  ViewController.swift
//  SimpleAnimation
//
//  Created by Arkadijs Makarenko on 28/04/2017.
//  Copyright © 2017 ArchieApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var cardImageView = UIImageView()
    var tapped = false
    override func viewDidLoad() {
        super.viewDidLoad()
        let cloudImageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 80, height: 80))
        cloudImageView.image = UIImage(named: "ball")
        cloudImageView.contentMode = .scaleAspectFit
        
        view.addSubview(cloudImageView)
        UIView.animate(withDuration: 1.5, delay: 0.1, options: [.repeat, .autoreverse,], animations: {
        cloudImageView.frame = CGRect(x: 20, y: 380, width: 80, height: 80)
            cloudImageView.alpha = 0.8
            cloudImageView.transform = CGAffineTransform(rotationAngle: 45)
        }, completion: nil)
        
        cardImageView = UIImageView(frame: CGRect(x: 110, y: 100, width: 160, height: 340))
        cardImageView.image = UIImage(named: "curry")
        cardImageView.contentMode = .scaleAspectFit
        
        let cardTapGesture = UITapGestureRecognizer(target: self, action: #selector(cardTapped(_:)))
            cardImageView.addGestureRecognizer(cardTapGesture)
            cardImageView.isUserInteractionEnabled = true
        view.addSubview(cardImageView)
        
        let image = UIImage(named: "ball")
        let button = UIButton(frame: CGRect(x: 150 , y: 380, width: 80, height: 80))
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.setImage(image, for: .normal)
        //button.backgroundColor = UIColor.darkGray
//        button.layer.cornerRadius = 40.0
//        button.layer.masksToBounds = true
        view.addSubview(button)
    }
    
    func buttonTapped(){
        //storyboard
        let vc = ButtonViewController()
        present(vc, animated: true, completion: nil)
    }

    func cardTapped(_ gesture: UITapGestureRecognizer){
        UIView.transition(with: cardImageView, duration: 2.0, options: .transitionFlipFromBottom, animations: {
            if(!self.tapped){
                self.tapped = true
               self.cardImageView.image = UIImage(named: "james")
            }else{
                self.tapped = false
            self.cardImageView.image = UIImage(named: "curry")
            }
        }, completion: nil)
    }
    
    
}//end

