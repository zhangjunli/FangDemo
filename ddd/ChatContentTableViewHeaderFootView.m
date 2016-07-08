//
//  ChatContentTableViewHeaderFootView.m
//  ddd
//
//  Created by mac on 16/4/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ChatContentTableViewHeaderFootView.h"
#define FOOTHEADERIDENTIFIER @"foot_header"
#define POINT_LABEL_WIDTH          5
#define LABEL_MARGIN               5
#define BUTTON_WIDTH               35
#define BUTTON_TOP_BOTTOM_MARGIN   3
#define BUTTON_RIGHT_MARGIN        10
#define BUTTON_CORNER_RADIUS       1

@implementation ChatContentTableViewHeaderFootView

+ (instancetype)createFootHeaderViewWithDictionary:(NSMutableDictionary *)dic inTable:(UITableView *)tableView{
    
    static NSString * identifier = FOOTHEADERIDENTIFIER;
    ChatContentTableViewHeaderFootView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!header) {
        header = [[ChatContentTableViewHeaderFootView alloc] initWithReuseIdentifier:identifier];
    }
    header.askLabel.text = [dic objectForKey:ASK];
    header.anwserLabel.text = [dic objectForKey:ANWSER];
    header.stateLabel.text = [dic objectForKey:STATE];
    
    return header;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        _askLabel = [[UILabel alloc] init];
        _askLabel.font = [UIFont systemFontOfSize:13];
        _askLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_askLabel];
        
        _pointLabel = [[UILabel alloc] init];
        _pointLabel.font = [UIFont systemFontOfSize:13];
        _pointLabel.textColor = [UIColor lightGrayColor];
        _pointLabel.text = @"-";
        [self addSubview:_pointLabel];
        
        _anwserLabel = [[UILabel alloc] init];
        _anwserLabel.font = [UIFont systemFontOfSize:13];
        _anwserLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_anwserLabel];
        
        _stateLabel = [[UILabel alloc] init];
        _stateLabel.font = [UIFont systemFontOfSize:13];
        _stateLabel.textColor = [UIColor lightGrayColor];
        _stateLabel.text = @"state";
        [self addSubview:_stateLabel];
        
        _lastNewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _lastNewBtn.layer.borderColor = [UIColor redColor].CGColor;
        _lastNewBtn.layer.borderWidth = 1;
        _lastNewBtn.layer.masksToBounds = YES;
        _lastNewBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_lastNewBtn setTitle:@"最新" forState:UIControlStateNormal];
        [_lastNewBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_lastNewBtn setBackgroundColor:[UIColor redColor]];
        [_lastNewBtn addTarget:self action:@selector(lastNewBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_lastNewBtn];
        
        _lastHotBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _lastHotBtn.layer.borderColor = [UIColor redColor].CGColor;
        _lastHotBtn.layer.borderWidth = 1;
        _lastHotBtn.layer.masksToBounds = YES;
        _lastHotBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_lastHotBtn setTitle:@"最热" forState:UIControlStateNormal];
        [_lastHotBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_lastHotBtn setBackgroundColor:[UIColor whiteColor]];
        [_lastHotBtn addTarget:self action:@selector(lastHotBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_lastHotBtn];
    }
    return self;
}

- (void)lastNewBtnClick{
    NSLog(@"lastNewBtnClick");
}

- (void)lastHotBtnClick{
    NSLog(@"lastHotBtnClick");
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"drawRect");
    
    CGSize askSize = [self.askLabel.text sizeWithAttributes:@{NSFontAttributeName : self.askLabel.font}];
    self.askLabel.frame = CGRectMake(10, 0, askSize.width, self.frame.size.height);
    
    self.pointLabel.frame = CGRectMake(CGRectGetMaxX(self.askLabel.frame) + LABEL_MARGIN, 0, POINT_LABEL_WIDTH, self.frame.size.height);
    
    CGSize anwserSize = [self.anwserLabel.text sizeWithAttributes:@{NSFontAttributeName : self.anwserLabel.font}];
    self.anwserLabel.frame = CGRectMake(CGRectGetMaxX(self.pointLabel.frame) + LABEL_MARGIN, 0, anwserSize.width, self.frame.size.height);
    
    CGSize stateSize = [self.stateLabel.text sizeWithAttributes:@{NSFontAttributeName : self.stateLabel.font}];
    self.stateLabel.frame = CGRectMake(CGRectGetMaxX(self.anwserLabel.frame) + LABEL_MARGIN, 0, stateSize.width, self.frame.size.height);
    
    self.lastNewBtn.frame = CGRectMake(self.frame.size.width - BUTTON_RIGHT_MARGIN - 2*BUTTON_WIDTH, BUTTON_TOP_BOTTOM_MARGIN, BUTTON_WIDTH, self.frame.size.height - 2*BUTTON_TOP_BOTTOM_MARGIN);
    self.lastNewBtn.layer.cornerRadius = 1;
    
    self.lastHotBtn.frame = CGRectMake(CGRectGetMaxX(self.lastNewBtn.frame), self.lastNewBtn.frame.origin.y, BUTTON_WIDTH, self.lastNewBtn.frame.size.height);
    self.lastHotBtn.layer.cornerRadius = 1;
}

@end
