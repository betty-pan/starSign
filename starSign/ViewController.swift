//
//  ViewController.swift
//  starSign
//
//  Created by Betty Pan on 2021/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var starSignDatePicker: UIDatePicker!
    @IBOutlet weak var starSignImageView: UIImageView!
    @IBOutlet weak var starSignLabel: UILabel!
    @IBOutlet weak var currentAgeLabel: UILabel!
    @IBOutlet weak var lifeCodeLabel: UILabel!
    @IBOutlet weak var lifeCodeMeaningLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //設定星座對應日期 & 年紀
    func starSigns() {
        //取值（選取日期）
        let pickDate = starSignDatePicker.date
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: pickDate)
        let year = dateComponents.year!
        let month = dateComponents.month!
        let day = dateComponents.day!
        
        //取值（現在日期）
        let today = Date()
        let currentDateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: today)
        let currentYear = currentDateComponents.year!
        var age = 0
        //計算年紀
        age = currentYear - year
        //年紀不出現負數
        if age < 0 {
            age = 0
        }
        currentAgeLabel.text = "Current Age: \(age)"
        
        //設定星座日期區間＆顯示星座對應image
        if month == 1 && day >= 19 || month == 2 && day <= 19 {
            starSignLabel.text = "水瓶座 Aquarius"
            starSignImageView.image = UIImage(named: "aquarius")
        }else if month == 2 && day >= 20 || month == 3 && day <= 20 {
            starSignLabel.text = "雙魚座 Pisces"
            starSignImageView.image = UIImage(named: "pisces")
        }else if month == 3 && day >= 21 || month == 4 && day <= 20 {
            starSignLabel.text = "牡羊座 Aries"
            starSignImageView.image = UIImage(named: "aries")
        }else if month == 4 && day >= 21 || month == 5 && day <= 20 {
            starSignLabel.text = "金牛座 Taurus"
            starSignImageView.image = UIImage(named: "taurus")
        }else if month == 5 && day >= 21 || month == 6 && day <= 20 {
            starSignLabel.text = "雙子座 Gemini"
            starSignImageView.image = UIImage(named: "gemini")
        }else if month == 6 && day >= 21 || month == 7 && day <= 22 {
            starSignLabel.text = "巨蟹座 Cancer"
            starSignImageView.image = UIImage(named: "cancer")
        }else if month == 7 && day >= 23 || month == 8 && day <= 22 {
            starSignLabel.text = "獅子座 Leo"
            starSignImageView.image = UIImage(named: "leo")
        }else if month == 8 && day >= 23 || month == 9 && day <= 22 {
            starSignLabel.text = "處女座 Virgo"
            starSignImageView.image = UIImage(named: "virgo")
        }else if month == 9 && day >= 23 || month == 10 && day <= 22 {
            starSignLabel.text = "天秤座 Libra"
            starSignImageView.image = UIImage(named: "libra")
        }else if month == 10 && day >= 23 || month == 11 && day <= 22 {
            starSignLabel.text = "天蠍座 Scorpio"
            starSignImageView.image = UIImage(named: "scorpio")
        }else if month == 11 && day >= 23 || month == 12 && day <= 22 {
            starSignLabel.text = "射手座 Sagittarius"
            starSignImageView.image = UIImage(named: "sagittarius")
        }else{
            starSignLabel.text = "摩羯座 Capricorn"
            starSignImageView.image = UIImage(named: "capricornus")
        }
    }
    
    //計算生命靈數
    func lifeCodeCalculate() {
        let lifeCodeMeanings = ["","開創", "協調", "創意", "務實", "自由","關懷", "探究", "權威", "智慧"]
        //日期轉字串
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yMd"
        var dateString = dateFormatter.string(from: starSignDatePicker.date)
        
        var sum = 0
        
        //repeat-while迴圈
        repeat{
            //每次repeat都由零開始，否則將進入無限循環
            sum = 0
            
        //for迴圈：取日期數字相加之結果
        for characters in dateString {
            //字串轉數字
            let number = Int(String(characters))!
            sum = sum + number
        }
            //得到的總和轉成字串，dateString函數=sum總和字串
            dateString = "\(sum)"
        //當sum>9時，繼續迴圈至sum<=9
        }while sum > 9
        
        lifeCodeLabel.text = "\(sum)"
        lifeCodeMeaningLabel.text = lifeCodeMeanings[sum]
    }
    
    @IBAction func showResult(_ sender: UIButton) {
        starSigns()
        lifeCodeCalculate()
    }
    
}

