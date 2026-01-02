//
//  PetCardViewController.swift
//  whyRun
//
//  Created by 변예린 on 1/2/26.
//

import UIKit

// 반려동물 카드 VC
final class PetCardViewController: UIViewController {
    
    // 배경 반투명 뷰
   let dimView: UIView = {
        let view = UIView()
       view.backgroundColor = .black.withAlphaComponent(0.5)
        return view
    }()
    
    // 카드 콘텐츠 배경 뷰
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.clipsToBounds = true // 카드 밖으로 컨텐츠가 나갔을 때 카드 모양대로 자르기 위한 제한
        
        view.layer.borderWidth = 5
        view.layer.borderColor = #colorLiteral(red: 0.9647058824, green: 0.7254901961, blue: 0.231372549, alpha: 1) // HEX #f6b93b

        return view
    }()
    
    private let shadowView: UIView = {
        let view = UIView()
        view.layer.shadowColor = #colorLiteral(red: 1, green: 0.9803921569, blue: 0.3960784314, alpha: 1) // HEX #fffa65
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = .zero
        return view
    }()
    
    // 콘텐츠
    private let content: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setContent()
        setDismiss()
    }
    
    func setupLayout() {
        view.addSubview(dimView)
        dimView.frame = view.bounds

        view.addSubview(shadowView)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        
        shadowView.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            shadowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            shadowView.widthAnchor.constraint(equalToConstant: 280),
            
            cardView.topAnchor.constraint(equalTo: shadowView.topAnchor),
            cardView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor),
            cardView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor)
        ])
        // height는 콘텐츠 길이에 따라 가변
    }

    func setContent() {
        setContentUI()
        cardView.addSubview(content)
        content.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            content.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
            content.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            content.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20)
            ])
    }
    
    
    func setContentUI() {
        let img = UIImageView(image: .yerinPet)
        
        let name: UILabel = {
            let label = UILabel()
            label.text = "짜코"
            label.font = .systemFont(ofSize: 24, weight: .bold)
            return label
        }()
        
        let lv: UILabel = {
            let label = UILabel()
            label.text = "Lv.1 크레스티드 게코"
            label.font = .systemFont(ofSize: 19, weight: .medium)
            return label
        }()

        let fav: UIStackView = {
            let title: UILabel = {
                let label = UILabel()
                label.text = "좋아하는 것:"
                label.font = .systemFont(ofSize: 19, weight: .bold)
                return label
            }()

            let ans: UILabel = {
                let label = UILabel()
                label.text = "사료, 홍시"
                label.font = .systemFont(ofSize: 19, weight: .medium)
                return label
            }()
            
            let stackView = UIStackView(arrangedSubviews: [title, ans])
            stackView.axis = .horizontal
            stackView.spacing = 6
            return stackView
        }()
        let hate: UIStackView = {
            let title: UILabel = {
                let label = UILabel()
                label.text = "싫어하는 것:"
                label.font = .systemFont(ofSize: 19, weight: .bold)
                return label
            }()
            
            let ans: UILabel = {
                let label = UILabel()
                label.text = "사람"
                label.font = .systemFont(ofSize: 19, weight: .medium)
                return label
            }()
            
            let stackView = UIStackView(arrangedSubviews: [title, ans])
            stackView.axis = .horizontal
            stackView.spacing = 6
            return stackView
        }()

        let texts: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [name, lv, fav, hate])
            stackView.axis = .vertical
            stackView.spacing = 10
            stackView.alignment = .center
            return stackView
        }()
        
        content.addSubview(img)
        content.addSubview(texts)
        
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        
        texts.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            img.widthAnchor.constraint(equalToConstant: 150),
            img.heightAnchor.constraint(equalToConstant: 180),
            img.centerXAnchor.constraint(equalTo: content.centerXAnchor),
            img.topAnchor.constraint(equalTo: content.topAnchor),
            
            texts.centerXAnchor.constraint(equalTo: content.centerXAnchor),
            texts.topAnchor.constraint(equalTo: img.bottomAnchor),
            texts.leadingAnchor.constraint(equalTo: content.leadingAnchor),
            texts.trailingAnchor.constraint(equalTo: content.trailingAnchor),
            texts.bottomAnchor.constraint(equalTo: content.bottomAnchor)
        ])
    }
    
    func setDismiss() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(close))
        dimView.addGestureRecognizer(tap)
    }
    
    @objc func close() {
        dismiss(animated: true)
    }
}
