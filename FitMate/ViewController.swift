//
//  ViewController.swift
//  FitMate
//
//  Created by Minoli Fernando on 2023-05-14.
//

import UIKit

class ViewController: UIViewController {
    
    let ageField = UITextField()
    let heightField = UITextField()
    let weightField = UITextField()
    
    var invalidAge = false;
    var invalidHeight = false;
    var invalidWeight = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        setUpView()
        
        ageField.text = (defaults.integer(forKey: "AGE") == 0) ? "" : String(defaults.integer(forKey: "AGE"))
        heightField.text = (defaults.double(forKey: "HEIGHT") == 0) ? "" : String(defaults.double(forKey: "HEIGHT"))
        weightField.text = (defaults.double(forKey: "WEIGHT") == 0) ? "" : String(defaults.double(forKey: "WEIGHT"))
    }
    
    @objc func nextView() {
        var numAge: Int = 0;
        var numHeight: Double = 0;
        var numWeight: Double = 0;
        
        let ageResult = ageField.text?.range(
            of: "^[0-9]+$",
            options: .regularExpression
        )
        invalidAge = (ageResult == nil)
        if (!invalidAge) {
            numAge = Int(ageField.text ?? "0")!
            if (numAge < 5 || numAge > 99) {
                invalidAge = true
            }
        }
        let heightResult = heightField.text?.range(
            of: "^[0-9]+(\\.[0-9]{0,})?$",
            options: .regularExpression
        )
        invalidHeight = (heightResult == nil)
        if (!invalidHeight) {
            numHeight = Double(heightField.text ?? "0")!
            if (numHeight < 30 || numHeight > 250) {
                invalidHeight = true
            }
        }
        let weightResult = weightField.text?.range(
            of: "^[0-9]+(\\.[0-9]{0,})?$",
            options: .regularExpression
        )
        invalidWeight = (weightResult == nil)
        if (!invalidWeight) {
            numWeight = Double(weightField.text ?? "0")!
            if (numWeight < 5 || numWeight > 500) {
                invalidWeight = true
            }
        }
        
        ageField.layer.borderWidth = (invalidAge ? 2 : 0)
        heightField.layer.borderWidth = (invalidHeight ? 2 : 0)
        weightField.layer.borderWidth = (invalidWeight ? 2 : 0)
        
        if (invalidAge || invalidHeight || invalidWeight) {
            let errorAlert = UIAlertController(title: "Alert", message: "Please fill all fields with valid values", preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(errorAlert, animated: true, completion: nil)
            return
        }
        
        let bmi = (numWeight/pow((numHeight/100), 2))
        let bmiView = BMIViewController()
        bmiView.bmi = bmi
        bmiView.age = numAge
        
        let defaults = UserDefaults.standard
        defaults.set(numAge, forKey: "AGE")
        defaults.set(numHeight, forKey: "HEIGHT")
        defaults.set(numWeight, forKey: "WEIGHT")
        
        navigationController?.pushViewController(bmiView, animated: true)
    }
    
    func setUpView() {
        view.backgroundColor = .purple
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .purple
        appearance.shadowColor = .clear
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
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
        
        ageField.translatesAutoresizingMaskIntoConstraints = false
        ageField.placeholder = "Age (years)"
        ageField.backgroundColor = .tertiarySystemBackground
        ageField.borderStyle = .roundedRect
        ageField.keyboardType = UIKeyboardType.numberPad
        ageField.layer.borderColor = UIColor.systemRed.cgColor
        ageField.layer.cornerRadius = 5
        
        let heightLabel = UILabel()
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        heightLabel.text = "HEIGHT"
        heightLabel.textColor = .white
        
        heightField.translatesAutoresizingMaskIntoConstraints = false
        heightField.placeholder = "Height (centimetres)"
        heightField.backgroundColor = .tertiarySystemBackground
        heightField.borderStyle = .roundedRect
        heightField.keyboardType = UIKeyboardType.decimalPad
        heightField.layer.borderColor = UIColor.systemRed.cgColor
        heightField.layer.cornerRadius = 5
        
        let weightLabel = UILabel()
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        weightLabel.text = "WEIGHT"
        weightLabel.textColor = .white
        
        weightField.translatesAutoresizingMaskIntoConstraints = false
        weightField.placeholder = "Weight (kilograms)"
        weightField.backgroundColor = .tertiarySystemBackground
        weightField.borderStyle = .roundedRect
        weightField.keyboardType = UIKeyboardType.decimalPad
        weightField.layer.borderColor = UIColor.systemRed.cgColor
        weightField.layer.cornerRadius = 5
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calculate BMI", for: .normal)
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
            
            fitMate.topAnchor.constraint(equalTo: scrollView.topAnchor),
            fitMate.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            fitMate.widthAnchor.constraint(equalToConstant: 200),
            fitMate.heightAnchor.constraint(equalToConstant: 100),
            
            tip.topAnchor.constraint(equalTo: fitMate.bottomAnchor, constant: 30),
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
            button.widthAnchor.constraint(equalToConstant: 160),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    
}

