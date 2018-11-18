//
//  ViewController.swift
//  YogaBooks
//
//  Created by Deepashri Khawase on 18.11.18.
//  Copyright © 2018 Deep Yoga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var ebookCountLabel: UILabel!
    
//    private var subjectFromApi: Subject
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Yogabooks"
        
       let randomSubject = Subject(subjectType: "zzz",
                                   name: "qqq",
                                   key: "xxx",
                                   ebookCount: 0)
        
        subjectLabel.text = randomSubject.subjectType
        nameLabel.text = randomSubject.name
        keyLabel.text = randomSubject.key
        ebookCountLabel.text = String(randomSubject.ebookCount)
        
        getSubjects()
    }
    
    func getSubjects() {
        
        let apiUrl = "https://openlibrary.org/subjects/yoga.json"
        
        
        guard let baseUrl = URL(string: apiUrl)
            else { return }
        
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "GET"
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = urlSession.dataTask(with: request) { [weak self] (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data,
                let serverResponse = try? decoder.decode(Subject.self, from: data),
                let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                // execute this block of code on Main thread in async manner
                DispatchQueue.main.async {
                    self?.keyLabel.text = serverResponse.key
                    self?.nameLabel.text = serverResponse.name
                    self?.subjectLabel.text = serverResponse.subjectType
                    self?.ebookCountLabel.text = String(serverResponse.ebookCount)
                }
            }
//            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
//                print("Not containing JSON")
//                return
//            }
//            print(json)
        }
        
        task.resume()
    }
}

