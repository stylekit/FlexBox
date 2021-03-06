import Foundation

class FlexBoxModifier{
    /**
     * Applies all flex adjustments
     */
    static func flex(_ container:FlexBoxContainerKind){
        FlexBoxGrowUtils.grow(container.flexBoxItems,container.rect)
        FlexBoxModifier.justifyContent(container.flexBoxItems, container.justifyContent, container.rect)
        FlexBoxModifier.alignItems(container.flexBoxItems , container.alignItems, container.rect)
    }
    /**
     * TODO: ⚠️️ Possibly use FlexItem here that decorates something
     * Positions items along the x axis
     */
    private static func justifyContent(_ items:[FlexBoxItemKind], _ type:FlexBoxType.Justify, _ container:CGRect){
        switch type{
            case .flexStart:
                JustifyUtils.flexStart(items,container)
            case .flexEnd:
                JustifyUtils.flexEnd(items, container)
            case .center:
                JustifyUtils.center(items,container)
            case .spaceBetween:
                JustifyUtils.spaceBetween(items,container)
            case .spaceAround:
                JustifyUtils.spaceAround(items,container)
        }
    }
    /**
     * Vertically aligns a row of items
     */
    private static func alignItems(_ items:[FlexBoxItemKind], _ type:FlexBoxType.AlignType, _ container:CGRect) {
        items.forEach{alignSelf($0,type,container)}
    }
    /**
     * Vertically aligns a single item
     */
    private static func alignSelf(_ item:FlexBoxItemKind, _ type:FlexBoxType.AlignType, _ container:CGRect){
        switch type{
            case .flexStart:
                FlexBoxAlignSelf.flexStart(item,container)
            case .flexEnd:
                FlexBoxAlignSelf.flexEnd(item, container)
            case .center:
                FlexBoxAlignSelf.center(item,container)
            case .stretch:
                FlexBoxAlignSelf.stretch(item,container)
        }
    }
}
