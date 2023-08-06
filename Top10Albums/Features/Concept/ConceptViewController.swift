//
//  ConceptViewController.swift
//  Top10Albums
//
//  Created by Jake Gordon on 17/01/2023.
//

import UIKit

class ConceptViewController: UIViewController {
    
    
    @IBOutlet weak var howItWorksTitleLabel: UILabel!
    
    @IBOutlet weak var howItWorksText: UILabel!
    
    @IBOutlet weak var listsTitle: UILabel!
    
    @IBOutlet weak var listsText: UILabel!
    
    @IBOutlet weak var contactTitle: UILabel!
    
    @IBOutlet weak var contactText: UILabel!
    
    var UIT = UIText()
    let typingDelay = 0.01
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let howItWorksTitleColourChangedString = NSMutableAttributedString(string: "")
        let howItWorksTextColourChangedString = NSMutableAttributedString(string: "")
        let listsTitleColourChangedString = NSMutableAttributedString(string: "")
        let listsTextColourChangedString = NSMutableAttributedString(string: "")
        let contactTitleColourChangedString = NSMutableAttributedString(string: "")
        let contactTextColourChangedString = NSMutableAttributedString(string: "")


        DispatchQueue.global(qos: .userInitiated).async { [self] in
            
            for index in 0..<self.UIT.howItWorksTitle.count {
                
                let character = String(self.UIT.howItWorksTitle[self.UIT.howItWorksTitle.index(self.UIT.howItWorksTitle.startIndex, offsetBy: index)])
                let attributedCharacter = NSMutableAttributedString(string: character)
                
                if character.lowercased() == "a" {
                    
                    attributedCharacter.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 1))
                }
                
                
                DispatchQueue.main.async {
                    
                    howItWorksTitleColourChangedString.append(attributedCharacter)
                    self.howItWorksTitleLabel.attributedText = howItWorksTitleColourChangedString
                    
                }
                
                Thread.sleep(forTimeInterval: self.typingDelay)
            }
            
            for index in 0..<self.UIT.howItWorksText.count {
                
                let descriptionCharacter = String(self.UIT.howItWorksText[self.UIT.howItWorksText.index(self.UIT.howItWorksText.startIndex, offsetBy: index)])
                let descriptionAttributedCharacter = NSMutableAttributedString(string: descriptionCharacter)
                
                if descriptionCharacter.lowercased() == "a" {
                    
                    descriptionAttributedCharacter.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 1))
                }
                
                DispatchQueue.main.async {
                    howItWorksTextColourChangedString.append(descriptionAttributedCharacter)
                    self.howItWorksText.attributedText = howItWorksTextColourChangedString
                }
                Thread.sleep(forTimeInterval: self.typingDelay)
            }
            
            for index in 0..<self.UIT.theListsTitle.count {
                
                let character = String(self.UIT.theListsTitle[self.UIT.theListsTitle.index(self.UIT.theListsTitle.startIndex, offsetBy: index)])
                let attributedCharacter = NSMutableAttributedString(string: character)
                
                if character.lowercased() == "a" {
                    
                    attributedCharacter.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 1))
                }
                
                
                DispatchQueue.main.async {
                    
                    listsTitleColourChangedString.append(attributedCharacter)
                    self.listsTitle.attributedText = listsTitleColourChangedString
                    
                }
                
                Thread.sleep(forTimeInterval: self.typingDelay)
            }

            for index in 0..<self.UIT.theListsText.count {
                
                let character = String(self.UIT.theListsText[self.UIT.theListsText.index(self.UIT.theListsText.startIndex, offsetBy: index)])
                let attributedCharacter = NSMutableAttributedString(string: character)
                
                if character.lowercased() == "a" {
                    
                    attributedCharacter.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 1))
                }
                
                
                DispatchQueue.main.async {
                    
                    listsTextColourChangedString.append(attributedCharacter)
                    self.listsText.attributedText = listsTextColourChangedString
                    
                }
                
                Thread.sleep(forTimeInterval: self.typingDelay)
            }

            for index in 0..<self.UIT.contactTitle.count {
                
                let character = String(self.UIT.contactTitle[self.UIT.contactTitle.index(self.UIT.contactTitle.startIndex, offsetBy: index)])
                let attributedCharacter = NSMutableAttributedString(string: character)
                
                if character.lowercased() == "a" {
                    
                    attributedCharacter.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 1))
                }
                
                
                DispatchQueue.main.async {
                    
                    contactTitleColourChangedString.append(attributedCharacter)
                    self.contactTitle.attributedText = contactTitleColourChangedString
                    
                }
                
                Thread.sleep(forTimeInterval: self.typingDelay)
            }

            for index in 0..<self.UIT.contactText.count {
                
                let character = String(self.UIT.contactText[self.UIT.contactText.index(self.UIT.contactText.startIndex, offsetBy: index)])
                let attributedCharacter = NSMutableAttributedString(string: character)
                
                if character.lowercased() == "a" {
                    
                    attributedCharacter.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 1))
                }
                
                
                DispatchQueue.main.async {
                    
                    contactTextColourChangedString.append(attributedCharacter)
                    self.contactText.attributedText = contactTextColourChangedString
                    
                }
                
                Thread.sleep(forTimeInterval: self.typingDelay)
            }

        }

       
    }
    


}
