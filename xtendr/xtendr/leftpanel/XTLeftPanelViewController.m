//
//  XTLeftPanelViewController.m
//  xtendr
//
//  Created by Tony Million on 18/08/2012.
//  Copyright (c) 2012 Tony Million. All rights reserved.
//

#import "XTLeftPanelViewController.h"
#import "XTLeftPanelCell.h"

@interface XTLeftPanelViewController ()

@end

@implementation XTLeftPanelViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"leftpanelback.png"]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    self.tableView.rowHeight = 44;

    [self.tableView registerNib:[UINib nibWithNibName:@"XTLeftPanelCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"leftPanelCell"];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(section == 0)
		return 5;

	if(section == 1)
		return 1;

	return 0;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
		return NSLocalizedString(@"Your Stuff", @"");

	return NSLocalizedString(@"Other", @"");
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 24;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
    if (sectionTitle == nil) {
        return nil;
    }

    CGFloat headerHeight = [self tableView:tableView heightForHeaderInSection:section];

    // Create label with section title
    UILabel *label = [[UILabel alloc] init];
    label.frame             = CGRectMake(10, 0, 310, headerHeight);
    label.backgroundColor   = [UIColor clearColor];
    label.textColor         = [UIColor colorWithWhite:1.0 alpha:0.8];
    label.shadowColor       = [UIColor colorWithWhite:0.0 alpha:0.4];
    label.shadowOffset      = CGSizeMake(0.0, -1.0);
    label.font              = [UIFont fontWithName:@"HelveticaNeue-CondensedBold"
                                              size:18];

    label.text = sectionTitle;

    // Create header view and add label as a subview
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, headerHeight)];
    view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
    [view addSubview:label];

    return view;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XTLeftPanelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftPanelCell"];
    cell.chevron.hidden = NO;
    if(indexPath.section == 0)
    {
        if(indexPath.row == 0)
        {
            cell.badge.hidden = YES;
			/*
			if([ZZProfileController sharedInstance].user.username.length < 20)
			{
				cell.textLabel.text = [ZZProfileController sharedInstance].user.username;
			}
			else
			{
			}
			 */
			cell.textLabel.text = NSLocalizedString(@"Timeline", @"");
        }
        else if(indexPath.row == 1)
        {
            cell.textLabel.text = NSLocalizedString(@"Followed", @"");
			cell.badge.hidden = YES;

        }
		else if(indexPath.row == 2)
        {
            cell.textLabel.text = NSLocalizedString(@"Followers", @"");
			cell.badge.hidden = YES;

        }
		else if(indexPath.row == 3)
        {
            cell.textLabel.text = NSLocalizedString(@"Profile", @"");
			cell.badge.hidden = YES;

        }
		else if(indexPath.row == 4)
		{
            cell.textLabel.text = NSLocalizedString(@"Settings", @"");
			cell.badge.hidden = YES;

		}
    }
	else if(indexPath.section == 1)
	{
		if(indexPath.row == 0)
        {
            cell.badge.hidden	= YES;
			cell.chevron.hidden = YES;
			/*
			 if([ZZProfileController sharedInstance].user.username.length < 20)
			 {
			 cell.textLabel.text = [ZZProfileController sharedInstance].user.username;
			 }
			 else
			 {
			 }
			 */
			cell.textLabel.text = NSLocalizedString(@"Logout", @"");
        }

	}

	return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end