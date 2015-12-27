//
//  ViewController.swift
//  LemonadeStand
//
//  Created by BobSchmob on 2015-12-25.
//  Copyright (c) 2015 BobSchmob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblInventoryCash: UILabel!
    @IBOutlet weak var lblInventoryIceCubes: UILabel!
    @IBOutlet weak var lblnventoryLemons: UILabel!
    
    @IBOutlet weak var lblPurchaseInventoryTotalLemons: UILabel!
    @IBOutlet weak var lblPurchaseInventoryTotalIceCubes: UILabel!
    
    @IBOutlet weak var lblCreateNumberIceCubes: UILabel!
    @IBOutlet weak var lblCreateNumberLemons: UILabel!
    
    @IBOutlet weak var lblCreateRatio: UILabel!
    
    // Declare constats for prices
    let kLemonPrice:Int  = 2
    let kIceCubePrice:Int = 1
    
    // Declare var's for number of lemons andn ice cubes
    var numLemons:Int = 0
    var numIceCubes:Int = 0
    
    // Declare how much cash to start with
    var cash:Int = 50
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.lblInventoryCash.text = "\(cash)"
        self.lblnventoryLemons.text = "\(0)"
        self.lblInventoryIceCubes.text = "\(0)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btnPurchaseInventoryMoreLemons(sender: UIButton) {
        if (self.lblInventoryCash.text?.toInt()) < 2 {
           showAlertWithText(header: "Lemons", message: "Not enough cash for more lemons")
        
        }
        else{
            self.lblPurchaseInventoryTotalLemons.text = "\((self.lblPurchaseInventoryTotalLemons.text?.toInt())! + 1)"
            self.lblnventoryLemons.text = "\((self.lblnventoryLemons.text?.toInt())! + 1)"
        
            var x: Int? = self.lblInventoryCash.text?.toInt()
            var y: Int? = x! - 2
            self.lblInventoryCash.text = "\(y!)"     
        }
    }
    

    @IBAction func btnPurchaseInventoryLessLemons(sender: UIButton) {
        if(self.lblnventoryLemons.text?.toInt() == 0){
            showAlertWithText(header: "No Lemons", message: "Out of lemons, buy more")
        }
        else{
            self.lblPurchaseInventoryTotalLemons.text = "\((self.lblPurchaseInventoryTotalLemons.text?.toInt())! - 1)"
            self.lblnventoryLemons.text = "\((self.lblnventoryLemons.text?.toInt())! - 1)"
           
            var x: Int? = self.lblInventoryCash.text?.toInt()
            var y: Int? = x! + 2
            self.lblInventoryCash.text = "\(y!)"
        }

    }
    
    
    @IBAction func btnPurchaseInventoryMoreIceCubes(sender: UIButton) {
        if (self.lblInventoryCash.text?.toInt()) < 1 {
            showAlertWithText(header: "Ice Cubes", message: "Not enough cash for more ice cubes")
            
        }
        else{
            self.lblPurchaseInventoryTotalIceCubes.text = "\((self.lblPurchaseInventoryTotalIceCubes.text?.toInt())! + 1)"
            self.lblInventoryIceCubes.text = "\((self.lblInventoryIceCubes.text?.toInt())! + 1)"
            
            var x: Int? = self.lblInventoryCash.text?.toInt()
            var y: Int? = x! - 1
            self.lblInventoryCash.text = "\(y!)"
        }
    }
    
    
    @IBAction func btnPurchaseInventoryLessIceCubes(sender: UIButton) {
        if(self.lblInventoryIceCubes.text?.toInt() == 0){
            showAlertWithText(header: "No Ice Cubes", message: "Out of Ice Cubes, buy more")
        }
        else{
            self.lblPurchaseInventoryTotalIceCubes.text = "\((self.lblPurchaseInventoryTotalIceCubes.text?.toInt())! - 1)"
            self.lblInventoryIceCubes.text = "\((self.lblInventoryIceCubes.text?.toInt())! - 1)"
            
            var x: Int? = self.lblInventoryCash.text?.toInt()
            var y: Int? = x! + 1
            self.lblInventoryCash.text = "\(y!)"
        }
    }
    
    
    @IBAction func btnCreateMoreLemons(sender: UIButton) {
        if (self.lblPurchaseInventoryTotalLemons.text?.toInt()) < 1 {
            showAlertWithText(header: "Lemons", message: "Not enough lemons in inventory")
            
        }
        else{
            self.lblCreateNumberLemons.text = "\((self.lblCreateNumberLemons.text?.toInt())! + 1)"
            self.lblPurchaseInventoryTotalLemons.text = "\((self.lblPurchaseInventoryTotalLemons.text?.toInt())! - 1)"
            calculateRatio()
        }
    }
    
    
    @IBAction func btnCreateLessLemons(sender: UIButton) {
        if (self.lblCreateNumberLemons.text?.toInt()) == 0 {
            showAlertWithText(header: "Lemons", message: "No lemons")
            
        }
        else{
            self.lblCreateNumberLemons.text = "\((self.lblCreateNumberLemons.text?.toInt())! - 1)"
            self.lblPurchaseInventoryTotalLemons.text = "\((self.lblPurchaseInventoryTotalLemons.text?.toInt())! + 1)"
            calculateRatio()
        }
    }
    
    
    @IBAction func btnCreateMoreIceCubes(sender: UIButton) {
        println("btnCreateMoreIceCubes")
        if (self.lblPurchaseInventoryTotalIceCubes.text?.toInt()) < 1 {
            showAlertWithText(header: "Ice Cubes", message: "Not enough ice cubes in inventory")
            
        }
        else{
            self.lblCreateNumberIceCubes.text = "\((self.lblCreateNumberIceCubes.text?.toInt())! + 1)"
            self.lblPurchaseInventoryTotalIceCubes.text = "\((self.lblPurchaseInventoryTotalIceCubes.text?.toInt())! - 1)"
            calculateRatio()
        }
        
    }
    
    
    @IBAction func btnCreateLessIceCubes(sender: UIButton) {
        println("btnCreateLessIceCubes")
        if (self.lblCreateNumberIceCubes.text?.toInt()) == 0 {
            showAlertWithText(header: "Ice Cubes", message: "No ice cubes")
            
        }
        else{
            self.lblCreateNumberIceCubes.text = "\((self.lblCreateNumberIceCubes.text?.toInt())! - 1)"
            self.lblPurchaseInventoryTotalIceCubes.text = "\((self.lblPurchaseInventoryTotalIceCubes.text?.toInt())! + 1)"
            calculateRatio()
        }
    }
    
    func calculateRatio(){
        // Ratios 0.0 - 0.4 acidic
        // 0.41 - 0.60 neutral
        // 0.61 - 1.00 diluted
        lblCreateRatio.text = ""
        
        if lblCreateNumberLemons.text?.toInt() == 0 && lblCreateNumberIceCubes.text?.toInt() == 0 {
            self.lblCreateRatio.text = "Nothing here yet"
        }
        else if lblCreateNumberLemons.text?.toInt() > 0 && lblCreateNumberIceCubes.text?.toInt() == 0 {
            self.lblCreateRatio.text = "Pure lemon juice"
        }
        else if lblCreateNumberLemons.text?.toInt() == 0 && lblCreateNumberIceCubes.text?.toInt() > 0 {
            self.lblCreateRatio.text = "Cold water"
        }
        else{
            var numLemons:Double = Double( (lblCreateNumberLemons.text?.toInt())! )
            var total:Double = ( Double((lblCreateNumberLemons.text?.toInt())!) + Double((lblCreateNumberIceCubes.text?.toInt())!) )
            var ratio:Double = numLemons / total
            var x:String = NSString(format: "%.2f", ratio)
            println(x)
            
            if ratio <= 0.4 {
                lblCreateRatio.text = "Acidic: \(x)"
            }
            else if ratio > 0.4 && ratio <= 0.6 {
                lblCreateRatio.text = "Neutral: \(x)"
            }
            else if ratio > 0.6 && ratio <= 1.0{
                lblCreateRatio.text = "Diluted: \(x)"
            }
            else{
                // Something ain't right
            }
        }
    }
    
    @IBAction func btnStart(sender: UIButton) {
        println("btnStart")
    }
    
    func showAlertWithText(header: String = "Error or some kind", message: String ){
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
         alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
}

