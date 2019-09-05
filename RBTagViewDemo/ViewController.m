//
//  ViewController.m
//  RBTagViewDemo
//
//  Created by Shao.Tc on 15/12/20.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "ViewController.h"
#import "RBTagView.h"



@interface ViewController () <RBTagViewDelegate, RBTagViewDataSource>

@property (nonatomic, strong) RBTagView *tagViewSelected;

@property (nonatomic, strong) RBTagView *tagView;

@property (nonatomic, strong) NSMutableArray *selectedTags;

@property (nonatomic, strong) NSMutableArray *initialTags;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.initialTags = [NSMutableArray arrayWithArray:@[@"iOS", @"Swift", @"Java Java Java Java Java Java Java Java Java Java Java Java Java Java Java Java Java Java", @"C# .net", @"PHP", @"Python", @"Golang", @"Hello World", @"C", @"C++",@"iOS", @"Swift", @"Java", @"C# .net", @"PHP", @"Python", @"Golang", @"Hello World", @"C", @"C++",@"iOS", @"Swift", @"Java", @"C# .net", @"PHP", @"Python", @"Golang", @"Hello World", @"C", @"C++",@"iOS", @"Swift", @"Java", @"C# .net", @"PHP", @"Python", @"Golang", @"Hello World", @"C", @"C++",@"iOS", @"Swift", @"Java", @"C# .net", @"PHP", @"Python", @"Golang", @"Hello World", @"C", @"C++"]];
    
    self.selectedTags = [NSMutableArray array];
    
    self.tagView = [[RBTagView alloc] init];
    self.tagView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tagView];
    
    [self.view addConstraints:@[[NSLayoutConstraint constraintWithItem:self.tagView
                                                           attribute:NSLayoutAttributeLeading
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeLeading
                                                          multiplier:1.f constant:0.f],
                              [NSLayoutConstraint constraintWithItem:self.tagView
                                                           attribute:NSLayoutAttributeTrailing
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTrailing
                                                          multiplier:1.f constant:0.f],
                              [NSLayoutConstraint constraintWithItem:self.tagView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.f constant:64.f]]];
    [self.tagView addConstraint:[NSLayoutConstraint constraintWithItem:self.tagView
                                                        attribute:NSLayoutAttributeHeight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                       multiplier:1.f constant:CGRectGetHeight(self.view.frame)/2.- 100]];
    
    
    
    self.tagView.tagDelegate = self;
    self.tagView.dataSource = self;
    
    
    self.tagViewSelected = [[RBTagView alloc] init];
    self.tagViewSelected.singleLine = YES;
    [self.tagViewSelected setBackgroundColor:[UIColor colorWithRed:245./255. green:245./255. blue:245./255. alpha:1.]];
    self.tagViewSelected.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tagViewSelected];

    [self.view addConstraints:@[[NSLayoutConstraint constraintWithItem:self.tagViewSelected
                                                             attribute:NSLayoutAttributeLeading
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeLeading
                                                            multiplier:1.f constant:0.f],
                                [NSLayoutConstraint constraintWithItem:self.tagViewSelected
                                                             attribute:NSLayoutAttributeTrailing
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeTrailing
                                                            multiplier:1.f constant:0.f]]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.tagViewSelected
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.tagView
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.f constant:50.f]];
    [self.tagViewSelected addConstraint:[NSLayoutConstraint constraintWithItem:self.tagViewSelected
                                                        attribute:NSLayoutAttributeHeight
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:nil
                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                       multiplier:1.f constant:50]];
    
    self.tagViewSelected.tagDelegate = self;
    self.tagViewSelected.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)lineSpacingInTagView:(RBTagView *)tagView {
    return 15;
}

- (CGFloat)tagSpacingInTagView:(RBTagView *)tagView {
    return 15;
}

- (CGFloat)tagHeightInTagView:(RBTagView *)tagView {
    return 30;
}

- (RBMargin)marginInTagView:(RBTagView *)tagView {
    return RBMarginMake(20, 10);
}

- (NSUInteger)numberOfTagInTagView:(RBTagView *)tagView {
    if (tagView == self.tagViewSelected) {
        return self.selectedTags.count;
    }else{
        return self.initialTags.count;
    }
}

- (void)tagView:(RBTagView *)tagView willDisplayTag:(RBTag *)tag {
    if (tagView == self.tagViewSelected) {
        [tag.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [tag setBackgroundColor:[UIColor colorWithRed:247./255. green:73./255. blue:98./255. alpha:1.]];
    }else{
        [tag.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [tag setTitleColor:[UIColor colorWithRed:101./255. green:103./255. blue:107./255. alpha:1.] forState:UIControlStateNormal];
        tag.layer.borderColor = [UIColor colorWithRed:222./255. green:223./255. blue:224./255. alpha:1.].CGColor;
        tag.layer.borderWidth = 0.8;
    }
}

- (RBTag *)tagView:(RBTagView *)tagView tagAtIndex:(NSUInteger)index {
    NSString *fontName = @"AmericanTypewriter-CondensedBold";
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont fontWithName:fontName size:12],NSKernAttributeName:@2};
    if (tagView == self.tagViewSelected) {
         return [RBTag tagWithTitle:self.selectedTags[index] withImage:[UIImage imageNamed:@"check"] changeImageTitlePosition:YES withTitleAttrbibute:attributes];
    }else {
        return [RBTag tagWithTitle:self.initialTags[index] withImage:[UIImage imageNamed:@"plus"] changeImageTitlePosition:YES withTitleAttrbibute:attributes];
    }
   
}

- (void)tagView:(RBTagView *)tagView didSelectedAtIndex:(NSUInteger)index {
    if (tagView == self.tagViewSelected) {
        NSString *object = self.selectedTags[index];
        [self.selectedTags removeObjectAtIndex:index];;
        [self.initialTags addObject:object];
    }else{
        NSString *object = self.initialTags[index];
        [self.initialTags removeObjectAtIndex:index];
        [self.selectedTags addObject:object];
    }
    [self.tagView reloadData];
    [self.tagViewSelected reloadData];
}

@end
