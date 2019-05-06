//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by Alex on 5/6/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    var recipe: Recipe? {
        didSet{
            updateViews()
        }
    }
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var titleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews(){
        guard let myRecipe = recipe, isViewLoaded else {return}
        titleLbl.text = myRecipe.name
        textView.text = myRecipe.instructions
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
