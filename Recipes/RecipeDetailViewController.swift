//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by Alex on 5/6/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    // MARK: Constants
    var recipe: Recipe? {
        didSet{
            updateViews()
        }
    }
    
    // MARK: Outlets
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var titleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: Functions
    
    func updateViews(){
        guard let myRecipe = recipe, isViewLoaded else {return}
        titleLbl.text = myRecipe.name
        textView.text = myRecipe.instructions
    }
}
