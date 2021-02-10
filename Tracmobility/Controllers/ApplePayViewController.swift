//
//  ApplePayViewController.swift
//  Tracmobility
//
//  Created by Emil Vaklinov on 10/02/2021.
//

import UIKit
import PassKit

class ApplePayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        applePayController.delegate = self
        // Do any additional setup after loading the view.
    }

    
    @IBAction func purchaseItem(_ sender: Any) {
        
        let request = PKPaymentRequest()
        
        request.merchantIdentifier = "merchant.net.mobindustry.likeMe"
        
        request.supportedNetworks = [PKPaymentNetwork.visa, PKPaymentNetwork.masterCard, PKPaymentNetwork.amex]
        
        request.merchantCapabilities = PKMerchantCapability.capability3DS
        
        request.countryCode = "US"
        
        request.currencyCode = "USD"
        
        request.paymentSummaryItems = [
        
        PKPaymentSummaryItem(label: "Some Product", amount: 9.99)
        
        ]
        
        let applePayController = PKPaymentAuthorizationViewController(paymentRequest: request)
        
        self.present(applePayController!, animated: true, completion: nil)
        
    }

}

extension ApplePayViewController:
    
    PKPaymentAuthorizationViewControllerDelegate{
    
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        
        controller.dismiss(animated: true, completion: nil)
        
    }
    
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        
        completion(PKPaymentAuthorizationResult(status: PKPaymentAuthorizationStatus.success, errors: []))
        
    }
    
}
