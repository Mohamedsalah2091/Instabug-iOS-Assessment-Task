








import UIKit

class FilmDesignCell: UITableViewCell  {
    
    // MARK: - UiView Variable
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var filmOverview: UITextView!
    @IBOutlet weak var date: UILabel!
    
    // MARK: - Awake From Nib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}

