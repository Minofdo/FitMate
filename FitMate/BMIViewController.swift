//
//  BMIViewController.swift
//  FitMate
//
//  Created by Minoli Fernando on 2023-05-19.
//

import UIKit

class BMIViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    var bmi :Double = 0
    var age :Int = 0
    
    let statusLabel = UILabel()
    let suggestionLabel = UILabel()
    let picker = UIPickerView()
    
    var selectedGoal: String?
    var goalList = ["Weight Loss", "Balanced", "Muscle Build"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (age >= 20) {
            if (bmi < 18.5) {
                // Underweight
                picker.selectRow(2, inComponent: 0, animated: false)
                selectedGoal = goalList[2]
                statusLabel.text = "UNDERWEIGHT"
                suggestionLabel.text = "We suggest not to do\n any exercises"
            } else if (bmi >= 18.5 && bmi <= 24.9) {
                //Healthy
                picker.selectRow(2, inComponent: 0, animated: false)
                selectedGoal = goalList[2]
                statusLabel.text = "HEALTHY"
                suggestionLabel.text = "We suggest you to do more\nMuscle Gain exercises"
            } else if (bmi > 24.9 && bmi <= 29.9) {
                // overweight
                picker.selectRow(1, inComponent: 0, animated: false)
                selectedGoal = goalList[1]
                statusLabel.text = "OVERWEIGHT"
                suggestionLabel.text = "We suggest you to do more\nBalanced exercises"
            } else {
                // Obese
                picker.selectRow(0, inComponent: 0, animated: false)
                selectedGoal = goalList[0]
                statusLabel.text = "OBESE"
                suggestionLabel.text = "We suggest you to do more\nWeight Loss exercises"
            }
        } else {
            if (bmi < 16.5) {
                // Underweight
                picker.selectRow(2, inComponent: 0, animated: false)
                selectedGoal = goalList[2]
                statusLabel.text = "UNDERWEIGHT"
                suggestionLabel.text = "We suggest not to do\n any exercises"
            } else if (bmi >= 16.5 && bmi <= 23.0) {
                //Healthy
                picker.selectRow(2, inComponent: 0, animated: false)
                selectedGoal = goalList[2]
                statusLabel.text = "HEALTHY"
                suggestionLabel.text = "We suggest you to do more\nMuscle Gain exercises"
            } else if (bmi > 23.0 && bmi <= 28.0) {
                // overweight
                picker.selectRow(1, inComponent: 0, animated: false)
                selectedGoal = goalList[1]
                statusLabel.text = "OVERWEIGHT"
                suggestionLabel.text = "We suggest you to do more\nBalanced exercises"
            } else {
                // Obese
                picker.selectRow(0, inComponent: 0, animated: false)
                selectedGoal = goalList[0]
                statusLabel.text = "OBESE"
                suggestionLabel.text = "We suggest you to do more\nWeight Loss exercises"
            }
        }
    }
    
    @objc func nextView() {
        let defaults = UserDefaults.standard
        defaults.set(selectedGoal?.prefix(1), forKey: "GOAL")
        let planView = ExercisePlanViewController()
        planView.selectedGoal = selectedGoal ?? "Muscle Build"
        navigationController?.pushViewController(planView, animated: true)
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
        bmiLabel.text = String(format: "%.1f", bmi)
        
        let intoLabel = UILabel()
        intoLabel.translatesAutoresizingMaskIntoConstraints = false
        intoLabel.textColor = .white
        intoLabel.font = .preferredFont(forTextStyle: .headline)
        intoLabel.text = "YOUR BMI IS"
        
        let accordingLabel = UILabel()
        accordingLabel.translatesAutoresizingMaskIntoConstraints = false
        accordingLabel.textColor = .white
        accordingLabel.font = .preferredFont(forTextStyle: .headline)
        accordingLabel.text = "according to your BMI you are"
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.textColor = .white
        statusLabel.font = .boldSystemFont(ofSize: 40)
        
        suggestionLabel.translatesAutoresizingMaskIntoConstraints = false
        suggestionLabel.textColor = .white
        suggestionLabel.font = .boldSystemFont(ofSize: 25)
        suggestionLabel.numberOfLines = 0
        suggestionLabel.textAlignment = .center
        
        let howeverLabel = UILabel()
        howeverLabel.translatesAutoresizingMaskIntoConstraints = false
        howeverLabel.textColor = .white
        howeverLabel.font = .preferredFont(forTextStyle: .headline)
        howeverLabel.numberOfLines = 0
        howeverLabel.textAlignment = .center
        howeverLabel.text = "How ever you might select your own goal from the following list."
        
        picker.tintColor = .white
        picker.delegate = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SAVE PREFERENCES", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        button.backgroundColor = .systemPink.withAlphaComponent(0.5)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(nextView), for: .touchUpInside)
        
        view.addSubview(scrollView)
        scrollView.addSubview(bmiLabel)
        scrollView.addSubview(intoLabel)
        scrollView.addSubview(accordingLabel)
        scrollView.addSubview(statusLabel)
        scrollView.addSubview(suggestionLabel)
        scrollView.addSubview(howeverLabel)
        scrollView.addSubview(picker)
        scrollView.addSubview(button)
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            intoLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            intoLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            
            bmiLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            bmiLabel.topAnchor.constraint(equalTo: intoLabel.bottomAnchor, constant: 30),
            
            accordingLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            accordingLabel.topAnchor.constraint(equalTo: bmiLabel.bottomAnchor, constant: 30),
            
            statusLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            statusLabel.topAnchor.constraint(equalTo: accordingLabel.bottomAnchor, constant: 20),
            
            suggestionLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            suggestionLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20),
            suggestionLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
            
            howeverLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            howeverLabel.topAnchor.constraint(equalTo: suggestionLabel.bottomAnchor, constant: 20),
            howeverLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
            
            picker.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            picker.topAnchor.constraint(equalTo: howeverLabel.bottomAnchor, constant: 0),
            picker.heightAnchor.constraint(equalToConstant: 150),
            
            button.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: 0),
            button.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
            button.widthAnchor.constraint(equalToConstant: 250),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
            
        ])
    }
    
    // Helper functions for picker
    // https://medium.com/@raj.amsarajm93/create-dropdown-using-uipickerview-4471e5c7d898
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // number of session
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return goalList.count // number of dropdown items
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedGoal = goalList[row] // selected item
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = .boldSystemFont(ofSize: 20)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = goalList[row]
        pickerLabel?.textColor = UIColor.white
        return pickerLabel!
    }

}
