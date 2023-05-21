//
//  ExercisePlanTableViewCell.swift
//  FitMate
//
//  Created by Minoli Fernando on 2023-05-21.
//

import UIKit

protocol ExerciseDelegate {
    func didPressRow(sender: Exercise)
}
class ExerciseTableViewCell: UITableViewCell {
    
    var delegate :ExerciseDelegate!
    let label = UILabel()
    let countLabel = UILabel()
    let durationLabel = UILabel()
    let calorieLabel = UILabel()
    var imageObj = UIImage(systemName: "figure.climbing")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal) {
        didSet {
            image.image = imageObj
            image.setNeedsLayout()
        }
    }
    let image = UIImageView()
    
    var exercise :Exercise! {
        didSet {
            label.text = exercise.name
            countLabel.text = exercise.difficulty
            durationLabel.text = "Duration : \(exercise.duration) mins"
            calorieLabel.text = "Calories : \(exercise.caloriesBurned * exercise.duration) kcal"
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
        delegate.didPressRow(sender: exercise)
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
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.font = .boldSystemFont(ofSize: 20)
        
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
            label.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10),
            
            calorieLabel.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10),
            calorieLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10),
            
            durationLabel.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10),
            durationLabel.bottomAnchor.constraint(equalTo: calorieLabel.topAnchor, constant: -5),
            
            countLabel.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10),
            countLabel.bottomAnchor.constraint(equalTo: durationLabel.topAnchor, constant: -5),
        ])
    }

}
