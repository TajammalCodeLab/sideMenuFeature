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

class DashboardViewController: BaseViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var collectionViewDB: UICollectionView!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var map: MKMapView!
    
    // MARK: Variables
    var GRDNTimages = ["image_1","image_2","image_3","image_4","image_5" ]
    var currentIndex = 0
    var time: Timer?
    var locationManager: CLLocationManager?
    
    // MARK: life Cycle and override Function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// For Side menu
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        time = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToRight), userInfo: nil, repeats: true)
        pageIndicator.numberOfPages = GRDNTimages.count
        //timeForSlide()
        
        
        /// For location
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        checkIfLocationServicesEnable()
       
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: IBAction
    @IBAction func signOutBtn(_ sender: UIButton) {
        try? Auth.auth().signOut()
        self.popToRootViewController()
    }
    
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
    
    private func checkIfLocationServicesEnable(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager?.requestWhenInUseAuthorization()
            locationManager?.startUpdatingLocation()
        }
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
extension DashboardViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: locations[0].coordinate, span: span)
        map.setRegion(region, animated: true)
        map.showsUserLocation = true
    }
}

