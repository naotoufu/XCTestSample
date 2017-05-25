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

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showWeather()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
                    if let datas = jsonResult["list"] as? [[String:Any]] {
                        for data in datas {
                            print(data)
                        }
                        // アラートを表示
                        // let alert = UIAlertController(title: "", message: description, preferredStyle: .alert)
                        // self.present(alert, animated: true, completion: nil)
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
}

