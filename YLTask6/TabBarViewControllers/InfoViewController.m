//
//  InfoViewController.m
//  YLTask6
//
//  Created by Юлия Лопатина on 6/22/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import "InfoViewController.h"
#import "InfoTableViewCell.h"
#import "Data.h"
#import "UIColor+RSColors.h"
#import <Photos/Photos.h>
@interface InfoViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray <Data*> *arrayData;
@end

@implementation InfoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.parentViewController.navigationItem.title = @"Info";
    
    [self setUpTableView];
    [self fillInitialDataSource];
}

-(void)setUpTableView {
    self.tableView = [[UITableView alloc] init];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:InfoTableViewCell.class forCellReuseIdentifier:@"CellId"];
    [self.view addSubview:self.tableView];
    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
    ]];
}
    #pragma mark - UITableViewDataSource

    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return self.arrayData.count;
    }

    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
        [cell configureWithCell:self.arrayData[indexPath.row]];
        return cell;
    }

    #pragma mark - UITableViewDelegate

    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
      

    }



    - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        return 70.0;
    }


- (void)fillInitialDataSource {
    
    self.arrayData = [NSMutableArray arrayWithArray:@[
        [[Data alloc]initWithImage: [UIImage imageNamed: @"appple"] title: @"apple" subtitle: @"subtitle"]]
    ];
}
@end
