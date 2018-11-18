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
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Yogabooks"
        
       let randomSubject = Subject(subjectType: "books",
                                   name: "insight",
                                   key: "know",
                                   ebookCount: 0)
        subjectLabel.text = randomSubject.subjectType
        nameLabel.text = randomSubject.name
        keyLabel.text = randomSubject.key
        ebookCountLabel.text = String(randomSubject.ebookCount)

    }


}

