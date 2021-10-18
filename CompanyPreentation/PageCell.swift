//
//  PageCell.swift
//  CompanyPreentation
//
//  Created by Burak İmdat on 17.10.2021.
//

import Foundation
import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let page = page else { return }
            googleImage.image = UIImage(named: page.imageName)
            let attrText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            let attrDescription = NSMutableAttributedString(string: "\n\n\(page.description)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor.darkGray])
            attrText.append(attrDescription)
            txtCompanyName.attributedText = attrText
            txtCompanyName.textAlignment = .center
        }
    }
    
    private let googleImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "google"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let txtCompanyName: UITextView = {
        let textView = UITextView()
//        textView.text = "Ailemizin arama motoru Google"
//        textView.font = UIFont.boldSystemFont(ofSize: 18)
        let attrText = NSMutableAttributedString(string: "Ailemizin arama motoru Google", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        let attrDescription = NSMutableAttributedString(string: "\n\nİnternet araması, çevrimiçi bilgi dağıtımı, reklam teknolojileri ve arama motorları için yatırımlar yapan çok uluslu Amerikan anonim şirketidir. İnternet tabanlı hizmet ve ürünler geliştirir.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        attrText.append(attrDescription)
        textView.attributedText = attrText
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout(){
        let topView = UIView()
        addSubview(topView)
        topView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        topView.addSubview(googleImage)
        googleImage.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        googleImage.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        googleImage.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.7).isActive = true
        
        addSubview(txtCompanyName)
        
        txtCompanyName.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10).isActive = true
        txtCompanyName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        txtCompanyName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        txtCompanyName.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    
}
