//
//  ViewController.swift
//  sideMenuFeature
//
//  Created by SID on 28/08/2024.
//

import UIKit
import Firebase

class DashboardViewController: BaseViewController {
    
    @IBOutlet weak var collectionViewDB: UICollectionView!
    
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var pageIndicator: UIPageControl!
    
    var GRDNTimages = ["image_1","image_2","image_3","image_4","image_5" ]
    var currentIndex = 0
    var time: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        time = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToRight), userInfo: nil, repeats: true)
        pageIndicator.numberOfPages = GRDNTimages.count
        //timeForSlide()
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func signOutBtn(_ sender: UIButton) {
        try? Auth.auth().signOut()
        self.popToRootViewController()
    }
    
    @objc func slideToRight(){
        if currentIndex < GRDNTimages.count - 1 {
            currentIndex = currentIndex + 1
        } else{
            currentIndex = 0
        }
        pageIndicator.currentPage = currentIndex
        collectionViewDB.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .right, animated: true)
    }
    
    private func timeForSlide(){
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToRight), userInfo: nil, repeats: true)
    }
    
}

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GRDNTimages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewDB.dequeueReusableCell(withReuseIdentifier: "cellIDForCollectionView", for: indexPath) as! ImageCollectionViewCell
        cell.imageCell.image = UIImage(named: GRDNTimages[indexPath.row])
        cell.layer.cornerRadius = CGFloat(10)
        return cell
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionViewDB.frame.width, height: collectionViewDB.frame.height)
//    }
    
}

