#import "Alpha.h"
#import "Beta.h"

@interface ClassName () <Protocols>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (strong, nonatomic, readonly) TBObject *someObject;

#pragma mark - Initialization

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (!self)
        return nil;

    return self;
}

#pragma mark - UI

- (void)shuffleCards
{
    NSDictionary *themeColors = @{ kRedColor : [UIColor redColor], kBlueColor : [UIColor blueColor] };
    NSArray *robots = @[ @"Ralph", @"Bender", @"The Iron Giant" ];

    NSMutableArray *deckOfCards = [NSMutableArray arrayWithCapacity:52];

    for (Card *card in deckOfCards)
        NSLog(@"%@", [card description]);

    Card *jokerCard = [Card joker];
    [deckOfCards addObject:jokerCard];

    if (![creditCard isValid])
    {
        //...
    }
}
