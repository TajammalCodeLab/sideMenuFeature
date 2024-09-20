//
//  ViewController.swift
//  sideMenuFeature
//
//  Created by SID on 28/08/2024.
//

import UIKit
import Firebase
import CoreLocation
import MapKit
import SideMenu

class DashboardViewController: BaseViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var collectionViewDB: UICollectionView!
    @IBOutlet weak var pageIndicator: UIPageControl!
   
    
    // MARK: Variables
    var GRDNTimages = ["image_1","image_2","image_3","image_4","image_5" ]
    var currentIndex = 0
    var time: Timer?
    
    
    // MARK: life Cycle and override Function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        time = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToRight), userInfo: nil, repeats: true)
        pageIndicator.numberOfPages = GRDNTimages.count
        
        
        
        
    }
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

    
    // MARK: IBAction
    
    
    // MARK: OBJ
    @objc func slideToRight(){
        if currentIndex < GRDNTimages.count - 1 {
            currentIndex = currentIndex + 1
        } else{
            currentIndex = 0
        }
        pageIndicator.currentPage = currentIndex
        collectionViewDB.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .right, animated: true)
    }
    
    // MARK: Methods
    private func timeForSlide(){
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToRight), userInfo: nil, repeats: true)
    }
    
}

// MARK: Extentions
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionViewDB.frame.width, height: collectionViewDB.frame.height)
    }
    
}


