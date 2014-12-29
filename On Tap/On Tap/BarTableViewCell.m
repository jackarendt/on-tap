//
//  BarTableViewCell.m
//  On Tap
//
//  Created by Jack Arendt on 12/23/14.
//  Copyright (c) 2014 John Arendt. All rights reserved.
//

#import "BarTableViewCell.h"
#import "OTConstants.h"

@interface BarTableViewCell ()
@property (nonatomic, strong) UILabel *barName;
@property (nonatomic, strong) UIImageView *barImageView;
@property (nonatomic, strong) UIImage *coverImage;

@property (nonatomic, strong) ProgressBar *progressBar;
@end

@implementation BarTableViewCell


//-(id)initWithCoder:(NSCoder *)aDecoder {
//    self = [super initWithCoder:aDecoder];
//    if(self) {
//        [self createView];
//    }
//    return self;
//}
//
//-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if(self) {
//    }
//    
//    return self;
//}

/**
 ** Creates the view, adds subviews to the tableview cell
 **/
-(void)createView:(float)capacity{
    if(!self.barName) {
        CGSize textSize = [self.name sizeWithAttributes:@{NSFontAttributeName:[UIFont fontWithName:mainFont size:21.0]}];
        CGFloat strikeWidth = textSize.width;
        self.barName = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, strikeWidth + 20, 30)];
        self.barName.font = [UIFont fontWithName:mainFont size:21.0];
        [self addSubview:self.barName];
    }

    if(!self.progressBar) {
        self.progress = capacity;
        self.progressBar = [[ProgressBar alloc] initWithFrame:CGRectMake(100, 50, self.bounds.size.width-140, 25) progress:self.progress];
        [self addSubview:self.progressBar];
    }
    
    if(!self.barImageView) {
        self.barImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 75, 75)];
        self.barImageView.layer.cornerRadius = 37.5;
        self.barImageView.clipsToBounds = YES;
//        self.barImageView.layer.borderColor = [UIColor colorWithRed:secondaryRed green:secondaryGreen blue:secondaryBlue alpha:1.0].CGColor;
//        self.barImageView.layer.borderWidth = 5.0f;
        [self addSubview:self.barImageView];
    }
    
    self.barName.text = self.name;
    self.barImageView.image = [UIImage imageNamed:self.barImageString];
    [self.progressBar updateProgress:capacity];

}

//Updates value of the progress bar
-(void)setCapacity:(float)capacity {
    [self.progressBar updateProgress:capacity];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
