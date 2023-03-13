//
//  ViewController.swift
//  SwiftMarathon5
//
//  Created by Anton Charny on 13/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var presentButton: UIButton!
    
    private lazy var popoverController = SecondController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.popoverController.modalPresentationStyle = .popover
    }
    
    
    @IBAction func presentAction(_ sender: UIButton) {
        if self.popoverController.popoverPresentationController?.presentingViewController == nil {
            let popoverPresentationController = self.popoverController.popoverPresentationController
            popoverPresentationController?.delegate = self
            popoverPresentationController?.permittedArrowDirections = .up
            popoverPresentationController?.sourceView = sender
            
            self.present(self.popoverController, animated: true)
        }
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        print(presentationController)
    }
}
