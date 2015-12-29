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
    @IBOutlet weak var uivWeatherToday: UIImageView!
    @IBOutlet weak var lblWeatherEffect: UILabel!
    
    @IBOutlet weak var lblDaysOpenCounter: UILabel!
    
    // Declare constats for prices
    let kLemonPrice:Int  = 2
    let kIceCubePrice:Int = 1
    
    // Declare var's for number of lemons andn ice cubes
    var numLemons:Int = 0
    var numIceCubes:Int = 0
    
    // Declare how much cash to start with
    var cash:Int = 10
    
    // Variable to determine how the weather is going to effect things
    // if cold -3 people
    // if mild do nothing
    // if hot + 5 people 
    // Initialize to mild
    var weatherEffect:Int = 0;
    
    // Variable to hold how many days we have been in business
    var daysOpen: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        reset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func reset(){
        resetInventoryCash()
        resetInventory()
        resetPurchasedInventory()
        resetCreateLemonade()
        resetOpenForBusiness()
        determineWeatherForecast()
    }
    
    func resetInventoryCash(){
        lblInventoryCash.text = "\(self.cash)"
    }
    
    func resetInventory(){
        self.lblnventoryLemons.text = "\(0)"
        self.lblInventoryIceCubes.text = "\(0)"
    }
    
    func resetPurchasedInventory(){
        lblPurchaseInventoryTotalIceCubes.text = "\(0)"
        lblPurchaseInventoryTotalLemons.text = "\(0)"
    }
    
    func resetCreateLemonade(){
        lblCreateNumberIceCubes.text = "\(0)"
        lblCreateNumberLemons.text = "\(0)"
        lblCreateRatio.text = "\(0)"
    }
    
    func resetOpenForBusiness(){
        self.lblWeatherEffect.text = "\(0)"
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
        }
    }
    
    
    @IBAction func btnCreateLessLemons(sender: UIButton) {
        if (self.lblCreateNumberLemons.text?.toInt()) == 0 {
            showAlertWithText(header: "Lemons", message: "No lemons")
            
        }
        else{
            self.lblCreateNumberLemons.text = "\((self.lblCreateNumberLemons.text?.toInt())! - 1)"
            self.lblPurchaseInventoryTotalLemons.text = "\((self.lblPurchaseInventoryTotalLemons.text?.toInt())! + 1)"
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
        }
    }
    
    func calculateRatio() -> Double{
        // Ratios 0.0 - 0.4 acidic
        // 0.41 - 0.60 neutral
        // 0.61 - 1.00 diluted
        lblCreateRatio.text = ""
        var ratio:Double = 0.0
        
        if lblCreateNumberLemons.text?.toInt() == 0 && lblCreateNumberIceCubes.text?.toInt() == 0 {
            self.lblCreateRatio.text = "Nothing here yet"
            ratio = 0.0
        }
        else if lblCreateNumberLemons.text?.toInt() > 0 && lblCreateNumberIceCubes.text?.toInt() == 0 {
            self.lblCreateRatio.text = "Pure lemon juice"
            ratio = 1.0
        }
        else if lblCreateNumberLemons.text?.toInt() == 0 && lblCreateNumberIceCubes.text?.toInt() > 0 {
            self.lblCreateRatio.text = "Cold water"
            ratio = 0.0
        }
        else{
            var numLemons:Double = Double( (lblCreateNumberLemons.text?.toInt())! )
            var iceCubes:Double = Double((lblCreateNumberIceCubes.text?.toInt())!)
            var ratio:Double = numLemons / iceCubes
            var x:String = NSString(format: "%.2f", ratio)
            println(x)
            
            if ratio < 1.0 {
                lblCreateRatio.text = "Diluted: \(x)"
            }
            else if ratio == 1.0 {
                lblCreateRatio.text = "Neutral: \(x)"
            }
            else if ratio > 1.0 {
                lblCreateRatio.text = "Acidic: \(x)"
            }
            else{
                println("ERROR: Something is rotten in the state of wormulon")
            }
        }
        return ratio
    }
    
    @IBAction func btnStart(sender: UIButton) {
        if (lblCreateNumberLemons.text?.toInt())! == 0 {
            showAlertWithText(header: "No Lemons", message: "Create Lemonade: Need at least one lemon")
            return
        }
        
        var customers:[CGFloat]
        var ratio:Double = calculateRatio()
        customers = createCustomers()
        var cash:Int = calculateStacksOfCash(customers, ratio: ratio)
        inBusinessOrNot(cash)
        self.lblCreateNumberLemons.text = "\(0)"
        self.lblCreateNumberIceCubes.text = "\(0)"
        
    }
    
    
    func calculateStacksOfCash(customers:[CGFloat], ratio:Double) -> Int{
        var result:Character = "l" // Initialize to l, loose cash
        var runningCashCount: Int = 0
        for cust in customers {
            if cust <= 0.4 {
                // Acidic
                result = "a"
            }
            else if cust > 0.40 && cust <= 0.60 {
                // Neutral
                result = "n"
            }
            else if cust > 0.61 && cust <= 1.0{
                // Diluted
                result = "d"
            }
        
            if (ratio > 1.0 && result == "a" ) || (ratio == 1.0 && result == "n") || (ratio < 1.0 && result == "d") {
                runningCashCount++
            }
            else{
                runningCashCount--
            }
        }// End for cust
        
        return runningCashCount
    }
    
    func inBusinessOrNot(cash:Int){
        var profitOrLoss:Int = (lblInventoryCash.text?.toInt())! + cash
        
        lblInventoryCash.text = "\(profitOrLoss)"
        if profitOrLoss <= 0 {
            self.lblDaysOpenCounter.text = "Opening Day!!!!"
            reset()
        }
        else {
            self.daysOpen++
            self.lblDaysOpenCounter.text = "Open for \(self.daysOpen) days"
            
        }
    }
    
    func createCustomers() -> [CGFloat]{
        let count:Int = Int(arc4random_uniform(UInt32(10 + self.weatherEffect)))
        var customers:[CGFloat] = []
        var tastePreference:CGFloat = 0.0
        for var x = 0; x < count; x++ {
            customers.append(CGFloat(Float(arc4random()) / Float(UINT32_MAX)))
           
        }
        return customers;
    }
    
    func showAlertWithText(header: String = "Error or some kind", message: String ){
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
         alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func determineWeatherForecast(){
        var forecast:Int = Int(arc4random_uniform(UInt32(3)))
        switch (forecast){
            case 0:
                uivWeatherToday.image = UIImage(named: "Cold")
                self.weatherEffect = -3
            case 1:
                uivWeatherToday.image = UIImage(named: "Mild")
                self.weatherEffect = 0
            case 2:
                uivWeatherToday.image = UIImage(named: "Warm")
                self.weatherEffect =  5
            default:
                uivWeatherToday.image = UIImage(named: "Mild")
                self.weatherEffect = 0
        }
        self.lblWeatherEffect.text = "Weather caused \(self.weatherEffect) people to change their minds "
    }
    
}

