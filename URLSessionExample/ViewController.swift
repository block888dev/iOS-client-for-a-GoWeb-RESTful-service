//
//  ViewController.swift
//  URLSessionExample
//
//  Created by Irina I. on 29.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ResponseText: UITextView!
    @IBAction func getImageButtonPressed(_ sender: Any) {
        // 1) server API
        let API = "http://192.168.0.108:9090/status-code/404"
        
        // 2) type URL from string
        guard let apiURL = URL(string: API) else {
            fatalError("some Error")
        }
        // 3) Initialize New Session
        let session = URLSession(configuration: .default)
        // 4) Create request via dataTask
        let task = session.dataTask(with: apiURL) { (data, response, error) in
            // 5) Check data
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                // data = return from the WIN server
                self.ResponseText.text = "Response: " + (String(data: data, encoding: .utf8) ?? " none yet, sorry")
            }
        }
        // Execute the URL query
        task.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

}
