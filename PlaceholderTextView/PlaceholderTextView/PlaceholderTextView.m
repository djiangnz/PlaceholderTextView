//
//  PlaceholderTextView.m
//  PlaceholderTextView
//
//  Created by dianyi jiang on 11/10/15.
//  Copyright © 2015 dianyi jiang. All rights reserved.
//

#import "PlaceholderTextView.h"

@interface PlaceholderTextView ()

@property (nonatomic, strong) UILabel *placeholder;

@end

@implementation PlaceholderTextView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (![self hasText]) {
        
        if (!self.font) {
            
            self.font = [UIFont systemFontOfSize:15];
        }
        
        CGSize textSize = [self.placeholder.text boundingRectWithSize:CGSizeMake(self.frame.size.width, self.font.lineHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
        
        self.placeholder.frame = (CGRect){{6, 7}, textSize};
    }
}

- (void)dealloc {
    
    [self.placeholder removeFromSuperview];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - property update

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    
    self.placeholder.font = font;
}

- (void)setPlaceholderText:(NSString *)placeholderText {
    
    _placeholderText = placeholderText;
    self.placeholder.text = placeholderText;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    
    _placeholderColor = placeholderColor;
    self.placeholder.textColor = placeholderColor;
}

#pragma mark - private methods

- (void)textDidChange {
    
    if ([self hasText]) {
        self.placeholder.alpha = 0;
    } else {
        self.placeholder.alpha = 1;
    }
}

#pragma mark - lazy init

- (UILabel *)placeholder {
    
    if (!_placeholder) {
        _placeholder = [[UILabel alloc] init];
        _placeholder.textAlignment = NSTextAlignmentCenter;
        _placeholder.numberOfLines = 0;
        _placeholder.text = @"placeholder";
        _placeholder.textColor = [UIColor lightGrayColor];
        [self addSubview: _placeholder];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
    }
    return _placeholder;
}

@end
