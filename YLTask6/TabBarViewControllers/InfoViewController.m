//
//  InfoViewController.m
//  YLTask6
//
//  Created by Юлия Лопатина on 6/22/20.
//  Copyright © 2020 Юлия Лопатина. All rights reserved.
//

#import "InfoViewController.h"
#import "InfoTableViewCell.h"
#import "UIColor+RSColors.h"
#import <Photos/Photos.h>
@interface InfoViewController ()
@property(nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableDictionary<NSString * , UIImage*> *dictionary;
@property (nonatomic, strong) PHFetchResult *fetchResult;
@property (nonatomic, strong) InfoTableViewCell *cellInfo;
@property (nonatomic, strong) NSMutableArray<PHAsset*> *assetArray;
@end

@implementation InfoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
  self.dictionary = [NSMutableDictionary new];
  PHFetchOptions *options = [PHFetchOptions new];
  options.sortDescriptors = @[
      [NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES],
  ];
  self.imageManager = [[PHCachingImageManager alloc] init];
  self.fetchResult = [PHAsset fetchAssetsWithOptions:options];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

       self.parentViewController.navigationItem.title = @"Info";
}
-(void)setUpTableView {
    self.tableView = [[UITableView alloc] init];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
      [self.tableView registerNib:[UINib nibWithNibName:@"InfoTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CellID"];
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
        return [self.fetchResult count];
    }

    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
        PHAsset *asset = self.fetchResult[indexPath.row];

        UIView *backGroundView = [UIView new];
        backGroundView.backgroundColor = [UIColor rsschoolYellowColor];
        [cell setSelectedBackgroundView:backGroundView];

        UIImage *image = [UIImage new];
        image = [self.dictionary valueForKey:(NSString*)[asset valueForKey:@"filename"]];
        if (image != nil )
        {
            cell.imageView.image = image;
            [self setupOtherSettingsForCell:asset cell:cell];
            return cell;
        }
        [self.imageManager requestImageForAsset:asset targetSize:CGSizeMake(500, 500) contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            cell.imageView.image = result;
            [self.dictionary setValue:result forKey:(NSString*)[asset valueForKey:@"filename"]];
            [self setupOtherSettingsForCell:asset cell:cell];
        }];
        return cell;
    }
-(void)setupOtherSettingsForCell:(PHAsset*)asset cell:(InfoTableViewCell*)cell
{
    NSTimeInterval progress = asset.duration;
    int minutes = floor(progress/60);
    int seconds = trunc(progress - minutes * 60);
    NSString *timeString = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
    NSString *string = [NSString stringWithFormat:@"%ldx%ld", asset.pixelWidth, asset.pixelHeight];
        switch (asset.mediaType) {

            case PHAssetMediaTypeUnknown:
                cell.imageView.image = [UIImage imageNamed:@"unknown"];
                cell.title.text = (NSString*)[asset valueForKey:@"filename"];
                cell.iconView.image = [UIImage imageNamed:@"other"];
                cell.subtitle.text = @"";
                break;
            case PHAssetMediaTypeImage:
                cell.title.text = (NSString*)[asset valueForKey:@"filename"];
                cell.iconView.image = [UIImage imageNamed:@"image"];
                cell.subtitle.text = string;
                break;
            case PHAssetMediaTypeVideo:
                cell.title.text = (NSString*)[asset valueForKey:@"filename"];
                cell.iconView.image = [UIImage imageNamed:@"video"];
                cell.iconView.tintColor = [UIColor rsschoolBlackColor];
                cell.subtitle.text = [NSString stringWithFormat:@"%@ %@", string,timeString];
                break;
            case PHAssetMediaTypeAudio:
                cell.imageView.image = [UIImage imageNamed:@"audioImageCell"];
                cell.title.text = (NSString*)[asset valueForKey:@"filename"];
                cell.iconView.image = [UIImage imageNamed:@"audio"];
                cell.subtitle.text = timeString;
                break;
        }
}
    #pragma mark - UITableViewDelegate

    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }

    - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        return 120.0;
    }

-(NSString*)createSendDate:(NSDate *)getDate
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"HH:mm:ss dd.MM.YYYY"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSString *dateString = [dateFormat stringFromDate:getDate];
    return  dateString;
}


-(NSString*)typeObject:(PHAsset*)asset
{
    switch (asset.mediaType) {
        case PHAssetMediaTypeUnknown:
            return @"Unknown";
            break;
        case PHAssetMediaTypeImage:
            return @"Image";
            break;
        case PHAssetMediaTypeVideo:
            return @"Video";
            break;
        case PHAssetMediaTypeAudio:
            return @"Audio";
            break;
    }
}


- (void)photoLibraryDidChange:(nonnull PHChange *)changeInstance {
    PHFetchResultChangeDetails *change=  [changeInstance changeDetailsForFetchResult:self.fetchResult];
    if(change != nil){
        NSLog(@"!= nil");
    }else {
        NSLog(@"nil");
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        self.fetchResult = change.fetchResultAfterChanges;
        [self.tableView reloadData];
    });
}
@end
