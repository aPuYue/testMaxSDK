//
//  ViewController.swift
//  testMaxSDK
//
//  Created by Pu Yue - PU YUE on 2022/06/08.
//

import UIKit
import AppLovinSDK

class ViewController: UIViewController, MAAdViewAdDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createBannerAd()
    }

    @IBAction func show(_ sender: Any) {
        adView.isHidden = false
        adView.startAutoRefresh()
    }
    @IBAction func hide(_ sender: Any) {
        adView.isHidden = true
        adView.stopAutoRefresh()
    }
    
    var adView: MAAdView!

        func createBannerAd()
        {
            adView = MAAdView(adUnitIdentifier: "YOUR_AD_UNIT_ID")
            adView.delegate = self
        
            // Banner height on iPhone and iPad is 50 and 90, respectively
            let height: CGFloat = (UIDevice.current.userInterfaceIdiom == .pad) ? 90 : 50
        
            // Stretch to the width of the screen for banners to be fully functional
            let width: CGFloat = UIScreen.main.bounds.width
        
            adView.frame = CGRect(x: 0, y: 100, width: width, height: height)
        
            // Set background or background color for banner ads to be fully functional
            adView.backgroundColor = .orange
        
            view.addSubview(adView)
        
            // Load the first ad
            adView.loadAd()
        }

        // MARK: MAAdDelegate Protocol

        func didLoad(_ ad: MAAd) {}

        func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) {}

        func didClick(_ ad: MAAd) {}

        func didFail(toDisplay ad: MAAd, withError error: MAError) {}

        // MARK: MAAdViewAdDelegate Protocol

        func didExpand(_ ad: MAAd) {}

        func didCollapse(_ ad: MAAd) {}

        // MARK: Deprecated Callbacks

        func didDisplay(_ ad: MAAd) { /* DO NOT USE - THIS IS RESERVED FOR FULLSCREEN ADS ONLY AND WILL BE REMOVED IN A FUTURE SDK RELEASE */ }
        func didHide(_ ad: MAAd) { /* DO NOT USE - THIS IS RESERVED FOR FULLSCREEN ADS ONLY AND WILL BE REMOVED IN A FUTURE SDK RELEASE */ }
    
}

