#import "Alpha.h"
#import "Beta.h"

// Use @interface extensions for private properties
@interface ClassName () <Protocols>

// Keep @properties grouped together by function
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (strong, nonatomic, readonly) TBObject *someObject;

@end

// Use static NSString points to consts for string constants
static NSString *const ConstantName = @"Constant";

// Prepend constants with 'k' when being used as keys
static NSString *const kFirstName = @"FirstName";

@implementation ClassName

/*
 - Use #pragma mark to organize code by function
 - Use descriptive names for #pragma mark
 - Use class names if overriding or implementing protocol methods
*/
#pragma mark - Initialization

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    // Return early if conditions prohibit the intended function of the method
    // Use conditionals for exceptional cases
    // Keep the 'optimal' path non-indented
    if (!self)
        return nil;

    return self;
}

#pragma mark - UI

// Opening brackets belong on the next line
- (void)shuffleCards
{
    // Objective-C literals are your friend
    NSDictionary *themeColors = @{ kRedColor : [UIColor redColor], kBlueColor : [UIColor blueColor] };
    NSArray *robots = @[ @"Ralph", @"Bender", @"The Iron Giant" ];

    NSMutableArray *deckOfCards = [NSMutableArray arrayWithCapacity:52];

    // Newlines before and after conditional blocks
    for (Card *card in deckOfCards)
        NSLog(@"%@", [card description]);

    Card *jokerCard = [Card joker];
    [deckOfCards addObject:jokerCard];

    // Use ! to check for nots. Comparing to 'nil' is redundant
    if (![creditCard isValid])
    {
        //...
    }
}

@end
