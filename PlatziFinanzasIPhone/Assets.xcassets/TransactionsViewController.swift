//
//  TransactionsViewController.swift
//  Platzi Finanzas
//
//  Created by David Yepes Buitrago on 12/11/19.
//  Copyright © 2019 David Yepes Buitrago. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
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


extension TransactionsViewController: UITableViewDelegate{
    
}

extension TransactionsViewController: UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 0
        tableView.backgroundView = count==0 ? emptyStateview : nil
        tableView.separatorStyle = count==0 ? .none : .singleLine
        return count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
    }
    
    
}
