#import <UIKit/UIKit.h>

typedef NS_ENUM (NSUInteger, CHTCollectionViewWaterfallLayoutItemRenderDirection) {
    CHTCollectionViewWaterfallLayoutItemRenderDirectionShortestFirst,
    CHTCollectionViewWaterfallLayoutItemRenderDirectionLeftToRight,
    CHTCollectionViewWaterfallLayoutItemRenderDirectionRightToLeft
};

extern NSString *const CHTCollectionElementKindSectionHeader;
/// A supplementary view that identifies the footer for a given section.
extern NSString *const CHTCollectionElementKindSectionFooter;

#pragma mark - CHTCollectionViewDelegateWaterfallLayout

@class CHTCollectionViewWaterfallLayout;

@protocol CHTCollectionViewDelegateWaterfallLayout <UICollectionViewDelegate>
@required

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnCountForSection:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section;
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForHeaderInSection:(NSInteger)section;
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForFooterInSection:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumColumnSpacingForSectionAtIndex:(NSInteger)section;

#pragma mark - CHTCollectionViewWaterfallLayout

@end

@interface WaterfallLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) IBInspectable NSInteger columnCount;
@property (nonatomic, assign) IBInspectable CGFloat minimumColumnSpacing;
@property (nonatomic, assign) IBInspectable CGFloat minimumInteritemSpacing;
@property (nonatomic, assign) IBInspectable CGFloat headerHeight;
@property (nonatomic, assign) IBInspectable CGFloat footerHeight;
@property (nonatomic, assign) IBInspectable UIEdgeInsets headerInset;
@property (nonatomic, assign) IBInspectable UIEdgeInsets footerInset;
@property (nonatomic, assign) IBInspectable UIEdgeInsets sectionInset;
@property (nonatomic, assign) IBInspectable CHTCollectionViewWaterfallLayoutItemRenderDirection itemRenderDirection;
@property (nonatomic, assign) IBInspectable CGFloat minimumContentHeight;

- (CGFloat)itemWidthInSectionAtIndex:(NSInteger)section;

@end
