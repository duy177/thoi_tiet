//
//  ViewController.swift
//  thoi_tiet
//
//  Created by ios on 10/14/16.
//  Copyright © 2016 ios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbl_Quote: UILabel!
    @IBOutlet weak var lbl_City: UILabel!
    @IBOutlet weak var lbl_Temp: UILabel!
    @IBOutlet weak var btn_Temp: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var city = [String]()
    var quote = [String]()
    
    var images = ["Sun","Blood","Moon"]
    
    var isCel : Bool = true
    let file = "file" //this is the file. we will write to and read from it
    
    let text = "some text" //just a text
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let path = "/Users/ios/Desktop/thoi_tiet/123.rtf"
        let thanh_pho = "/Users/ios/Desktop/thoi_tiet/thanh_pho.txt"

        //reading
        do {
            
            let text2 = try String(contentsOfFile: path)
            let text3 = try String(contentsOfFile: thanh_pho)
            quote = text2.components(separatedBy:".,")
            city = text3.components(separatedBy: ".,")
            print(text2)
            
        }
        catch {/* error handling here */}
        
        
    }
    
    @IBAction func changeTemp_action(_ sender: AnyObject) {
        
        isCel = !isCel
        var currentTemp = Double((btn_Temp.titleLabel?.text)!)
        
        if isCel{
            
            currentTemp = (currentTemp! - 32) / 1.8
            btn_Temp.setTitle(String(format: "%2.1f", currentTemp!), for: UIControlState())
            lbl_Temp.text = "C"
        }
        else
        {
            
            currentTemp = ((currentTemp!) * 1.8) + 32
            btn_Temp.setTitle(String(format: "%2.1f", currentTemp!), for: UIControlState())
            lbl_Temp.text = "F"
            
        }
        
        
    }
    
    @IBAction func randomButton_action(_ sender: AnyObject) {
        let randomcity = Int(arc4random_uniform(UInt32(city.count)))
        lbl_City.text! = city[randomcity]
        
        let randomQuote = Int(arc4random_uniform(UInt32(quote.count)))
        lbl_Quote.text! = quote[randomQuote]
        
        let randomImage = Int(arc4random_uniform(UInt32(images.count)))
        backgroundImageView.image = UIImage.init(named: images[randomImage])
        
        getTemp()
    }
    
    func getTemp() -> Void{
        let temp = String(format: "%2.1f", randomTemp())
        btn_Temp.setTitle(temp, for: UIControlState())
    }
    func randomTemp() -> Double
    {
        if isCel{
            return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)
        }
        else{
            return (Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)) * 1.8 + 32
        }
        
    }
    
    
    
    
}




