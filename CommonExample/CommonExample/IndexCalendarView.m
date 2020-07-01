//
//  IndexCalendarView.m
//  CommonExample
//
//  Created by babyzzz on 2020/7/1.
//  Copyright © 2020 sisyphe.cn. All rights reserved.
//

#import "IndexCalendarView.h"

@interface IndexCalendarView()
@property (nonatomic,strong)UILabel *weekdayLabel;
@property (nonatomic,strong)UILabel *holidayLabel;
@property (nonatomic,strong)UILabel *dayLabel;
@property (nonatomic,strong)UILabel *descLabel;
@property (nonatomic,assign)CGFloat maxFontSize;
@property (nonatomic,assign)CGFloat minFontSize;
@property (nonatomic,assign)CGFloat textFontSize;
@property (nonatomic,assign)CGFloat oldDayY;
@property (nonatomic,assign)CGFloat oldDayX;
@end
@implementation IndexCalendarView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.maxFontSize = 70;
        self.minFontSize = 20;
        self.textFontSize = 15;
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    [self addSubview:self.weekdayLabel];
    [self addSubview:self.holidayLabel];
    [self addSubview:self.dayLabel];
    [self addSubview:self.descLabel];
    //lable sizeToFit s偶有卡顿 [self.weekdayLabel sizeToFit];
}

- (void)setModel:(id)model
{
    _model = model;
    self.weekdayLabel.text = @"1/  S A T U R D A Y";
    self.holidayLabel.text = @"七月1日建党日";
    self.dayLabel.text = @"28";
    self.descLabel.text = @"风景都是一样的，因为风景中最要紧的事距离和空气。";
    [self setUIFrame];
}

- (void)setUIFrame
{
    NSAttributedString *weekdayAttText = [self weekDayAttributedStringWithString:self.weekdayLabel.text otherString:@"S A T U R D A Y"];
    NSAttributedString *holidayAttText =[self attributedStringWithString:self.holidayLabel.text font:[UIFont systemFontOfSize:self.textFontSize-2] textColor:[UIColor yellowColor]];
    NSAttributedString *dayText = [self attributedStringWithString:self.dayLabel.text font:[UIFont systemFontOfSize:self.maxFontSize] textColor:[UIColor blackColor]];
    NSAttributedString *desLAttText = [self desLAttributedStringWithString:self.descLabel.text lineSpace:5 font:[UIFont systemFontOfSize:self.textFontSize] textColor:[UIColor blackColor]];
    
    self.weekdayLabel.attributedText = weekdayAttText;
    self.holidayLabel.attributedText = holidayAttText;
    self.dayLabel.attributedText = dayText;
    self.descLabel.attributedText = desLAttText;
    [self setNeedsLayout];
    
    self.weekdayLabel.backgroundColor =[ [UIColor blueColor] colorWithAlphaComponent:0.1];
    self.holidayLabel.backgroundColor =[ [UIColor blueColor] colorWithAlphaComponent:0.1];
    self.dayLabel.backgroundColor =[ [UIColor blueColor] colorWithAlphaComponent:0.1];
    self.descLabel.backgroundColor =[ [UIColor blueColor] colorWithAlphaComponent:0.1];
    
    CGSize weekdaySize = [self dynamicCalculationLabelHightText:weekdayAttText width:200];
    CGSize holidaySize = [self dynamicCalculationLabelHightText:holidayAttText width:200];
    CGSize daySize = [self dynamicCalculationLabelHightText:dayText width:200];
    CGSize desLSize = [self dynamicCalculationLabelHightText:desLAttText width:[UIScreen mainScreen].bounds.size.width-100];
    
    
    self.weekdayLabel.frame = CGRectMake((self.width-30-weekdaySize.width)/2, 50,  weekdaySize.width, weekdaySize.height);
    
    self.holidayLabel.frame = CGRectMake((self.width-30-holidaySize.width)/2, self.weekdayLabel.bottom+20, holidaySize.width, holidaySize.height);
    
    self.dayLabel.frame = CGRectMake( (self.width-30-daySize.width)/2, self.holidayLabel.bottom+20, daySize.width,  daySize.height);

    self.descLabel.frame = CGRectMake(50, self.dayLabel.bottom+20, self.width-30-100,  desLSize.height);
    
    self.oldDayY = self.dayLabel.top;
    self.oldDayX = self.dayLabel.left;
}

#pragma mark - Lazy
- (UILabel *)weekdayLabel
{
    if(_weekdayLabel == nil)
    {
        _weekdayLabel = [[UILabel alloc] init];
        _weekdayLabel.text = @"1/  S A T U R D A Y";
    }
    return _weekdayLabel;
}

- (UILabel *)holidayLabel
{
    if(_holidayLabel == nil)
    {
        _holidayLabel = [[UILabel alloc] init];
        _holidayLabel.text = @"七月1日建党日";
    }
    return _holidayLabel;
}

- (UILabel *)dayLabel
{
    if(_dayLabel == nil)
    {
        _dayLabel = [[UILabel alloc] init];
        _dayLabel.text = @"28";
    }
    return _dayLabel;
}

- (UILabel *)descLabel
{
    if(_descLabel == nil)
    {
        _descLabel = [[UILabel alloc] init];
        _descLabel.numberOfLines = 2;
        _descLabel.text = @"风景都是一样的，因为风景中最要紧的事距离和空气。";
    }
    return _descLabel;
}

#pragma mark - settter
- (void)setBaseScrollView:(UIScrollView *)baseScrollView
{
    if(_baseScrollView == baseScrollView)
    {
        return;
    }
    _baseScrollView = baseScrollView;
    [_baseScrollView addObserver:self forKeyPath:@"contentOffset" options:nil context:nil];
}

#pragma mark - addObserver
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if(self.baseScrollView.contentOffset.y <= 0)
    {
        [self setUIFrame];
    }else
    {
        CGPoint point = [self.baseScrollView.panGestureRecognizer translationInView:self.baseScrollView];
        CGFloat offsetY = point.y;
        
        CGFloat benchmarkHeight = 50.f;
        CGFloat currentOffset = benchmarkHeight - self.baseScrollView.contentOffset.y;
        CGFloat alpha = currentOffset / benchmarkHeight;
        CGFloat resultAlpha = (alpha <= 0.5 ? 0.5 : alpha);
        NSAttributedString *weekdayAttText = [self weekDayAttributedStringWithString:self.weekdayLabel.text otherString:@"S A T U R D A Y"];
        NSAttributedString *holidayAttText =[self attributedStringWithString:self.holidayLabel.text font:[UIFont systemFontOfSize:self.textFontSize-2] textColor:[UIColor yellowColor]];
        
        
        CGSize weekdaySize = [self dynamicCalculationLabelHightText:weekdayAttText width:200];
        CGSize holidaySize = [self dynamicCalculationLabelHightText:holidayAttText width:200];
        
        
        CGFloat weekDayleft = (self.weekdayLabel.left-self.baseScrollView.contentOffset.y) <= 15?15:(self.weekdayLabel.left-self.baseScrollView.contentOffset.y);
        
        if (offsetY > 0) {
            
            NSLog(@"下滑");
            
            
            
        }
        
        
      
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.weekdayLabel.frame = CGRectMake(weekDayleft , 50, weekdaySize.width, weekdaySize.height);
            
           // CGFloat holiLabelTop = (self.holidayLabel.top-self.baseScrollView.contentOffset.y) <= self.weekdayLabel.top?self.weekdayLabel.top:(self.holidayLabel.top-self.baseScrollView.contentOffset.y);
            CGFloat holiLabelTop = (self.holidayLabel.top-self.baseScrollView.contentOffset.y) <= self.weekdayLabel.centerY-self.holidayLabel.height/2.f?self.weekdayLabel.centerY-self.holidayLabel.height/2.f:(self.holidayLabel.top-self.baseScrollView.contentOffset.y);
            
            CGFloat holiLabelLeft = (self.holidayLabel.left+self.baseScrollView.contentOffset.y) >= (self.weekdayLabel.right+10)?(self.weekdayLabel.right+10):(self.holidayLabel.left+self.baseScrollView.contentOffset.y);
            
            self.holidayLabel.frame = CGRectMake(holiLabelLeft, holiLabelTop, holidaySize.width, holidaySize.height);
            
            CGFloat padding = self.oldDayY-self.weekdayLabel.bottom+20;
            
            CGFloat fontSize = self.minFontSize + (self.maxFontSize-self.minFontSize)*((self.dayLabel.top-padding)/(self.maxFontSize - self.minFontSize)) ;
            if(fontSize >= self.maxFontSize)
            {
                fontSize = self.maxFontSize;
            }
            
            UIFont *dayfont =  [UIFont systemFontOfSize:fontSize];
            UIColor *textColor = [[UIColor blackColor] colorWithAlphaComponent:resultAlpha];
            
            NSAttributedString *dayText = [self attributedStringWithString:self.dayLabel.text font:dayfont textColor:textColor];
            NSAttributedString *desLAttText = [self desLAttributedStringWithString:self.descLabel.text lineSpace:5 font:[UIFont systemFontOfSize:self.textFontSize] textColor:textColor];
            self.dayLabel.attributedText = dayText;
            self.descLabel.attributedText = desLAttText;
            CGSize daySize = [self dynamicCalculationLabelHightText:dayText width:200];
            CGSize desLSize = [self dynamicCalculationLabelHightText:desLAttText width:[UIScreen mainScreen].bounds.size.width-100];
            
            CGFloat dayLableTop = (self.dayLabel.top-self.weekdayLabel.bottom+20) <= (self.holidayLabel.bottom+20)?(self.holidayLabel.bottom+20):(self.dayLabel.top-self.weekdayLabel.bottom+20);
            CGFloat dayLabelLeft =  (self.dayLabel.left-self.baseScrollView.contentOffset.y)/padding;
            if(dayLabelLeft <= 15)
            {
                dayLabelLeft = 15;
            }
            
            
            self.dayLabel.frame = CGRectMake(dayLabelLeft, dayLableTop,  daySize.width,  daySize.height);
            
            CGFloat desLabelLeft = (self.descLabel.left-self.baseScrollView.contentOffset.y) <= 15?15:(self.descLabel.left-self.baseScrollView.contentOffset.y);
            
            self.descLabel.frame = CGRectMake(desLabelLeft, self.dayLabel.bottom+20,  self.width-30-100,  desLSize.height);
        }];
        
        if(self.updateBlock)
        {
            self.updateBlock(self.baseScrollView.contentOffset.y);
        }
    }
}

- (void)dealloc
{
    [self.baseScrollView removeObserver:self forKeyPath:@"contentOffset"];
}


#pragma mark - attributedStringWithString
- (NSAttributedString *)attributedStringWithString:(NSString *)string font:(UIFont *)font textColor:(UIColor *)textColor
{
    if(string == nil  || [string isEqualToString:@""])
        return nil;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    [attributedString addAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:textColor} range: NSMakeRange(0, [string length])];
    
    return attributedString;
}

- (NSAttributedString *)weekDayAttributedStringWithString:(NSString *)string
                                              otherString:(NSString *)otherString
{
    if(string == nil  || [string isEqualToString:@""])
        return nil;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    [attributedString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:self.textFontSize-2],NSForegroundColorAttributeName:[UIColor yellowColor]} range: NSMakeRange(0, [string length])];
    
    if(otherString)
    {
        NSRange range = [string rangeOfString:otherString];
        [attributedString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:self.textFontSize],NSForegroundColorAttributeName:[UIColor blackColor]} range:range];
    }
    
    return attributedString;
}

- (NSAttributedString *)desLAttributedStringWithString:(NSString *)string lineSpace:(CGFloat)lineSpace  font:(UIFont *)font textColor:(UIColor *)textColor
{
    if(string == nil  || [string isEqualToString:@""])
        return nil;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpace; // 调整行间距
    paragraphStyle.alignment = NSTextAlignmentLeft;  //对齐
    paragraphStyle.headIndent = 0.0f;//行首缩进
    NSRange range = NSMakeRange(0, [string length]);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    [attributedString addAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:textColor} range:range];
    return attributedString;
}

#pragma mark -  computed text
- (CGSize )dynamicCalculationLabelHightText:(NSAttributedString *)attrText width:(CGFloat)width
{
    CGFloat resultWidth = width;
    if(attrText == nil)
    {
        return CGSizeMake(0, 0);
    }
    CGSize size = [attrText boundingRectWithSize:CGSizeMake(resultWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading  context:nil].size;
    return size;
}

@end
