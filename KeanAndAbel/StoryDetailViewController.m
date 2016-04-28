//
//  StoryDetailViewController.m
//  KeanAndAbel
//
//  Created by KeizuDevMacMini on 4/28/16.
//  Copyright (c) 2016 Thuong Nguyen Quoc. All rights reserved.
//

#import "StoryDetailViewController.h"
#import "Story.h"

@interface StoryDetailViewController ()

@property(strong, nonatomic) IBOutlet UITextView *content;

@end

@implementation StoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 15;
    self.content.attributedText = [[NSAttributedString alloc] initWithString:@"Pre Text" attributes:@{NSParagraphStyleAttributeName : style}];
    self.content.font = [UIFont fontWithName:@"Times New Roman" size:20];
    [self.content setContentOffset:CGPointMake(5, 5) animated:NO];
    self.content.text = self.stories.content;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
