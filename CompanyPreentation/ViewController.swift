//
//  ViewController.swift
//  CompanyPreentation
//
//  Created by Burak İmdat on 14.10.2021.
//

import UIKit

class ViewController: UIViewController {

    let googleImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "google"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let txtCompanyName: UITextView = {
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
    
    let btnBefore: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Before", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.setTitleColor(.darkGray, for: .normal)
        return btn
    }()
    
    let btnAfter: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("After", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.setTitleColor(.customRed, for: .normal)
        return btn
    }()
    
    private let pageControl: UIPageControl = {
        let pControl = UIPageControl()
        pControl.currentPage = 0
        pControl.numberOfPages = 5
        pControl.currentPageIndicatorTintColor = UIColor.customRed
        pControl.pageIndicatorTintColor = UIColor.lightRed
        return pControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(txtCompanyName)
        buttonControl()
        setLayout()
    }

    private func buttonControl() {
       
        let buttonStackView = UIStackView(arrangedSubviews: [btnBefore, pageControl, btnAfter])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.distribution = .fillEqually
        view.addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setLayout(){
        let topView = UIView()
        view.addSubview(topView)
        topView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        topView.addSubview(googleImage)
        googleImage.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        googleImage.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        googleImage.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.7).isActive = true
        
        txtCompanyName.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10).isActive = true
        txtCompanyName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        txtCompanyName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        txtCompanyName.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}

extension UIColor {
    static var customRed = UIColor(red: 229/255, green: 70/255, blue: 129/255, alpha: 1)
    static var lightRed = UIColor(red: 250/255, green: 210/255, blue: 215/255, alpha: 1)
}
