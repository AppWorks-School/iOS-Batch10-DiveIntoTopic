//
//  ViewController.swift
//  GCDPractice
//
//  Created by WU CHIH WEI on 2019/8/21.
//  Copyright © 2019 WU CHIH WEI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let semaphore = DispatchSemaphore(value: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Time123", "---", Date().timeIntervalSince1970)
//        makeRequest(text: "------1------", closure: {
//
//            self.makeRequest(text: "------2------", closure: {
//
//                print("Time456", "---", Date().timeIntervalSince1970)
//                print(Date().timeIntervalSince1970)
//            })
//        })
        
        makeRequest(text: "------1------", closure: {
            
            print("Time456", "---", Date().timeIntervalSince1970)
            print(Date().timeIntervalSince1970)
        })
        
        makeRequest(text: "------2------", closure: {
            
            print("Time456", "---", Date().timeIntervalSince1970)
            print(Date().timeIntervalSince1970)
        })
        
    }

    @IBAction func touch() {
        
        semaphore.signal()
    }
    
    func makeRequest(text: String, closure: @escaping () -> Void) {
        
        let request = URLRequest(url: URL(string: "https://tcgbusfs.blob.core.windows.net/blobyoubike/YouBikeTP.json")!)
        
        let operationQueue = OperationQueue()
        
        operationQueue.maxConcurrentOperationCount = 1
        
        URLSession.shared.delegateQueue.maxConcurrentOperationCount = 3
        
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: operationQueue)
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            
            self.semaphore.wait()
            
            for i in 0...100000 {
                print(text, i)
            }
            
            self.semaphore.signal()
            
            closure()
            
        }).resume()
    }

}

