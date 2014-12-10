#import "Alpha.h"
#import "Beta.h"

// Use @interface extensions for private properties
@interface TBClassName () <Protocols>

// Keep @properties grouped together by function
@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic, readonly) TBObject *someObject;

@end

// Use static NSString points to consts for string constants
static NSString *const TBConstantName = @"Constant";
static NSUInteger const TBNumberOfCardsInDeck = 52;

@implementation ClassName

/*
 - Use #pragma mark to organize code by function
 - Use descriptive names for #pragma mark
 - Use class names if overriding or implementing protocol methods
*/
#pragma mark - Initialization

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    // Return early if conditions prohibit the intended function of the method
    // Use conditionals for exceptional cases
    // Keep the 'optimal' path non-indented
    if (!self) return nil;

    return self;
}

#pragma mark - UI

// Opening brackets belong on the next line
- (void)shuffleCards
{
    // Objective-C literals are your friend
    NSDictionary *themeColors = @{RedColor: [UIColor redColor], BlueColor: [UIColor blueColor]};
    NSArray *robots = @[@"Ralph", @"Bender", @"The Iron Giant"];

    NSMutableArray *deckOfCards = [NSMutableArray array];

    Card *jokerCard = [Card joker];
    [deckOfCards addObject:jokerCard];

    // Newlines before and after conditional blocks
    for (Card *card in deckOfCards) {
        NSLog(@"%@", [card description]);
    }

    // Use ! to check for nots. Comparing to 'nil' is redundant
    if (![creditCard isValid]) {
        //...
    }
}

@end
