//
//  BudgetViewController.swift
//  Platzi Finanzas
//
//  Created by David Yepes Buitrago on 1/14/20.
//  Copyright © 2020 David Yepes Buitrago. All rights reserved.
//

import UIKit

class BudgetViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var animationbuttons: [UIButton]!
    @IBOutlet weak var animationLayout: NSLayoutConstraint!
    
    @IBAction
    func animateHeader(sender: UIButton){
        animationLayout.constant = sender.frame.origin.x
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        }){(completed) in
            self.animationbuttons.forEach{
                $0.setTitleColor(UIColor(named: "Primary Text Color Cells" ), for: .normal)
            }
            sender.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
    fileprivate(set) lazy var emptyStateview: UIView = {
        guard let view = Bundle.main.loadNibNamed("EmptyState", owner: nil, options: [:])?.first as? UIView else {
            return UIView()
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let cell = UINib(nibName: "TransactionCell", bundle: Bundle.main)
        tableView.register(cell, forCellReuseIdentifier: "cell")
    }
    
}


extension BudgetViewController: UITableViewDelegate{
    
}

extension BudgetViewController: UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 50
        tableView.backgroundView = count==0 ? emptyStateview : nil
        tableView.separatorStyle = count==0 ? .none : .singleLine
        return count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
    }
    
    
}
