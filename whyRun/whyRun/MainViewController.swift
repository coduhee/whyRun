//
//  MainViewController.swift
//  whyRun
//
//  Created by 변예린 on 1/2/26.
//

import UIKit

class MainViewController: UIViewController {
  
    let kjhButton = NavButton(to: Person.김주희.rawValue)
    let byrButton = NavButton(to: Person.변예린.rawValue)
    let jysButton = NavButton(to: Person.장예슬.rawValue)
    let hjhButton = NavButton(to: Person.한주헌.rawValue)
    
    let logoLabel = UILabel()
    let teamNameLabel = UILabel()
    let teamGoalLabel = UILabel()
    let teamInfoLabel = UILabel()
    
    private let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setButtonAction()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        roundButton()
    }
    //MARK: UI 설정
    // UI 셋업 설정
    func setUI() {
        view.backgroundColor = .white
        
        setLabels()
        setScrollView()
        
        let teamLabels = stackView([logoLabel, teamNameLabel, teamGoalLabel], axis: .vertical, spacing: 0)
        teamLabels.alignment = .center
        
        let firstButtonStack = stackView([kjhButton, byrButton], axis: .horizontal)
        let secondButtonStack = stackView([jysButton, hjhButton], axis: .horizontal)
        
        let buttons = stackView([firstButtonStack, secondButtonStack], axis: .vertical)

        view.addSubview(teamLabels)
        view.addSubview(scrollView)
        view.addSubview(buttons)
        
        teamLabels.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        buttons.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            teamLabels.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            teamLabels.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            teamLabels.heightAnchor.constraint(equalToConstant: 160),
            
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.topAnchor.constraint(equalTo: teamLabels.bottomAnchor, constant: 15),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            scrollView.heightAnchor.constraint(equalTo: teamLabels.heightAnchor, multiplier: 1.1),
            
            buttons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttons.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20),
            buttons.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            buttons.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
        ])
    }

    // 레이블 설정
    func setLabels() {
        logoLabel.text = "🧐"
        logoLabel.font = .systemFont(ofSize: 72)

        teamNameLabel.text = "왜_되는지_모름"
        teamNameLabel.font = .systemFont(ofSize: 40, weight: .bold)

        teamGoalLabel.text = "왜 되는지 알게되는 그날까지 디버깅!"
        teamGoalLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        teamGoalLabel.textColor = .darkGray
        
        teamInfoLabel.numberOfLines = 0
        teamInfoLabel.lineBreakMode = .byWordWrapping
        teamInfoLabel.text = """
            ❮고정 일정❯
            🕖 데일리 스크럼 - 10:00, 14:00, 19:30
            🍚 점심 식사 - 13:00 ~ 14:00
            🍚 저녁 식사 - 18:00 ~ 19:00
            
            ❮규칙❯
            - ✨feat: 기능 추가
            - ♻️refactor: 기능과 관련된 개선/전면수정
            - ✅test: 테스트 추가
            - 🩹chore: 네이밍, 컨벤션 등 수정
            - 🐛fix: 오류 수정
            - 📝docs: 문서 추가 및 수정
            - 🚚build: 파일 이동 및 추가
            """
        teamInfoLabel.font = .systemFont(ofSize: 16, weight: .medium)
        teamInfoLabel.textColor = .black
    }
    
    //스크롤뷰 설정
    func setScrollView() {
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        scrollView.layer.cornerRadius = 10
        
        scrollView.addSubview(teamInfoLabel)
        teamInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            teamInfoLabel.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 15),
            teamInfoLabel.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 15),
            teamInfoLabel.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -15),
            teamInfoLabel.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -15),
            
            teamInfoLabel.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, constant: -24)
        ])
    }
    
    // 스택뷰 생성
    func stackView(_ views: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat = 10) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: views)
        stack.axis = axis
        stack.spacing = spacing
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }
    
    //MARK: 동작 설정
    // 버튼 액션 설정
    func setButtonAction() {
        [kjhButton, byrButton, jysButton, hjhButton].forEach { (btn: NavButton) in
            btn.addTarget(self, action: #selector(navigateTo), for: .touchUpInside)
        }
    }
    
    // 각 vc로 이동
    @objc private func navigateTo(_ sender: NavButton) {
        var vc = UIViewController()
        guard let name = sender.currentTitle else { return }
        guard let person = Person(rawValue: name) else { return }
    
        switch person {
        case .김주희:
            vc = MemberADetailViewController()
        case .변예린:
            vc = YerinViewController()
        case .장예슬:
            vc = YSMainViewController()
        case .한주헌:
            vc = PageHan()
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // 버튼 모양 설정
    func roundButton() {
        [kjhButton, byrButton, jysButton, hjhButton].forEach { (btn: NavButton) in
            btn.layer.cornerRadius = btn.frame.width / 2
        }
    }
}

//MARK: 커스텀 객체
enum Person: String {
    case 김주희 = "👑김주희"
    case 변예린 = "변예린"
    case 장예슬 = "장예슬"
    case 한주헌 = "한주헌"
}

class NavButton: UIButton {
    init(to page: String) {
        super.init(frame: .zero)
        
        setTitle(page, for: .normal)
        setTitleColor(.black, for: .normal)
        
        backgroundColor = .cyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
