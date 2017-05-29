//
//  ViewController.swift
//  XCTestSample
//
//  Created by 伊東直人 on 2017/05/25.
//  Copyright © 2017 伊東直人. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showWeather()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func getWeatherAction(sender: AnyObject) {
        self.getWeather { (description) -> Void in
            self.showAlert(message: description)
        }
    }
    
    func showWeather() {
        self.getWeather{(description) -> Void in
            print(description)
        }
    }
    
    func getWeather(closure:(String) -> Void) {
        let urlStr = "http://api.openweathermap.org/data/2.5/forecast?q=Tokyo&APPID=d2d79c5d98c37424fe938563b2694acb"
        Alamofire.request(urlStr, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            switch(response.result) {
            case .success(_):
                if let jsonResult = response.result.value as? [String: Any] {
                    let json = JSON(jsonResult)
                    json["list"].forEach{(_, weathers) in
                        weathers["weather"].forEach{(_, descriptions) in
                            // アラートを表示
                            self.showAlert(message: descriptions["description"].string!)
                        }
                    }
                }
                break
            case .failure(_):
                print("error")
                print(response.result.error ?? "Faild")
                break
            }
        }
    }
    
    func showAlert(message:String) {
        let alertController:UIAlertController = UIAlertController(title: "確認", message: message, preferredStyle: .alert)
        let okAction:UIAlertAction = UIAlertAction(title: "OK", style: .default) { (alert) -> Void in
            // OKを選択したときに実行される処理
        }
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

