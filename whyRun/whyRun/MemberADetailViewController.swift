//
//  ViewController.swift
//  whyRun
//
//  Created by 김주희 on 12/29/25.
//

import UIKit

// 화면 전체를 담당하는 뷰컨트롤러
class MemberADetailViewController: UIViewController {
    
    // 상단 이미지 슬라이드 뷰

    private let scrollView = UIScrollView()
    private let imageStackView = UIStackView()
    // 이미지 파일을 UIImage로 바로 로드해 저장한 배열 (수정)
    // .profile1은 Asset Catalog에 등록된 이미지를 UIImage로 바로 로드한 배열
    private let images: [UIImage?] = [.profile1, .profile2, .profile3]
    
    // 버튼들을 가로로 묶을 스택뷰
    private let linkStackView = UIStackView()
    
    //  버튼 만드는 함수 만들기
    private func makeIconButton(
        image: UIImage?, // String 대신 UIImage?
        action: @escaping () -> Void
    ) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(
            // 원본 이미지 색상 유지, 바로 할당 가능
            image?.withRenderingMode(.alwaysOriginal),
            for: .normal
        )
        
        button.addAction(
            UIAction { _ in action() },
            for: .touchUpInside
        )
        // 버튼 너비 높이 44로 고정
        button.widthAnchor.constraint(equalToConstant: 44).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        return button
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // 사진,버튼,텍스트 버튼 세팅 함수 호출
        setupImageSlider()
        setupLinkButtons()
        setupProfileText()
    }
    
    // MARK: - 상단 사진 슬라이드
    private func setupImageSlider() {
        
        // 한페이지씩만 넘어가게 설정
        scrollView.isPagingEnabled = true
        
        // 스크롤뷰를 화면에 올리기
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        // 스크롤뷰 위치와 크기 설정
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
        
        // 스택뷰를 가로 방향으로 설정
        imageStackView.axis = .horizontal
        imageStackView.alignment = .fill
        imageStackView.distribution = .fillEqually
        
        //스택뷰를 스크롤뷰 안에 추가
        scrollView.addSubview(imageStackView)
        imageStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // 스택뷰를 스크롤뷰 안에 꽉 채우기
        NSLayoutConstraint.activate([
            imageStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            imageStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imageStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imageStackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
        
        // 배열 반복문으로 돌면서 사진 뷰 만들고 스택뷰에 가로로 붙임
        for image in images {
            let imageView = UIImageView()
            imageView.image = image // 이미 UIImage 객체이므로 image바로 대입
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            
            // 이미지 스택뷰에 넣기
            imageStackView.addArrangedSubview(imageView)
            
            // 사진 한장의 너비를 화면의 너비와 똑같게 하기
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        }
    }
    
    // MARK: - 링크 버튼 영역
    private func setupLinkButtons() {
        
        // 함수 이용해 깃허브 버튼 만들기
        let githubButton = makeIconButton(image: .githubLogo) {
            if let url = URL(string: "https://github.com/coduhee") {
                UIApplication.shared.open(url)
            }
        }
        
        // 티스토리 버튼 만들기
        let tistoryButton = makeIconButton(image: .tistoryLogo) {
            if let url = URL(string: "https://coduhee.tistory.com") {
                UIApplication.shared.open(url)
            }
        }
        
        // 메일 버튼 만들기
        let mailButton = makeIconButton(image: .mailLogo) {
            if let url = URL(string: "mailto:vdyjb@ewha.ac.kr") {
                UIApplication.shared.open(url)
            }
        }
        
        // 버튼 간격 위치 조정
        linkStackView.axis = .horizontal
        linkStackView.spacing = 24
        linkStackView.alignment = .center
        
        // 버튼들을 스택뷰에 넣기
        linkStackView.addArrangedSubview(githubButton)
        linkStackView.addArrangedSubview(tistoryButton)
        linkStackView.addArrangedSubview(mailButton)
        
        // 오토레이아웃설정
        view.addSubview(linkStackView)
        linkStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // 스택뷰의 위치: 사진 슬라이드의 바로 아래임
        NSLayoutConstraint.activate([
            linkStackView.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20),
            linkStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    // MARK: - 자기소개 텍스트 영역
    private func setupProfileText() {
        
        // 1. 헤더 영역 (이름+직무)
        let nameLabel = UILabel()
        nameLabel.text = "김주희"
        nameLabel.font = .systemFont(ofSize: 30, weight: .bold)
        
        let roleLabel = UILabel()
        roleLabel.text = "iOS Developer"
        roleLabel.font = .systemFont(ofSize: 16)
        roleLabel.textColor = .secondaryLabel
        
        let headerStack = UIStackView(arrangedSubviews: [nameLabel, roleLabel])
        headerStack.axis = .vertical //세로 방향
        headerStack.alignment = .leading //왼쪽 정렬
        headerStack.spacing = 4 //이름과 직무 사이의 간격이 4
        
        
        // 2. 기본 정보 영역 (전공, mbti)
        let majorLabel = UILabel()
        majorLabel.text = "🎓️ 통계학/소프트웨어학 전공"
        majorLabel.font = .systemFont(ofSize: 14)
        
        let mbtiLabel = UILabel()
        mbtiLabel.text = "#INTJ #주짓수 #문제해결중심 #피드백환영"
        mbtiLabel.font = .systemFont(ofSize: 13)
        mbtiLabel.numberOfLines = 0 //글자가 길어지면 자동으로 줄바꿈
        
        let infoStack = UIStackView(arrangedSubviews: [majorLabel, mbtiLabel])
        infoStack.axis = .vertical
        infoStack.spacing = 4
        
        
        
        // 3. 프로젝트 영역 (회색 박스 디자인)
        let projectTitleLabel = UILabel()
        projectTitleLabel.text = "현재 진행 중"
        projectTitleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        
        let projectContentLabel = UILabel()
        projectContentLabel.text = "• 왜_되는지_모름 팀 소개 iOS 앱 제작 프로젝트 진행 중"
        projectContentLabel.font = .systemFont(ofSize: 14)
        projectContentLabel.textColor = .secondaryLabel
        projectContentLabel.numberOfLines = 0
        
        // 박스 역할을 할 스택뷰 생성
        let projectBoxStack = UIStackView(arrangedSubviews: [projectTitleLabel, projectContentLabel])
        projectBoxStack.axis = .vertical
        projectBoxStack.spacing = 8
        
        // 박스 스타일 설정
        projectBoxStack.backgroundColor = .systemGray6
        // 모서리 둥글게
        projectBoxStack.layer.cornerRadius = 12
        // 배경색이 모서리를 넘어가지 않게
        projectBoxStack.clipsToBounds = true
        
        // 박스 내부 여백(Padding) 설정
        projectBoxStack.isLayoutMarginsRelativeArrangement = true
        projectBoxStack.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        // 4. 전체 스택
        let textStackView = UIStackView(arrangedSubviews: [
            headerStack,
            infoStack,
            projectBoxStack
        ])
        textStackView.axis = .vertical
        textStackView.spacing = 16
        textStackView.alignment = .fill
        

        view.addSubview(textStackView)
        textStackView.translatesAutoresizingMaskIntoConstraints = false

        //간격 설정
        NSLayoutConstraint.activate([
            textStackView.topAnchor.constraint(equalTo: linkStackView.bottomAnchor, constant: 24),
            textStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            textStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
}
    
    #Preview {
        MemberADetailViewController()
    }

