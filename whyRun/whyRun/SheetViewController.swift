//
//  SheetViewController.swift
//  whyRun
//
//  Created by Yeseul Jang on 12/30/25.
//
import UIKit

class SheetViewController: UIViewController {
    let mainLabel = UILabel()
    let starLabel = UILabel()
    let placeLabel = UILabel()
    let timeLabel = UILabel()
    
    let labelStackView = UIStackView()
    let imageStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupLabels()
        configureLabelStackView()
        configureSheetView()
    }
    
    func setupLabels() {
        mainLabel.text = "장예슬(iOS_9기)"
        mainLabel.font = .systemFont(ofSize: 30, weight: .bold)
        
        starLabel.text = "5.0 ⭐️⭐️⭐️⭐️⭐️ (823498)"
        starLabel.font = .systemFont(ofSize: 20, weight: .light)
        starLabel.textColor = .gray
        
        placeLabel.text = "📍내일배움캠프"
        placeLabel.font = .systemFont(ofSize: 15, weight: .light)
        
        timeLabel.text = "영업중 AM 9:00 ~ PM 09:00"
        timeLabel.textColor = .systemGreen
        timeLabel.font = .systemFont(ofSize: 15, weight: .light)
    }
    
    func configureLabelStackView() {
        labelStackView.axis = .vertical
        labelStackView.spacing = 5
        labelStackView.alignment = .leading
        
        labelStackView.addArrangedSubview(mainLabel)
        labelStackView.addArrangedSubview(starLabel)
        labelStackView.addArrangedSubview(placeLabel)
        labelStackView.addArrangedSubview(timeLabel)
    }
    
    func configureSheetView() {
        view.addSubview(labelStackView)
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            labelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
    
}
