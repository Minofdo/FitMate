//
//  ViewController.swift
//  FitMate
//
//  Created by Minoli Fernando on 2023-05-14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .purple
        
        let text = UITextField()
        text.text = "FitMate!"
        text.textAlignment = .center
        text.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        text.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(text)
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            text.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            text.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            text.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }


}

