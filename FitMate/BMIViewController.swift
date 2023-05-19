//
//  BMIViewController.swift
//  FitMate
//
//  Created by Minoli Fernando on 2023-05-19.
//

import UIKit

class BMIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpView()
    }
    
    func setUpView() {
        view.backgroundColor = .purple
        navigationController?.navigationBar.isHidden = false
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.setContentOffset(.zero, animated: false)
        
        let bmiLabel = UILabel()
        bmiLabel.translatesAutoresizingMaskIntoConstraints = false
        bmiLabel.textColor = .white
        bmiLabel.font = .boldSystemFont(ofSize: 60)
        bmiLabel.text = "24"
        
        let intoLabel = UILabel()
        intoLabel.translatesAutoresizingMaskIntoConstraints = false
        intoLabel.textColor = .white
        intoLabel.font = .preferredFont(forTextStyle: .headline)
        intoLabel.text = "YOUR BMI IS"
        
        view.addSubview(scrollView)
        scrollView.addSubview(bmiLabel)
        scrollView.addSubview(intoLabel)
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            bmiLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            bmiLabel.bottomAnchor.constraint(equalTo: scrollView.centerYAnchor),
            
            intoLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            intoLabel.bottomAnchor.constraint(equalTo: bmiLabel.topAnchor),
            
        ])
    }

}
