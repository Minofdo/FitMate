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
        setUpView()
    }
    
    @objc func nextView() {
        //navigationController?.pushViewController(UIViewController(), animated: true)
    }

    func setUpView() {
        view.backgroundColor = .purple
        navigationController?.navigationBar.isHidden = true
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        
        let fitMate = UIImageView(image: UIImage(named: "fitmate"));
        fitMate.translatesAutoresizingMaskIntoConstraints = false
        fitMate.contentMode = .scaleAspectFit
        
        let tip = UILabel()
        tip.translatesAutoresizingMaskIntoConstraints = false
        tip.font = .preferredFont(forTextStyle: .headline)
        tip.numberOfLines = 0
        tip.textAlignment = .center
        tip.textColor = .white
        tip.text = "Enter following details to find customised plans, Just for you."
        
        let ageLabel = UILabel()
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        ageLabel.text = "AGE"
        ageLabel.textColor = .white
        
        let ageField = UITextField()
        ageField.translatesAutoresizingMaskIntoConstraints = false
        ageField.placeholder = "Age (years)"
        ageField.backgroundColor = .tertiarySystemBackground
        ageField.borderStyle = .roundedRect
        ageField.returnKeyType = UIReturnKeyType.next
        ageField.keyboardType = UIKeyboardType.numberPad
        
        let heightLabel = UILabel()
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        heightLabel.text = "HEIGHT"
        heightLabel.textColor = .white
        
        let heightField = UITextField()
        heightField.translatesAutoresizingMaskIntoConstraints = false
        heightField.placeholder = "Height (centimetres)"
        heightField.backgroundColor = .tertiarySystemBackground
        heightField.borderStyle = .roundedRect
        heightField.returnKeyType = UIReturnKeyType.next
        heightField.keyboardType = UIKeyboardType.numberPad
        
        let weightLabel = UILabel()
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        weightLabel.text = "WEIGHT"
        weightLabel.textColor = .white
        
        let weightField = UITextField()
        weightField.translatesAutoresizingMaskIntoConstraints = false
        weightField.placeholder = "Weight (kilograms)"
        weightField.backgroundColor = .tertiarySystemBackground
        weightField.borderStyle = .roundedRect
        weightField.returnKeyType = UIReturnKeyType.next
        weightField.keyboardType = UIKeyboardType.numberPad
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Find Plans", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        button.backgroundColor = .systemPink.withAlphaComponent(0.5)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(nextView), for: .touchUpInside)
        
        view.addSubview(scrollView)
        scrollView.addSubview(fitMate)
        scrollView.addSubview(tip)
        scrollView.addSubview(ageLabel)
        scrollView.addSubview(ageField)
        scrollView.addSubview(heightLabel)
        scrollView.addSubview(heightField)
        scrollView.addSubview(weightLabel)
        scrollView.addSubview(weightField)
        scrollView.addSubview(button)
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            fitMate.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            fitMate.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            fitMate.widthAnchor.constraint(equalToConstant: 200),
            fitMate.heightAnchor.constraint(equalToConstant: 150),
            
            tip.topAnchor.constraint(equalTo: fitMate.bottomAnchor, constant: 10),
            tip.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
            tip.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            ageLabel.topAnchor.constraint(equalTo: tip.bottomAnchor, constant: 20),
            ageLabel.leftAnchor.constraint(equalTo: ageField.leftAnchor, constant: 5),
            
            ageField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 2),
            ageField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8),
            ageField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            ageField.heightAnchor.constraint(equalToConstant: 50),
            
            heightLabel.topAnchor.constraint(equalTo: ageField.bottomAnchor, constant: 30),
            heightLabel.leftAnchor.constraint(equalTo: heightField.leftAnchor, constant: 5),
            
            heightField.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 2),
            heightField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8),
            heightField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            heightField.heightAnchor.constraint(equalToConstant: 50),
            
            weightLabel.topAnchor.constraint(equalTo: heightField.bottomAnchor, constant: 30),
            weightLabel.leftAnchor.constraint(equalTo: weightField.leftAnchor, constant: 5),
            
            weightField.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 2),
            weightField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8),
            weightField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            weightField.heightAnchor.constraint(equalToConstant: 50),
            
            button.topAnchor.constraint(equalTo: weightField.bottomAnchor, constant: 40),
            button.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    
}

