//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Shen Xiaochun on 15/7/9.
//  Copyright © 2015年 Sigutian,Inc. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var ratingButtons = [UIButton]()
    
    var spacing = 5
    var stars = 5
    

    
    
  // MARK: Initialization
    
    override func layoutSubviews() {
        
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for _ in 0..<stars {
            let button = UIButton()
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            ratingButtons += [button]
            
            
            let filledStarImage = UIImage(named: "filledStar")
            let emptyStarImage = UIImage(named: "emptyStar")
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            addSubview(button)
            
            
        }
        
    }
    
    // MARK: Button Aciton
    
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        
        updateButtonSelectionStates()
        
        
        
        
    }
    
    func updateButtonSelectionStates() {
        for (index,button) in ratingButtons.enumerate() {
            // I fthe index of a button is less than the rating, that button should be selected.
            button.selected = index < rating
        }
    }
    
}

