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
    let scrollContentView = UIView()

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
    }
    
    func configureSheetView() {
        view.addSubview(labelStackView)
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            labelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
    
    func setupButton() {
        button1.setTitle("커리어 탐색", for: .normal)
        button1.setImage(UIImage(systemName: "location.circle"), for: .normal)
        button1.semanticContentAttribute = .forceRightToLeft
        
        button2.setTitle("멘토링", for: .normal)
        button2.setImage(UIImage(systemName: "person.fill.questionmark"), for: .normal)
        button2.semanticContentAttribute = .forceRightToLeft
        
        button3.setTitle("TIL 작성", for: .normal)
        button3.setImage(UIImage(systemName: "highlight"), for: .normal)
        button3.semanticContentAttribute = .forceRightToLeft
        
        button4.setTitle("출석 체크", for: .normal)
        button4.setImage(UIImage(systemName: "checkmark.seal"), for: .normal)
        button4.semanticContentAttribute = .forceRightToLeft
        
        button5.setTitle("데일리 스크럼", for: .normal)
        button5.setImage(UIImage(systemName: "clock.badge.checkmark"), for: .normal)
        button5.semanticContentAttribute = .forceRightToLeft
    }
    
    func configureScrollView() {
        view.addSubview(buttonScrollView)
        buttonScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonScrollView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor),
            buttonScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            buttonScrollView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        buttonScrollView.addSubview(scrollContentView)
        scrollContentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollContentView.topAnchor.constraint(equalTo: buttonScrollView.contentLayoutGuide.topAnchor),
            scrollContentView.leadingAnchor.constraint(equalTo: buttonScrollView.contentLayoutGuide.leadingAnchor),
            scrollContentView.trailingAnchor.constraint(equalTo: buttonScrollView.contentLayoutGuide.trailingAnchor),
            scrollContentView.bottomAnchor.constraint(equalTo: buttonScrollView.contentLayoutGuide.bottomAnchor),
            
            scrollContentView.heightAnchor.constraint(equalTo: buttonScrollView.frameLayoutGuide.heightAnchor)
        ])
    }
    
    func configureButtonStackView() {
    }
    
    
}
