//
//  MainViewController.swift
//  Recipes
//
//  Created by Alex on 5/6/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: Constants
    
    private let networkClient = RecipesNetworkClient()
    var allRecipes: [Recipe] = [] {
        didSet{
            filterRecipes()
        }
    }
    var recipesTableViewController: RecipesTableViewController? {
        didSet {
            recipesTableViewController?.recipes = filteredRecipes
        }
    }
    var filteredRecipes: [Recipe] = [] {
        didSet {
            recipesTableViewController?.recipes = filteredRecipes
        }
    }
    
    // MARK: Outlets
    
    @IBOutlet var textField: UITextField!
    
    // MARK: Actions
    
    @IBAction func textFieldEndAction(_ sender: UITextField) {
        sender.resignFirstResponder()
        filterRecipes()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Network request
        networkClient.fetchRecipes { (recipes, error) in
            if let error = error {
                print(error, "There was an error.")
                return
            }
            DispatchQueue.main.async {
                self.allRecipes = recipes ?? []
            }
        }
    }
    
    // MARK: Functions
    
    private func filterRecipes(){
        guard let searchTerm = textField.text, searchTerm.count > 0 else {
            filteredRecipes = allRecipes
            return
        }
        var sortedRecipes = allRecipes.filter { $0.name.contains(searchTerm) || $0.instructions.contains(searchTerm) }
        filteredRecipes = sortedRecipes
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TableViewSegue" {
            recipesTableViewController = (segue.destination as! RecipesTableViewController)
        }
    }

}
