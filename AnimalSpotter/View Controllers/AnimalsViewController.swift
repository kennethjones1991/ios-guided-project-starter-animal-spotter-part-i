//
//  AnimalsViewController.swift
//  AnimalSpotter
//
//  Created by Scott Gardner on 4/4/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

final class AnimalsViewController: UIViewController {
    enum CellIdentifier: String {
        case animalCell = "AnimalCell"
    }
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private lazy var viewModel = AnimalsViewModel()
    private lazy var dataSource = makeDataSource()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case AnimalDetailViewController.identifier:
            break
        case LoginViewController.identifier:
            break
        default:
            break
        }
    }
    
    // MARK: - Actions
    
    @IBAction func getAnimals(_ sender: UIBarButtonItem) {
        
    }
}

// MARK: - UITableViewDiffableDataSource

extension AnimalsViewController {
    enum Section {
        case main
    }
    
    private func makeDataSource() -> UITableViewDiffableDataSource<Section, Animal> {
        UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, animal in
            let cell = tableView
                .dequeueReusableCell(withIdentifier: CellIdentifier.animalCell.rawValue,
                                     for: indexPath)
            
            cell.textLabel?.text = animal.name
            return cell
        }
    }
    
    private func update() {
        activityIndicator.stopAnimating()
        var snapshot = NSDiffableDataSourceSnapshot<Section, Animal>()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.animals)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
