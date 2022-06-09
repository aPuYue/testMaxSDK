//
//  ViewController.swift
//  testMaxSDK
//
//  Created by Pu Yue - PU YUE on 2022/06/08.
//

import UIKit
import AppLovinSDK

class ViewController: UIViewController, MAAdDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createInterstitialAd()
    }

    @IBAction func click(_ sender: Any) {
        if interstitialAd.isReady
        {
            interstitialAd.show()
        }
    }
    
    var interstitialAd: MAInterstitialAd!
    var retryAttempt = 0.0
    
    func createInterstitialAd()
    {
        interstitialAd = MAInterstitialAd(adUnitIdentifier: "YOUR_AD_UNIT_ID")//TODO
        interstitialAd.delegate = self
        
        // Load the first ad
        interstitialAd.load()
    }
    
    // MARK: MAAdDelegate Protocol
    
    func didLoad(_ ad: MAAd)
    {
        // Interstitial ad is ready to be shown. 'interstitialAd.isReady' will now return 'true'
        
        // Reset retry attempt
        retryAttempt = 0
    }
    
    func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError)
    {
        // Interstitial ad failed to load
        // We recommend retrying with exponentially higher delays up to a maximum delay (in this case 64 seconds)
        
        retryAttempt += 1
        let delaySec = pow(2.0, min(6.0, retryAttempt))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delaySec) {
            self.interstitialAd.load()
        }
    }
    
    func didDisplay(_ ad: MAAd) {}
    
    func didClick(_ ad: MAAd) {}
    
    func didHide(_ ad: MAAd)
    {
        // Interstitial ad is hidden. Pre-load the next ad
        interstitialAd.load()
    }
    
    func didFail(toDisplay ad: MAAd, withError error: MAError)
    {
        // Interstitial ad failed to display. We recommend loading the next ad
        interstitialAd.load()
    }
    
}

