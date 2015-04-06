//
//  ViewController.m
//  attributedstring
//
//  Created by renjinwei on 15/4/6.
//  Copyright (c) 2015年 renjinwei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelAttributedString;
//@property (weak, nonatomic) IBOutlet UITextView *textviewAttributedString;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *strLink = @"www.mi.com testalkdsfiasfleiefeilfsdfsdlfldfdfd \r\n open link";
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableAttributedString *attribString = [[NSMutableAttributedString alloc] initWithString:strLink];
    
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    [attribString beginEditing];
    [attribString addAttribute:NSLinkAttributeName value:url range:NSMakeRange(30, strLink.length - 30)];
    [attribString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier" size:28.0] range:NSMakeRange(0, strLink.length)];
    [attribString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(10, strLink.length - 10)];
    [attribString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(20, strLink.length - 20)];
    
    [attribString endEditing];
    UITextView *_textviewAttributedString = [[UITextView alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width * 0.8, self.view.frame.size.height * 0.4)];
    
    _labelAttributedString.attributedText = attribString;
    _labelAttributedString.numberOfLines = 3;
    _textviewAttributedString.center = self.view.center;
    NSLog(@"%f, %f", self.view.center.x, self.view.center.y);
    _textviewAttributedString.attributedText = attribString;
    _textviewAttributedString.editable = NO;
    _textviewAttributedString.backgroundColor = [UIColor blueColor];
    NSDictionary *linkAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor],
                                     NSUnderlineColorAttributeName: [UIColor blackColor]
                                     };
    
    _textviewAttributedString.linkTextAttributes = linkAttributes;
    _textviewAttributedString.scrollEnabled = NO;
    _textviewAttributedString.textContainer.lineFragmentPadding = 0;
    _textviewAttributedString.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _textviewAttributedString.delegate = self;
    [self.view addSubview:_textviewAttributedString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)url inRange:(NSRange)characterRange
{
    NSLog(@"%@", url.description);
    return YES;
}

@end
