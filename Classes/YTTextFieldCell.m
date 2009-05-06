//
//  YTTextFieldCell.m
//  YourTurn
//
//  Created by Masashi Ono on 09/05/06.
//

#import "YTTextFieldCell.h"


@implementation YTTextFieldCell

#pragma mark property

- (NSString *)label
{
    return label.text;
}

- (void)setLabel:(NSString *)aLabel
{
    label.text = aLabel;
}

- (NSString *)value
{
    return textField.text;
}

- (void)setValue:(NSString *)aValue
{
    textField.text = aValue;
}

- (NSString *)placeholder
{
    return textField.placeholder;
}

- (void)setPlaceholder:(NSString *)aPlaceholder
{
    textField.placeholder = aPlaceholder;
}

- (CGFloat)height
{
    return 44.0;
}

# pragma mark init, dealloc, memory management

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier])
    {
        // Create label
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.textAlignment = UITextAlignmentLeft;
        [self addSubview:label];
        
        // Create text field
        textField = [[UITextField alloc] initWithFrame:CGRectZero];
        textField.delegate = self;
        textField.keyboardType = UIKeyboardTypeDefault;
        textField.returnKeyType = UIReturnKeyDone;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        textField.textColor = [UIColor blackColor];
        [self addSubview:textField];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)dealloc
{
    [textField release];
    [label release];
    [super dealloc];
}

# pragma mark TableCell method

- (void)layoutSubviews
{
    label.frame = CGRectMake(25, 12, 115, 24);
    textField.frame = CGRectMake(120, 12, 180, 24);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

# pragma mark UITextField method

- (BOOL)textFieldShouldBeginEditing:(UITextField *)aTextField
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)aTextField
{
    [aTextField resignFirstResponder];
    return YES;
}

# pragma mark IBAction

- (IBAction)focus:(id)sender
{
    [textField becomeFirstResponder];
}

@end