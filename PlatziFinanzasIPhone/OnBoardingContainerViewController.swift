//
//  OnBoardingContainerViewController.swift
//  Platzi Finanzas
//
//  Created by David Yepes Buitrago on 12/10/19.
//  Copyright © 2019 David Yepes Buitrago. All rights reserved.
//

import UIKit

class OnBoardingContainerViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller
        
        guard segue.identifier == "openOnBoarding", let destination = segue.destination as? OnBoardingViewController else{
            return
        }
        
        destination.pageControl = self.pageControl
    }
 

}
