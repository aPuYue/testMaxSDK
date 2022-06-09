//
//  ViewController.swift
//  testMaxSDK
//
//  Created by Pu Yue - PU YUE on 2022/06/08.
//

import UIKit
import AppLovinSDK

class ViewController: UIViewController, MAAdViewAdDelegate, MARewardedAdDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createRewardedAd()
    }

    @IBAction func click(_ sender: Any) {
        if rewardedAd.isReady
        {
            rewardedAd.show()
        }
    }
    
    var rewardedAd: MARewardedAd!
        var retryAttempt = 0.0

        func createRewardedAd()
        {
            rewardedAd = MARewardedAd.shared(withAdUnitIdentifier: "YOUR_AD_UNIT_ID")
            rewardedAd.delegate = self

            // Load the first ad
            rewardedAd.load()
        }

        // MARK: MAAdDelegate Protocol

        func didLoad(_ ad: MAAd)
        {
            // Rewarded ad is ready to be shown. '[self.rewardedAd isReady]' will now return 'YES'
            
            // Reset retry attempt
            retryAttempt = 0
        }

        func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError)
        {
            // Rewarded ad failed to load
            // We recommend retrying with exponentially higher delays up to a maximum delay (in this case 64 seconds)
            
            retryAttempt += 1
            let delaySec = pow(2.0, min(6.0, retryAttempt))
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delaySec) {
                self.rewardedAd.load()
            }
        }

        func didDisplay(_ ad: MAAd) {}

        func didClick(_ ad: MAAd) {}

        func didHide(_ ad: MAAd)
        {
            // Rewarded ad is hidden. Pre-load the next ad
            rewardedAd.load()
        }

        func didFail(toDisplay ad: MAAd, withError error: MAError)
        {
            // Rewarded ad failed to display. We recommend loading the next ad
            rewardedAd.load()
        }

        // MARK: MARewardedAdDelegate Protocol

    @objc(didStartRewardedVideoForAd:) func didStartRewardedVideo(for ad: MAAd) {}

    @objc(didCompleteRewardedVideoForAd:) func didCompleteRewardedVideo(for ad: MAAd) {}

    @objc(didRewardUserForAd:withReward:) func didRewardUser(for ad: MAAd, with reward: MAReward)
        {
            // Rewarded ad was displayed and user should receive the reward
        }
    
    func didExpand(_ ad: MAAd) {
        
    }
    
    func didCollapse(_ ad: MAAd) {
        
    }
    
    
}

