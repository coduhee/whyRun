//
//  SheetViewController.swift
//  whyRun
//
//  Created by Yeseul Jang on 12/30/25.
//
import UIKit
 
class YSSheetViewController: UIViewController {
    let mainLabel = UILabel()
    let starLabel = UILabel()
    let placeLabel = UILabel()
    let timeLabel = UILabel()
    let emailLabel = UILabel()
    
    let headerStackView = UIStackView()
    
    let myButtonItems: [ButtonItem] = [
        .init(title: "iOS 공부", systemImage: "location.circle"),
        .init(title: "멘토링", systemImage: "person.fill.questionmark"),
        .init(title: "TIL 작성", systemImage: "pencil.line"),
        .init(title: "출석 체크", systemImage: "checkmark.seal"),
        .init(title: "데일리 스크럼", systemImage: "clock.badge.checkmark")
    ]
    
    let buttonStackView = UIStackView()
    let buttonScrollView = UIScrollView()
    let buttonContentView = UIView()
    
    let firstDetailLabel = UILabel()
    let secondDetailLabel = UILabel()
    let thirdDetailLabel = UILabel()
    
    let firstTitleLabel = UILabel()
    let secondTitleLabel = UILabel()
    let thirdTitleLabel = UILabel()
    
    let bodyStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupHeader()
        setupButtonScroll()
        setupProfileSection()
    }
    
    func setupHeader() {
        setupHeaderLabels()
        configureHeaderLabelStackView()
    }
    
    func setupButtonScroll() {
        setupButtons()
        configureButtonScrollView()
        configureButtonStackView()
    }
    
    func setupProfileSection() {
        setupBobyLabels()
        configureBodyStackView()
    }
    
    func setupHeaderLabels() {
        mainLabel.text = "장예슬(iOS_9기)"
        mainLabel.font = .systemFont(ofSize: 30, weight: .bold)
        
        starLabel.text = "5.0 ⭐️⭐️⭐️⭐️⭐️ (823498)"
        starLabel.font = .systemFont(ofSize: 20, weight: .light)
        starLabel.textColor = .gray
        
        placeLabel.text = "📍내일배움캠프"
        placeLabel.font = .systemFont(ofSize: 15, weight: .light)
        
        timeLabel.text = "⏰ 영업중 AM 09:00 ~ PM 09:00"
        timeLabel.textColor = .gray
        timeLabel.font = .systemFont(ofSize: 15, weight: .medium)
        
        emailLabel.text = "↘︎ velog 방문하기"
        emailLabel.textColor = .systemBlue
        emailLabel.font = .systemFont(ofSize: 15, weight: .medium)
        emailLabel.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapEmailLabel))
        emailLabel.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapEmailLabel() {
        guard let url = URL(string: "https://velog.io/@yyssjj9999/posts") else { return }
        UIApplication.shared.open(url)
    }
    
    func configureHeaderLabelStackView() {
        headerStackView.axis = .vertical
        headerStackView.spacing = 5
        headerStackView.alignment = .leading
        
        headerStackView.addArrangedSubview(mainLabel)
        headerStackView.addArrangedSubview(starLabel)
        headerStackView.addArrangedSubview(placeLabel)
        headerStackView.addArrangedSubview(emailLabel)
        headerStackView.addArrangedSubview(timeLabel)
        
        view.addSubview(headerStackView)
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
        
    func makeButtons(title: String, systemImage: String) -> UIButton {
        var config = UIButton.Configuration.filled()
        config.title = title
        config.image = UIImage(systemName: systemImage)
        config.imagePlacement = .leading
        config.imagePadding = 6
        config.cornerStyle = .capsule
        config.contentInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
        
        let button = UIButton(configuration: config)
        return button
    }
    
    func configureButtonScrollView() {
        view.addSubview(buttonScrollView)
        buttonScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonScrollView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 5),
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
    
    func setupButtons() {
        myButtonItems.enumerated().forEach { index, item in
            let button = makeButtons(
                title: item.title,
                systemImage: item.systemImage)
            
            buttonStackView.addArrangedSubview(button)
        }
    }
    
    func configureButtonStackView() {
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 30
        buttonStackView.alignment = .center
        buttonStackView.distribution = .fill
        
        buttonContentView.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: buttonContentView.leadingAnchor, constant: 30),
            buttonStackView.trailingAnchor.constraint(equalTo: buttonContentView.trailingAnchor, constant: -30),
            buttonStackView.topAnchor.constraint(equalTo: buttonContentView.topAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: buttonContentView.bottomAnchor)
        ])
    }
    
    func makeSeparatorLine() -> UIView {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        return view
    }

    func configureBodyStackView() {
        let separatorView = makeSeparatorLine()
        
        bodyStackView.axis = .vertical
        bodyStackView.spacing = 5
        bodyStackView.alignment = .leading
        bodyStackView.distribution = .fillProportionally
        
        bodyStackView.addArrangedSubview(firstTitleLabel)
        bodyStackView.addArrangedSubview(firstDetailLabel)
        bodyStackView.addArrangedSubview(secondTitleLabel)
        bodyStackView.addArrangedSubview(secondDetailLabel)
        bodyStackView.addArrangedSubview(thirdTitleLabel)
        bodyStackView.addArrangedSubview(thirdDetailLabel)
        
        view.addSubview(separatorView)
        view.addSubview(bodyStackView)
        bodyStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separatorView.topAnchor.constraint(equalTo: buttonScrollView.bottomAnchor, constant: 10),
            
            bodyStackView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 10),
            bodyStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bodyStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func setupBobyLabels() {
        configureLabel(firstTitleLabel, text: ProfileStrings.titleMBTI, style: .title)
        configureLabel(secondTitleLabel, text: ProfileStrings.titleStrength, style: .title)
        configureLabel(thirdTitleLabel, text: ProfileStrings.titleCooperation, style: .title)

        configureLabel(firstDetailLabel, text: ProfileStrings.bodyMBTI, style: .detail)
        configureLabel(secondDetailLabel, text: ProfileStrings.bodyStrength, style: .detail)
        configureLabel(thirdDetailLabel, text: ProfileStrings.bodyCooperation, style: .detail)
    }
    
    func configureLabel(_ label: UILabel, text: String, style: LabelStyle) {
        label.text = text
        
        switch style {
            case .title:
            label.font = .systemFont(ofSize: 20, weight: .bold)
            
            case .detail:
            label.font = .systemFont(ofSize: 18)
            label.numberOfLines = 0
        }
    }
    
}

enum LabelStyle {
    case title
    case detail
}

enum ProfileStrings {
    static let titleMBTI = "🎭 MBTI"
    static let titleStrength = "🏆 나의 장점"
    static let titleCooperation = "🤝 협업 스타일"

    static let bodyMBTI = """
저는 INTP입니다.
흥미 있는 일에 완전히 몰입하는 편이에요.
대신 루틴을 꾸준히 유지하는 건 살짝 어려운 편이지만,
집중할 땐 진짜 결과물이 잘 나옵니다.
"""

    static let bodyStrength = """
저는 새로운 걸 빨리 배우고 잘 응용한다고 생각합니다.
새로운 걸 배우면 바로 써보고 싶어서 기대가 돼요.
"""

    static let bodyCooperation = """
모두가 리더십을 외칠때 저는 저의 팔로우십을 외치고 싶습니다!
서로 편하게 지내는 게 좋다고 생각해서 보고사항이 있다면 빠르게 말하고,
맡은 부분은 확실하게 책임집니다.
"""
}

struct ButtonItem {
    let title: String
    let systemImage: String
}


