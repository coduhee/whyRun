//
//  Untitled.swift
//  whyRun
//
//  Created by Hanjuheon on 12/30/25.
//

import UIKit

class PageHan: UIViewController {
    
    // 대제목 폰트설정
    let headerAttribute: [NSAttributedString.Key: Any] =
    [
        .font: UIFont.boldSystemFont(ofSize: 24),
        .foregroundColor: UIColor(red:107/255,green:121/255,blue:251/255,alpha:1)
    ]
    
    // 소제목 폰트설정
    let contentheaderAttribute: [NSAttributedString.Key: Any] =
    [
        .font: UIFont.boldSystemFont(ofSize: 16),
        .foregroundColor: UIColor.black
    ]
    
    // 내용 폰트 설정
    let contentAttribute: [NSAttributedString.Key: Any] =
    [
        .font: UIFont.boldSystemFont(ofSize: 13),
        .foregroundColor: UIColor.black
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white //

        let rootStackView = UIStackView()
        rootStackView.axis = .vertical
        rootStackView.distribution = .fill
        rootStackView.translatesAutoresizingMaskIntoConstraints = false

        
        // 상단 해드라인 코드
        let topContainerView = UIView()
        topContainerView.backgroundColor = UIColor(red:107/255,green:121/255,blue:251/255,alpha:1)
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        let vSteckViewHeadLine = setHeadLineView()
        topContainerView.addSubview(vSteckViewHeadLine)
        rootStackView.addArrangedSubview(topContainerView)
        topContainerView.heightAnchor.constraint(equalToConstant: 330).isActive = true

        
        // 하단 내용 코드
        let bottomContainerView = UIView()
        bottomContainerView.backgroundColor = .systemGray5
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        rootStackView.addArrangedSubview(bottomContainerView)
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        bottomContainerView.addSubview(scrollView)
        scrollView.addSubview(contentView)
        let bottomcontentVstackView = UIStackView()
        contentView.addSubview(bottomcontentVstackView)
        view.addSubview(rootStackView)
        

        // 위치 조정 코드
        NSLayoutConstraint.activate([
            // rootStackView
            rootStackView.topAnchor.constraint(equalTo: view.topAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // vSteckViewHeadLine
            vSteckViewHeadLine.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor),
            vSteckViewHeadLine.centerYAnchor.constraint(equalTo: topContainerView.topAnchor, constant: 200),
            
            
            // ScrollView
            scrollView.topAnchor.constraint(equalTo: bottomContainerView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: bottomContainerView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: bottomContainerView.trailingAnchor),

            // ContentView
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
             bottomcontentVstackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
              bottomcontentVstackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
              bottomcontentVstackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])


    }
    
    
    
    // 해드라인 스택뷰 세팅 함수
    func setHeadLineView()->UIStackView{
    
    let headLineLabel  = setHeadlineLabel()
    let mainImage = setMainImage()
    
    let vSteckViewHeadLine = UIStackView()
    vSteckViewHeadLine.axis = .vertical
    vSteckViewHeadLine.alignment = .center
    vSteckViewHeadLine.spacing = 12
    vSteckViewHeadLine.translatesAutoresizingMaskIntoConstraints = false
    
    vSteckViewHeadLine.addArrangedSubview(mainImage)
    vSteckViewHeadLine.addArrangedSubview(headLineLabel)

    return vSteckViewHeadLine
    
}
    
    // 헤드라인 라벨 세팅 함수
    func setHeadlineLabel()->UILabel{
        
        let headLineLabel = UILabel()
        headLineLabel.numberOfLines = 0
        headLineLabel.textAlignment = .center
        headLineLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let headLineStr = NSMutableAttributedString(
            string:"""
            안녕하세요.
            제 이름은 한주헌 입니다.
            소통하는 개발자가 되고싶어요
            """,
            attributes: [
                .font: UIFont.boldSystemFont(ofSize: 20),
                .foregroundColor: UIColor.white
            ]
        )
        
        let strokeAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 25),
            .strokeColor: UIColor.white,
            .strokeWidth: -4.0,
            .foregroundColor: UIColor.clear
        ]
        
        var ChangeRange = (headLineStr.string as NSString).range(of: "한주헌")
        headLineStr.addAttributes(strokeAttributes, range: ChangeRange)
        ChangeRange = (headLineStr.string as NSString).range(of: "소통하는 개발자")
        headLineStr.addAttributes(strokeAttributes, range: ChangeRange)
        
        headLineLabel.attributedText = headLineStr
        
        return headLineLabel
    }
    
    // 메인이미지 세팅함수
    func setMainImage()->UIImageView{
        let mainImage = UIImageView()
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        // 이미지 비율유지 + 전부보이게 세팅
        mainImage.contentMode = .scaleAspectFit
        // 뷰영역을 넘어간 내용 자르기
        mainImage.clipsToBounds = true
        mainImage.layer.borderColor = UIColor.white.cgColor
        mainImage.layer.borderWidth = 2
        NSLayoutConstraint.activate([
            mainImage.widthAnchor.constraint(equalToConstant: 120),
            mainImage.heightAnchor.constraint(equalToConstant: 120)
            ])
        
        mainImage.image = .han
        return mainImage
    }
    
    
  
}


#Preview
{
    PageHan()
}
