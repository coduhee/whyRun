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
    
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    let button5 = UIButton()
    
    let labelStackView = UIStackView()
    let buttonStackView = UIStackView()
    let buttonScrollView = UIScrollView()
    let buttonContentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupLabels()
        configureLabelStackView()
        
        setupButton()
        configureScrollView()
        configureButtonStackView()
    }
    
    func setupLabels() {
        mainLabel.text = "장예슬(iOS_9기)"
        mainLabel.font = .systemFont(ofSize: 30, weight: .bold)
        
        starLabel.text = "5.0 ⭐️⭐️⭐️⭐️⭐️ (823498)"
        starLabel.font = .systemFont(ofSize: 20, weight: .light)
        starLabel.textColor = .gray
        
        placeLabel.text = "📍내일배움캠프"
        placeLabel.font = .systemFont(ofSize: 15, weight: .light)
        
        timeLabel.text = "영업중 AM 09:00 ~ PM 09:00"
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
        
        view.addSubview(labelStackView)
        
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            labelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
    
    func setupButton() {
        shapeButton(title: "커리어 탐색", systemImage: "location.circle", myButton: button1)
        shapeButton(title: "멘토링", systemImage: "person.fill.questionmark", myButton: button2)
        shapeButton(title: "TIL 작성", systemImage: "pencil.line", myButton: button3)
        shapeButton(title: "출석 체크", systemImage: "checkmark.seal", myButton: button4)
        shapeButton(title: "데일리 스크럼", systemImage: "clock.badge.checkmark", myButton: button5)
    }
    
    func configureScrollView() {
        view.addSubview(buttonScrollView)
        buttonScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonScrollView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor),
            buttonScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonScrollView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        buttonScrollView.addSubview(buttonContentView)
        buttonContentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonContentView.topAnchor.constraint(equalTo: buttonScrollView.contentLayoutGuide.topAnchor),
            buttonContentView.leadingAnchor.constraint(equalTo: buttonScrollView.contentLayoutGuide.leadingAnchor),
            buttonContentView.trailingAnchor.constraint(equalTo: buttonScrollView.contentLayoutGuide.trailingAnchor),
            buttonContentView.bottomAnchor.constraint(equalTo: buttonScrollView.contentLayoutGuide.bottomAnchor),
            
            buttonContentView.heightAnchor.constraint(equalTo: buttonScrollView.frameLayoutGuide.heightAnchor)
        ])
        buttonScrollView.showsHorizontalScrollIndicator = false
    }
    
    func configureButtonStackView() {
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 30
        buttonStackView.alignment = .center
        buttonStackView.distribution = .fill
        
        buttonStackView.addArrangedSubview(button1)
        buttonStackView.addArrangedSubview(button2)
        buttonStackView.addArrangedSubview(button3)
        buttonStackView.addArrangedSubview(button4)
        buttonStackView.addArrangedSubview(button5)
        
        buttonContentView.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: buttonContentView.leadingAnchor, constant: 30),
            buttonStackView.trailingAnchor.constraint(equalTo: buttonContentView.trailingAnchor, constant: 30),
            buttonStackView.topAnchor.constraint(equalTo: buttonContentView.topAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: buttonContentView.bottomAnchor)
        ])
    }
    
    func shapeButton(title: String, systemImage: String, myButton: UIButton) {
        var config = UIButton.Configuration.filled()
        config.title = title
        config.image = UIImage(systemName: systemImage)
        config.imagePlacement = .leading
        config.imagePadding = 6
        
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        myButton.configuration = config
    }
}

