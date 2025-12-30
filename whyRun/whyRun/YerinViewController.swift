//
//  YerinViewController.swift
//  whyRun
//
//  Created by 변예린 on 12/30/25.
//

import UIKit

class YerinViewController: UIViewController {
    
    let profileImage = UIImageView(image: .yerinProfile)
    let petImage = UIImageView(image: .yerinPet)
    
    let nameLabel = {
        let label = UILabel()
        label.text = "변예린"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        
    }
    
    func setUI() {
        view.backgroundColor = UIColor(red: 0.19, green: 0.22, blue: 0.32, alpha: 1.00)
        
        view.addSubview(profileImage)
        view.addSubview(nameLabel)
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.contentMode = .scaleAspectFit
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: (profileImage.image?.size.width ?? 0) * 1.1),
            profileImage.heightAnchor.constraint(equalToConstant: (profileImage.image?.size.height ?? 0) * 1.1),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -(view.frame.width * 0.3)),
            profileImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
        
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: profileImage.topAnchor, constant: -50),
            nameLabel.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor)
        ])
//        profileImage.addSubview(petImage)
//        
//        petImage.translatesAutoresizingMaskIntoConstraints = false
//        petImage.contentMode = .scaleAspectFit
//        
//        NSLayoutConstraint.activate([
//            petImage.widthAnchor.constraint(equalToConstant: (petImage.image?.size.width ?? 0) * 0.4),
//            petImage.heightAnchor.constraint(equalToConstant: (petImage.image?.size.height ?? 0) * 0.4),
//            petImage.trailingAnchor.constraint(equalTo: profileImage.leadingAnchor, constant: profileImage.frame.width * 0.3),
//            petImage.bottomAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: (profileImage.frame.height * 0.05))
//        ])
    }
    
}
