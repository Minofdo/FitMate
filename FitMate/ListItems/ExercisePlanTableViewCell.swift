//
//  ExercisePlanTableViewCell.swift
//  FitMate
//
//  Created by Minoli Fernando on 2023-05-20.
//

import UIKit

protocol ExercisePlanDelegate {
    func didPressRow(sender: [Exercise])
}
class ExercisePlanTableViewCell: UITableViewCell {
    
    var delegate :ExercisePlanDelegate!
    let label = UILabel()
    let countLabel = UILabel()
    let durationLabel = UILabel()
    let calorieLabel = UILabel()
    let image = UIImageView(image: UIImage(systemName: "figure.climbing")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal))
    
    var index :Int = 0 {
        didSet {
            label.text = "Plan \(index + 1)"
        }
    }
    var exercises :[Exercise] = [] {
        didSet {
            countLabel.text = "Contains \(exercises.count) exercises"
            var duration = 0
            var cal = 0
            for exercise in exercises {
                duration += exercise.duration
                cal += (exercise.duration * exercise.caloriesBurned)
            }
            durationLabel.text = "Duration : \(duration) mins"
            calorieLabel.text = "Calories : \(cal) kcal"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func rowClicked() {
        delegate.didPressRow(sender: exercises)
    }
    
    func setUpView() {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false;
        container.backgroundColor = .systemBackground.withAlphaComponent(0.85)
        container.layer.cornerRadius = 5
        
        var tapGesture: UITapGestureRecognizer!
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(rowClicked))
        container.addGestureRecognizer(tapGesture)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = .boldSystemFont(ofSize: 30)
        
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.adjustsFontForContentSizeCategory = true
        countLabel.font = .boldSystemFont(ofSize: 18)
        
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.adjustsFontForContentSizeCategory = true
        durationLabel.font = .boldSystemFont(ofSize: 18)
        
        calorieLabel.translatesAutoresizingMaskIntoConstraints = false
        calorieLabel.adjustsFontForContentSizeCategory = true
        calorieLabel.font = .boldSystemFont(ofSize: 18)
        
        contentView.addSubview(container)
        container.addSubview(image)
        container.addSubview(label)
        container.addSubview(countLabel)
        container.addSubview(durationLabel)
        container.addSubview(calorieLabel)

        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            image.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 0),
            image.topAnchor.constraint(equalTo: container.topAnchor, constant: 0),
            image.heightAnchor.constraint(equalToConstant: 140),
            image.widthAnchor.constraint(equalToConstant: 140),
            
            label.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            label.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 10),
            
            calorieLabel.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10),
            calorieLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10),
            
            durationLabel.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10),
            durationLabel.bottomAnchor.constraint(equalTo: calorieLabel.topAnchor, constant: -5),
            
            countLabel.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10),
            countLabel.bottomAnchor.constraint(equalTo: durationLabel.topAnchor, constant: -5),
        ])
    }

}
