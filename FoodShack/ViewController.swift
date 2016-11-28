//
//  ViewController.swift
//  FoodShack
//
//  Created by Bruce Burgess on 11/25/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let burgerBtn = UIButton()
    let pizzaBtn = UIButton()
    let sandwichBtn = UIButton()
    let tacoBtn = UIButton()
    let orderNowBtn = UIButton()
    let selectedItemThumbImg = UIImageView(image: UIImage(named: "burger"))
    let topViewHolder = UIView()
    let mainThumbViewHolder = UIView()
    let buttonViewHolder  = UIView()
    let bottomViewHolder = UIView()
    let topThumbBtn = UIButton()
    let topTitleLbl = UILabel()
    
    var views = Dictionary<String, AnyObject>()
    var constraints = [NSLayoutConstraint]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.purpleColor()
        self.topViewHolder.backgroundColor = UIColor.whiteColor()
        self.mainThumbViewHolder.backgroundColor = UIColor(red: 220.0/255.0, green: 224.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        self.buttonViewHolder.backgroundColor = UIColor(red: 242.0/255.0, green: 241.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        self.bottomViewHolder.backgroundColor = UIColor(red: 39.0/255.0, green: 61.0/255.0, blue: 72.0/255.0, alpha: 1.0)
        
        self.topThumbBtn.setImage(UIImage(named:"burger"), forState: .Normal)
        self.topTitleLbl.text = "FOOD SHACK"
        self.topTitleLbl.textColor = UIColor(red: 39.0/255.0, green: 61.0/255.0, blue: 72.0/255.0, alpha: 1.0)
        self.topTitleLbl.font = UIFont(name: "HelveticaNeue-Bold", size: 18.0)
        
        self.burgerBtn.setImage(UIImage(named:"burger"), forState: .Normal)
        self.pizzaBtn.setImage(UIImage(named:"pizza"), forState: .Normal)
        self.sandwichBtn.setImage(UIImage(named:"sandwich"), forState: .Normal)
        self.tacoBtn.setImage(UIImage(named:"taco"), forState: .Normal)
        
        self.orderNowBtn.setTitle("ORDER NOW", forState: .Normal)
        self.orderNowBtn.backgroundColor = UIColor(red: 1.000, green: 0.827, blue: 0.384, alpha: 1.00)
        self.orderNowBtn.setTitleColor(UIColor(red: 39.0/255.0, green: 61.0/255.0, blue: 72.0/255.0, alpha: 1.0), forState: .Normal)
        self.orderNowBtn.layer.cornerRadius = 5
        self.orderNowBtn.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18.0)
        
        self.topViewHolder.translatesAutoresizingMaskIntoConstraints = false
        self.mainThumbViewHolder.translatesAutoresizingMaskIntoConstraints = false
        self.buttonViewHolder.translatesAutoresizingMaskIntoConstraints = false
        self.bottomViewHolder.translatesAutoresizingMaskIntoConstraints = false
        self.topThumbBtn.translatesAutoresizingMaskIntoConstraints = false
        self.topTitleLbl.translatesAutoresizingMaskIntoConstraints = false
        self.selectedItemThumbImg.translatesAutoresizingMaskIntoConstraints = false
        self.burgerBtn.translatesAutoresizingMaskIntoConstraints = false
        self.pizzaBtn.translatesAutoresizingMaskIntoConstraints = false
        self.sandwichBtn.translatesAutoresizingMaskIntoConstraints = false
        self.tacoBtn.translatesAutoresizingMaskIntoConstraints = false
        self.orderNowBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(topViewHolder)
        self.view.addSubview(mainThumbViewHolder)
        self.view.addSubview(buttonViewHolder)
        self.view.addSubview(bottomViewHolder)
        
        self.topViewHolder.addSubview(self.topThumbBtn)
        self.topViewHolder.addSubview(self.topTitleLbl)
        self.mainThumbViewHolder.addSubview(self.selectedItemThumbImg)
        
        self.buttonViewHolder.addSubview(self.burgerBtn)
        self.buttonViewHolder.addSubview(self.pizzaBtn)
        self.buttonViewHolder.addSubview(self.sandwichBtn)
        self.buttonViewHolder.addSubview(self.tacoBtn)
        
        self.bottomViewHolder.addSubview(self.orderNowBtn)
        
        self.views["topViewHolder"] = topViewHolder
        self.views["mainThumbViewHolder"] = mainThumbViewHolder
        self.views["buttonViewHolder"] = buttonViewHolder
        self.views["bottomViewHolder"] = bottomViewHolder
        self.views["topThumbBtn"] = topThumbBtn
        self.views["topTitleLbl"] = topTitleLbl
        self.views["selectedItemThumbImg"] = selectedItemThumbImg
        self.views["burgerBtn"] = burgerBtn
        self.views["pizzaBtn"] = pizzaBtn
        self.views["sandwichBtn"] = sandwichBtn
        self.views["tacoBtn"] = tacoBtn
        self.views["orderNowBtn"] = orderNowBtn
        
        setConstraints()
        
    }
    
    func setConstraints() {
        
        /** TOP VIEW HOLDER **/
        addConstraint("V:|-[topViewHolder(50)]-0-[mainThumbViewHolder]")
        addConstraint("H:|-0-[topViewHolder]-0-|")
        
        /** MAIN VIEW HOLDER **/
        addConstraint("V:[mainThumbViewHolder(<=250@250)]-0-[buttonViewHolder]")
        addConstraint("V:[mainThumbViewHolder(>=150@250)]")
        addConstraint("H:|-0-[mainThumbViewHolder(==topViewHolder)]-0-|")
        
        /** BUTTON VIEW HOLDER **/
        addConstraint("V:[buttonViewHolder(<=200)]-0-[bottomViewHolder]")
        addConstraint("V:[buttonViewHolder(>=100)]")
        addConstraint("H:|-0-[buttonViewHolder(mainThumbViewHolder)]-0-|")
        
        //** BOTTOM VIEW HOLDER **/
        addConstraint("V:[bottomViewHolder(50@1000)]-|")
        addConstraint("H:|-0-[bottomViewHolder(buttonViewHolder)]-0-|")
        
        //** TOP THUMB BUTTON **/
        addConstraint("V:|-5-[topThumbBtn(40)]")
        addConstraint("H:|-5-[topThumbBtn(40)]-10-[topTitleLbl]")
        
        //** TOP TITLE LABLE **/
        addConstraint("V:|-5-[topTitleLbl(40)]")
        addConstraint("H:[topTitleLbl(>=50)]")
        
        //** ADD MAIN THUMB VIEW **/
        addConstraint("V:[mainThumbViewHolder]-(<=1)-[selectedItemThumbImg(<=225@250)]", options: NSLayoutFormatOptions.AlignAllCenterX)
        addConstraint("H:[mainThumbViewHolder]-(<=1)-[selectedItemThumbImg(<=225@250)]", options: NSLayoutFormatOptions.AlignAllCenterY)
        addConstraint("V:|-(>=10)-[selectedItemThumbImg]-(>=10)-|")
        
        
        //** Add FOOD BUTTONS **/
        addConstraint("V:|-5-[burgerBtn(<=75)]-(>=5)-[pizzaBtn]")
        addConstraint("H:|-5-[burgerBtn(<=75)]")
        
        addConstraint("V:[pizzaBtn(<=75)]-5-|")
        addConstraint("H:|-5-[pizzaBtn(<=75)]")
        
        addConstraint("V:|-5-[sandwichBtn(<=75)]-(>=5)-[tacoBtn]")
        addConstraint("H:[sandwichBtn(<=75)]-5-|")
        
        addConstraint("V:[tacoBtn(<=75)]-5-|")
        addConstraint("H:[tacoBtn(<=75)]-5-|")
        
        //** ADD BUTTON **/
        addConstraint("V:|-5-[orderNowBtn(50@250)]-5-|")
        addConstraint("H:[orderNowBtn(150)]-5-|")
        
        NSLayoutConstraint.activateConstraints(self.constraints)
        
    }
    
    func addConstraint(format: String, options: NSLayoutFormatOptions = []) {
        
        let newConstraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: options, metrics: nil, views: self.views)
        
        self.constraints += newConstraints
    }
}

