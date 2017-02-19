
//

import UIKit

class customButton: UIButton {
    
    @IBInspectable var selectedBackgroundColor :UIColor?
    @IBInspectable var nonSelectedBackgroundColor :UIColor?
    
    override var isSelected :Bool {
        didSet {
            self.backgroundColor =  isSelected ? selectedBackgroundColor : nonSelectedBackgroundColor
        }
    }


}
