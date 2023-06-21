//
//  ViewController.swift
//  Top10Albums
//
//  Created by Jake Gordon on 05/01/2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //MARK: - Outlets & Properties

    @IBOutlet weak var premiumButton: UIButton!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var tagLineLabel: UILabel!
    @IBOutlet weak var recordPicture: UIImageView!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var howItWorksButton: UIButton!
    @IBOutlet weak var genresButton: UIButton!
    
    let UIT = UIText()
    let typingDelay = 0.05
    
    //MARK: - View Appearance & User Stats Setup
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let userID = IDgenerator()
        saveID(userID: userID)
        let savedID = UserDefaults.standard.object(forKey: K.uniqueID)
        saveToFireStore(percentage: getOverallPercentage(), uniqueID: savedID as! String)
        
        let pm = PurchaseMethods()
        
        if pm.revealPremium() {
            
            premiumButton.isHidden = true
        }
        
        rotateRecord()
        tagLineLabel.text = ""
        
        let statsText = textModifier(textLabel: (statsButton.titleLabel?.text!)!, fontSize: 29.0)
        let statsColourString = NSMutableAttributedString(string: "")
        let aboutText = textModifier(textLabel: (howItWorksButton.titleLabel?.text!)!, fontSize: 29.0)
        let aboutColourString = NSMutableAttributedString(string: "")
            
            DispatchQueue.main.async {
                
                for character in statsText {
                  
                    statsColourString.append(character)
                    self.statsButton.titleLabel?.attributedText = statsColourString
                }
                
                for character in aboutText {
                  
                    aboutColourString.append(character)
                    self.howItWorksButton.titleLabel?.attributedText = aboutColourString
                }
                
            }
        
        
        let colourChangedString = NSMutableAttributedString(string: "")
        let descriptionColourChangedString = NSMutableAttributedString(string: "")


        DispatchQueue.global(qos: .userInitiated).async { [self] in
            
            for index in 0..<self.UIT.homeTitleText.count {
                
                let character = String(UIT.homeTitleText[UIT.homeTitleText.index(UIT.homeTitleText.startIndex, offsetBy: index)])
                let attributedCharacter = NSMutableAttributedString(string: character)
                
                if character.lowercased() == "a" {
                    
                    attributedCharacter.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 1))
                }
                
                
                DispatchQueue.main.async {
                    
                    colourChangedString.append(attributedCharacter)
                    self.albumLabel.attributedText = colourChangedString
                    
                }
                
                Thread.sleep(forTimeInterval: self.typingDelay)
            }
            
            for index in 0..<self.UIT.homeDescriptionText.count {
                
                let descriptionCharacter = String(UIT.homeDescriptionText[UIT.homeDescriptionText.index(UIT.homeDescriptionText.startIndex, offsetBy: index)])
                let descriptionAttributedCharacter = NSMutableAttributedString(string: descriptionCharacter)
                
                if descriptionCharacter.lowercased() == "a" {
                    
                    descriptionAttributedCharacter.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 1))
                }
                
                DispatchQueue.main.async {
                    descriptionColourChangedString.append(descriptionAttributedCharacter)
                    self.tagLineLabel.attributedText = descriptionColourChangedString
                }
                Thread.sleep(forTimeInterval: self.typingDelay)
            }
        }
        
        //UI Element Animations.
        
        premiumButton.frame.origin = CGPoint(x: view.center.x + premiumButton.frame.width * 2, y: view.center.y + premiumButton.frame.height * 5)
        let animation = CABasicAnimation(keyPath: K.positionX)
        animation.fromValue = view.center.x + premiumButton.frame.width * 2
        animation.toValue = view.center.x
        animation.delegate = self
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.setValue(premiumButton.layer.position.y, forKey: K.originalY)
        animation.setValue(premiumButton.layer, forKey: K.layer)
        animation.beginTime = CACurrentMediaTime() + 0.5
        animation.setValue(K.premiumAnim, forKey: K.name)
        premiumButton.layer.add(animation, forKey: K.flyInAnimation)
        
        
        
        howItWorksButton.frame.origin = CGPoint(x: view.center.x - premiumButton.frame.width * 2, y: view.center.y + howItWorksButton.frame.height * 3.5)
        let animation2 = CABasicAnimation(keyPath: K.positionX)
        animation2.fromValue = view.center.x - premiumButton.frame.width * 2
        animation2.toValue = view.center.x
        animation2.delegate = self
        animation2.duration = 1.0
        animation2.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation2.setValue(howItWorksButton.layer.position.y, forKey: K.originalY)
        animation2.setValue(howItWorksButton.layer, forKey: K.layer)
        animation2.beginTime = CACurrentMediaTime() + 0.5
        animation2.setValue(K.howAnim, forKey: K.name)
        howItWorksButton.layer.add(animation2, forKey: K.flyInAnimation2)
        
        
        statsButton.frame.origin = CGPoint(x: view.center.x + premiumButton.frame.width * 2, y: view.center.y + premiumButton.frame.height * 2)
        let animation3 = CABasicAnimation(keyPath: K.positionX)
        animation3.fromValue = view.center.x + premiumButton.frame.width * 2
        animation3.toValue = view.center.x
        animation3.delegate = self
        animation3.duration = 1.0
        animation3.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation3.setValue(statsButton.layer.position.y, forKey: K.originalY)
        animation3.setValue(statsButton.layer, forKey: K.layer)
        animation3.beginTime = CACurrentMediaTime() + 0.5
        animation3.setValue(K.statsAnim, forKey: K.name)
        statsButton.layer.add(animation3, forKey: K.flyInAnimation3)
        
        
        genresButton.frame.origin = CGPoint(x: view.center.x - premiumButton.frame.width * 2, y: view.center.y + howItWorksButton.frame.height * 0.5)
        let animation4 = CABasicAnimation(keyPath: K.positionX)
        animation4.fromValue = view.center.x - premiumButton.frame.width * 2
        animation4.toValue = view.center.x
        animation4.delegate = self
        animation4.duration = 1.0
        animation4.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation4.setValue(genresButton.layer.position.y, forKey: K.originalY)
        animation4.setValue(genresButton.layer, forKey: K.layer)
        animation4.beginTime = CACurrentMediaTime() + 0.5
        animation4.setValue(K.genresAnim, forKey: K.name)
        genresButton.layer.add(animation4, forKey: K.flyInAnimation4)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton

        
        
    }

    func rotateRecord() {
        
        let layer = recordPicture.layer
        let animation = CABasicAnimation(keyPath: K.transformRotationZ)
        animation.fromValue = 0
        animation.toValue = Double.pi * 2
        animation.duration = 1.0
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        animation.repeatCount = Float.greatestFiniteMagnitude
        layer.add(animation, forKey: K.rotationAnimation)
    }

}


extension WelcomeViewController: CAAnimationDelegate {
        
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        if let name = anim.value(forKey: "name") as? String {

            
            if name == "premiumAnim" {
                
               
                if let layer = anim.value(forKey: "layer") as? CALayer, let originalY = anim.value(forKey: "originalY") as? CGFloat {
                    var newPosition = layer.position
                    newPosition.y = originalY
                    newPosition.x = view.center.x
                    layer.position = newPosition
                }
            } else if name == K.howAnim {
                
                if let layer = anim.value(forKey: K.layer) as? CALayer, let originalY = anim.value(forKey: K.originalY) as? CGFloat {
                    var newPosition = layer.position
                    newPosition.y = originalY
                    newPosition.x = view.center.x
                    layer.position = newPosition
                }
                
            } else if name == K.statsAnim {
                
                if let layer = anim.value(forKey: K.layer) as? CALayer, let originalY = anim.value(forKey: K.originalY) as? CGFloat {
                    var newPosition = layer.position
                    newPosition.y = originalY
                    newPosition.x = view.center.x
                    layer.position = newPosition
                }
                
            } else if name == K.genresAnim {
                
                if let layer = anim.value(forKey: K.layer) as? CALayer, let originalY = anim.value(forKey: K.originalY) as? CGFloat {
                    var newPosition = layer.position
                    newPosition.y = originalY
                    newPosition.x = view.center.x
                    layer.position = newPosition
                }
                
            }
            
            
        }
    }
}
