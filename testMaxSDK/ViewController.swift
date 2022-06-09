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
        createMRECAd()
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

        func createMRECAd()
        {
            adView = MAAdView(adUnitIdentifier: "YOUR_AD_UNIT_ID", adFormat: MAAdFormat.mrec)
            adView.delegate = self
        
            // MREC width and height are 300 and 250 respectively, on iPhone and iPad
            let height: CGFloat = 250
            let width: CGFloat = 300
        
            adView.frame = CGRect(x: 50, y: 50, width: width, height: height)
        
            // Center the MREC
            adView.center.x = view.center.x
        
            // Set background or background color for MREC ads to be fully functional
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

