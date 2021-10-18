//
//  SlideController.swift
//  CompanyPreentation
//
//  Created by Burak İmdat on 17.10.2021.
//

import Foundation
import UIKit

class SlideController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
   
//    let images = ["google", "amazon", "facebook", "instagram", "apple"]
//    let titles = ["Ailemizin arama motoru - Google", "Dünyanın en büyük ürün yelpazesi - Amazon", "Sosyal medya sitesi - Facebook", "Fotoğraflarınızın en güzel durduğu yer - Instagram", "Yeniliklerle dolu dünya - Apple"]
    let pages = [
        Page(imageName: "google", title: "Ailemizin arama motoru - Google",description: "İnternet araması, çevrimiçi bilgi dağıtımı, reklam teknolojileri ve arama motorları için yatırımlar yapan çok uluslu Amerikan anonim şirketidir. İnternet tabanlı hizmet ve ürünler geliştirir"),
        Page(imageName: "amazon", title: "Dünyanın en büyük ürün yelpazesi - Amazon",description: "Amazon Amerika Birleşik Devletleri merkezli bir e-ticaret ve bulut bilişim şirketidir. Jeff Bezos tarafından 5 Temmuz 1994'te Amerika Birleşik Devletleri'nin Seattle şehrinde kurulmuştur. Gerek toplam satış hacmi, gerekse piyasa hacmi olarak dünyanın en büyük alışveriş sitesidir"),
        Page(imageName: "facebook", title: "Sosyal medya sitesi - Facebook",description: "Facebook insanların başka insanlarla iletişim kurmasını ve bilgi alışverişi yapmasını amaçlayan sosyal ağdır. 4 Şubat 2004 tarihinde Harvard Üniversitesi 2006 devresi öğrencilerinden olan Marc Zuckerberg tarafından kurulan Facebook, öncelikle Harvard öğrencileri adına kurulmuştu"),
        Page(imageName: "instagram", title: "Fotoğraflarınızın en güzel durduğu yer - Instagram", description: "Instagram Sosyal medyada ücretsiz fotoğraf ve video paylaşma uygulaması. Ekim 2010'da kullanıcılarına çektikleri bir fotoğraf üzerinde  dijital filtre kullanma ve bu fotoğrafı Instagram'ında dahil olduğu, sosyal medya servisleri ile paylaşma imkanı tanımıştır."),
        Page(imageName: "apple", title: "Yeniliklerle dolu dünya - Apple", description: "Apple merkezi Cupertino'da bulunan; tüketici elektroniği bilgisayar yazılımı ve kişisel bilgisayarlar tasarlayan, geliştiren ve satan Amerikan çok uluslu şirketidir")
    ]
    let btnBefore: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Before", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.setTitleColor(.darkGray, for: .normal)
        btn.addTarget(self, action: #selector(btnBeforeClicked), for: .touchUpInside)
        return btn
    }()
    
    let btnAfter: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("After", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.setTitleColor(.customRed, for: .normal)
        btn.addTarget(self, action: #selector(btnAfterClicked), for: .touchUpInside)
        return btn
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pControl = UIPageControl()
        pControl.currentPage = 0
        pControl.numberOfPages = pages.count
        pControl.currentPageIndicatorTintColor = UIColor.customRed
        pControl.pageIndicatorTintColor = UIColor.lightRed
        return pControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonControl()
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PageCell
//        cell.googleImage.image = UIImage(named: pages[indexPath.row].imageName)
//        cell.txtCompanyName.text = pages[indexPath.row].title
        cell.page = Page(imageName: pages[indexPath.row].imageName, title: pages[indexPath.row].title, description: pages[indexPath.row].description)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate { _ in
            self.collectionViewLayout.invalidateLayout()
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        } completion: { _ in
            return
        }

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
    
    @objc private func btnAfterClicked(){
        pageControl.currentPage += 1
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func btnBeforeClicked(){
        pageControl.currentPage -= 1
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
