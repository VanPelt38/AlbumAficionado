//
//  StatsViewController.swift
//  Top10Albums
//
//  Created by Jake Gordon on 06/02/2023.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var youListenedToLabel: UILabel!
    @IBOutlet weak var overallPerCentLabel: UILabel!
    @IBOutlet weak var ofTopAlbumsLabel: UILabel!
    @IBOutlet weak var premiumStatsLabel: UILabel!
    @IBOutlet weak var questionMark: UIImageView!
    
    var UIT = UIText()
    let typingDelay = 0.01
    let viewModel = StatsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        youListenedToLabel.text = ""
        overallPerCentLabel.text = ""
        ofTopAlbumsLabel.text = ""
        premiumStatsLabel.text = ""
        
        premiumStatsLabel.isHidden = true
        var finalPercent = ""
        
        let pm = PurchaseMethods()
        
        if pm.revealPremium() {
            
            premiumStatsLabel.isHidden = false
            questionMark.isHidden = true
        }
        
        Task.init {
            do {
                finalPercent = try await viewModel.calcPremiumScore(userPercent: viewModel.getPercentage())
            } catch {
                print(error)
            }
        }
        
        let getPercentString = "\(viewModel.getPercentage())%"
        
        
        let youListenedToColourChangedString = NSMutableAttributedString(string: "")
        let overallPerCentColourChangedString = NSMutableAttributedString(string: "")
        let ofTopAlbumsColourChangedString = NSMutableAttributedString(string: "")
        let premiumStatsColourChangedString = NSMutableAttributedString(string: "")
 

        DispatchQueue.global(qos: .userInitiated).async { [self] in
            
            for index in 0..<self.UIT.youListenedLabel.count {
                
                let character = String(self.UIT.youListenedLabel[self.UIT.youListenedLabel.index(self.UIT.youListenedLabel.startIndex, offsetBy: index)])
                let attributedCharacter = NSMutableAttributedString(string: character)
                
                if character.lowercased() == "a" {
                    
                    attributedCharacter.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 1))
                }
                
                
                DispatchQueue.main.async {
                    
                    youListenedToColourChangedString.append(attributedCharacter)
                    self.youListenedToLabel.attributedText = youListenedToColourChangedString
                    
                }
                
                Thread.sleep(forTimeInterval: self.typingDelay)
            }
            
            for index in 0..<getPercentString.count {
                
                let descriptionCharacter = String(getPercentString[getPercentString.index(getPercentString.startIndex, offsetBy: index)])
                let descriptionAttributedCharacter = NSMutableAttributedString(string: descriptionCharacter)
                
                if descriptionCharacter.lowercased() == "a" {
                    
                    descriptionAttributedCharacter.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 1))
                }
                
                DispatchQueue.main.async {
                    overallPerCentColourChangedString.append(descriptionAttributedCharacter)
                    self.overallPerCentLabel.attributedText = overallPerCentColourChangedString
                }
                Thread.sleep(forTimeInterval: self.typingDelay)
            }
            
            for index in 0..<self.UIT.ofTopAlbumsLabel.count {
                
                let character = String(self.UIT.ofTopAlbumsLabel[self.UIT.ofTopAlbumsLabel.index(self.UIT.ofTopAlbumsLabel.startIndex, offsetBy: index)])
                let attributedCharacter = NSMutableAttributedString(string: character)
                
                if character.lowercased() == "a" {
                    
                    attributedCharacter.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 1))
                }
                
                
                DispatchQueue.main.async {
                    
                    ofTopAlbumsColourChangedString.append(attributedCharacter)
                    self.ofTopAlbumsLabel.attributedText = ofTopAlbumsColourChangedString
                    
                }
                
                Thread.sleep(forTimeInterval: self.typingDelay)
            }

            for index in 0..<finalPercent.count {
                
                let character = String(finalPercent[finalPercent.index(finalPercent.startIndex, offsetBy: index)])
                let attributedCharacter = NSMutableAttributedString(string: character)
                
                if character.lowercased() == "a" {
                    
                    attributedCharacter.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 1))
                }
                
                
                DispatchQueue.main.async {
                    
                    premiumStatsColourChangedString.append(attributedCharacter)
                    self.premiumStatsLabel.attributedText = premiumStatsColourChangedString
                    
                }
                
                Thread.sleep(forTimeInterval: self.typingDelay)
            }
        }
    }


}
