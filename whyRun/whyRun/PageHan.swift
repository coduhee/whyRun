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
        .font: UIFont.boldSystemFont(ofSize: 17),
        .foregroundColor: UIColor.black
    ]
    
    // 내용 폰트 설정
    let contentAttribute: [NSAttributedString.Key: Any] =
    [
        .font: UIFont.boldSystemFont(ofSize: 12),
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
        let bottomcontentVstackView = setBottomContentView()
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
            contentView.heightAnchor.constraint(equalToConstant: 2000),
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
    
    // 헤드이미지 세팅함수
    func setMainImage()->UIImageView{
        let mainImage = UIImageView()
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        // 이미지 비율유지 + 전부보이게 세팅
        mainImage.contentMode = .scaleAspectFit
        // 뷰영역을 넘어간 내용 자르기
        mainImage.clipsToBounds = true
        mainImage.layer.borderColor = UIColor.white.cgColor
        mainImage.layer.borderWidth = 1
        NSLayoutConstraint.activate([
            mainImage.widthAnchor.constraint(equalToConstant: 150),
            mainImage.heightAnchor.constraint(equalToConstant: 150)
            ])
        
        mainImage.image = .han
        return mainImage
    }
    
    // 상세 내용 세팅 함수
    func setBottomContentView()->UIStackView{
        let mainVSteckView = UIStackView()
        mainVSteckView.axis = .vertical
        mainVSteckView.translatesAutoresizingMaskIntoConstraints = false
        mainVSteckView.alignment = .center
        mainVSteckView.spacing = 10
        
        // 내용 헤더 컴포넌트 세팅
        let contentHeaderLabel = UILabel()
        contentHeaderLabel.attributedText = NSAttributedString(
            string: "A B O U T",
            attributes: headerAttribute,
        )
        contentHeaderLabel.textAlignment = .center
        
        // 내용 컴포넌트 세팅
        let contentHStackView1 = UIStackView()
        contentHStackView1.axis = .horizontal
        contentHStackView1.translatesAutoresizingMaskIntoConstraints = false
        
        let secUIview = UIView()
        secUIview.translatesAutoresizingMaskIntoConstraints = false
        secUIview.backgroundColor = .white
        let thirdUIview = UIView()
        thirdUIview.translatesAutoresizingMaskIntoConstraints = false
        thirdUIview.backgroundColor = .white
        
        
        let infoView = setContenttoinfo()
        let eduAndWorkView = setContentToEduAndWork()
        let skillView = setContentToSkill()
        
        contentHStackView1.addArrangedSubview(eduAndWorkView)
        contentHStackView1.addArrangedSubview(skillView)

        
        mainVSteckView.addArrangedSubview(contentHeaderLabel)
        mainVSteckView.addArrangedSubview(infoView)
        mainVSteckView.addArrangedSubview(contentHStackView1)
        
        NSLayoutConstraint.activate([
            infoView.widthAnchor.constraint(equalTo: mainVSteckView.widthAnchor),
           // infoView.centerYAnchor.constraint(equalTo: mainVSteckView.centerYAnchor),
        ])
        
        return mainVSteckView
    }
    
    // 개인정보 뷰 설정 함수
    func setContenttoinfo() ->UIView{
        
        let infoView = UIView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.backgroundColor = .white
        let infoTotalHStackView = UIStackView()
        infoTotalHStackView.translatesAutoresizingMaskIntoConstraints = false
        infoTotalHStackView.axis = .horizontal
        infoTotalHStackView.spacing = 10
        
        // 아이콘 및 이름 배치
        let infoNameVStackView = UIStackView()
        infoNameVStackView.translatesAutoresizingMaskIntoConstraints = false
        infoNameVStackView.axis = .vertical
        infoNameVStackView.spacing = 0
        infoNameVStackView.distribution = .equalSpacing
        let infoImageView = CustomImageView(image: .programmer, xSize:70,ySize: 70)
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        //nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.attributedText = NSAttributedString(
            string: "HAN\nJU HEON",
            attributes: [
                .font: UIFont.boldSystemFont(ofSize: 16),
                .foregroundColor: UIColor(red:107/255,green:121/255,blue:251/255,alpha:1)
            ]
        )

        infoNameVStackView.addArrangedSubview(infoImageView)
        infoNameVStackView.addArrangedSubview(nameLabel)

        
        /// 운용 사이트 배치
        let addressStackView = UIStackView()
        addressStackView.translatesAutoresizingMaskIntoConstraints = false
        addressStackView.axis = .vertical
        addressStackView.spacing = 10
        addressStackView.distribution = .fillEqually

        let velogStackView = UIStackView()
        velogStackView.translatesAutoresizingMaskIntoConstraints = false
        velogStackView.axis = .horizontal
        let velogimage = CustomImageView(image: .velogIcon, xSize:20,ySize: 20)
        let velogLabel = CustomLabel(text: "\tvelog.io/@tyr_00",align: .left,attribute: contentAttribute)
        velogStackView.addArrangedSubview(velogimage)
        velogStackView.addArrangedSubview(velogLabel)

        let gitStackView = UIStackView()
        gitStackView.translatesAutoresizingMaskIntoConstraints = false
        gitStackView.axis = .horizontal
        let gitimage = CustomImageView(image: .githubLogo, xSize:20,ySize: 20)
        let gitLabel = CustomLabel(text: "\tgodzx3-ctrl",align: .left,attribute: contentAttribute)
        gitStackView.addArrangedSubview(gitimage)
        gitStackView.addArrangedSubview(gitLabel)
        
        let emailStackView = UIStackView()
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        emailStackView.axis = .horizontal
        let emailImage = CustomImageView(image: .icons8Email96, xSize:20,ySize: 20)
        let emailLabel = CustomLabel(text: "\tgodzx3@gmail.com",align: .left,attribute: contentAttribute)
        emailStackView.addArrangedSubview(emailImage)
        emailStackView.addArrangedSubview(emailLabel)
        
        addressStackView.addArrangedSubview(velogStackView)
        addressStackView.addArrangedSubview(gitStackView)
        addressStackView.addArrangedSubview(emailStackView)
        
        infoTotalHStackView.addArrangedSubview(infoNameVStackView)
        infoTotalHStackView.addArrangedSubview(addressStackView)

        
//        infoNameVStackView.setCustomSpacing(16, after: nameLabel)
        infoView.addSubview(infoTotalHStackView)

        
        NSLayoutConstraint.activate([
            //infoNameVStackView.heightAnchor.constraint(equalTo:infoTotalHStackView.heightAnchor),
            infoNameVStackView.widthAnchor.constraint(equalToConstant:140),

            infoTotalHStackView.centerXAnchor.constraint(equalTo: infoView.centerXAnchor),
            infoTotalHStackView.centerYAnchor.constraint(equalTo: infoView.centerYAnchor),
            infoTotalHStackView.widthAnchor.constraint(equalTo: infoView.widthAnchor),
            infoTotalHStackView.heightAnchor.constraint(equalToConstant: 110),

            infoTotalHStackView.topAnchor.constraint(equalTo:infoTotalHStackView.topAnchor, constant: 15),
            infoTotalHStackView.bottomAnchor.constraint(equalTo:infoTotalHStackView.bottomAnchor, constant: -15),
            
            infoView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        return infoView
    }
    
    // 학력, 이력 내용 뷰 함수
    func setContentToEduAndWork()->UIView{
        let eduWorkView = UIView()
        eduWorkView.translatesAutoresizingMaskIntoConstraints = false

        let eduWorkVStackView = UIStackView()
        eduWorkVStackView.translatesAutoresizingMaskIntoConstraints = false
        eduWorkVStackView.axis = .vertical
        eduWorkVStackView.spacing = 2
        let eduLabel = CustomLabel(text: "EDUCATION", align: .center, attribute: contentheaderAttribute)
        let eduContentLabel = CustomLabel(text: "# 서일대학교(졸업)\n- 소프트웨어공학과\n- 소프트웨어공학과(학사)\n", align: .left, attribute: contentAttribute)
        
        let workLabel = CustomLabel(text: "Work", align: .center, attribute: contentheaderAttribute)
        let workContentLabel = CustomLabel(text: "# (주)로딕스\n2021.11~2025.10:\n \t연구원, 전임연구원 ", align: .left, attribute: contentAttribute)
        
        eduWorkVStackView.addArrangedSubview(eduLabel)
        eduWorkVStackView.addArrangedSubview(eduContentLabel)
        eduWorkVStackView.addArrangedSubview(workLabel)
        eduWorkVStackView.addArrangedSubview(workContentLabel)
        
        eduWorkVStackView.setCustomSpacing(20, after: eduContentLabel)
        eduWorkVStackView.setCustomSpacing(6, after: workLabel)

        
        eduWorkView.addSubview(eduWorkVStackView)
        
        NSLayoutConstraint.activate([
            eduWorkVStackView.centerXAnchor.constraint(equalTo: eduWorkView.centerXAnchor),
            eduWorkVStackView.widthAnchor.constraint(equalToConstant: 130),
            eduWorkVStackView.heightAnchor.constraint(equalToConstant: 200),
            eduWorkView.widthAnchor.constraint(equalToConstant: 170),
            eduWorkView.heightAnchor.constraint(equalToConstant: 300),
        ])
        
        return eduWorkView
    }
    
    func setContentToSkill()->UIView{
        let skillView = UIView()
        skillView.translatesAutoresizingMaskIntoConstraints = false

        let skillVStackView = UIStackView()
        skillVStackView.translatesAutoresizingMaskIntoConstraints = false
        skillVStackView.axis = .vertical
        skillVStackView.spacing = 2
        let skillLabel = CustomLabel(text: "SKILLS", align: .center, attribute: contentheaderAttribute)
        let skillContentLabel = CustomLabel(text: "- C# Winform\n- Devexpress Tool\n- Geoserver\n- GDAL", align: .left, attribute: contentAttribute)
        
        let worScopeLabel = CustomLabel(text: "WORK SCOPE", align: .center, attribute: contentheaderAttribute)
        let workscopeLabel1 = CustomLabel(text: "• C# WinForms 기반 프론트엔드 개발\n• DevExpress UI 컴포넌트 활용 및 커스터마이징\n• 위성영상 시각화 및 데이터 연계 기능 구현 (GDAL)\n• GeoServer 연동을 통한 공간정보 서비스 활용\n• Swagger 기반 API 연계 및 데이터 처리", align: .left, attribute: contentAttribute)

        
        skillVStackView.addArrangedSubview(skillLabel)
        skillVStackView.addArrangedSubview(skillContentLabel)
        skillVStackView.addArrangedSubview(worScopeLabel)
        skillVStackView.addArrangedSubview(workscopeLabel1)
        skillView.addSubview(skillVStackView)
        
        skillVStackView.setCustomSpacing(20, after: skillContentLabel)
        skillVStackView.setCustomSpacing(6, after: worScopeLabel)
        
        NSLayoutConstraint.activate([
            skillVStackView.centerXAnchor.constraint(equalTo: skillView.centerXAnchor),
            skillVStackView.widthAnchor.constraint(equalToConstant: 150),
            skillVStackView.heightAnchor.constraint(equalToConstant: 300),
            skillView.widthAnchor.constraint(equalToConstant: 170),
            skillView.heightAnchor.constraint(equalToConstant: 300),
        ])
        
        return skillView
    }
    
}


func CustomImageView(image:UIImage,xSize:CGFloat,ySize:CGFloat)->UIImageView
{
    let imageView = UIImageView()
    imageView.image = image
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    imageView.clipsToBounds = true
    NSLayoutConstraint.activate([
        imageView.widthAnchor.constraint(equalToConstant: xSize),
        imageView.heightAnchor.constraint(equalToConstant: ySize)
    ])
    return imageView
}

func CustomLabel(text:String, align: NSTextAlignment,attribute:[NSAttributedString.Key : Any]? = nil)->UILabel{
    let customLabel = UILabel()
    customLabel.translatesAutoresizingMaskIntoConstraints = false
    customLabel.textAlignment = align
    customLabel.numberOfLines = 0
    customLabel.lineBreakMode = .byWordWrapping
    customLabel.attributedText = NSAttributedString(
        string: text,
        attributes: attribute
    )
    return customLabel
}


#Preview
{
    PageHan()
}
