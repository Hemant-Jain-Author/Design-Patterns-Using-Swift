import Foundation

class OrderPackingTemplate {
    
    final func packProduct() {
        getProduct()
        addProductToBox()
        delivery()
    }

    func getProduct() {
        print("Get the product from the shelf.")
    }

    func addProductToBox() {
        print("Put the product inside the box.")
    }

    func delivery() {
        fatalError("Abstract method. Subclasses must implement delivery.")
    }
}

class OnlineOrderPacking: OrderPackingTemplate {
    override func delivery() {
        print("Add delivery address slip and ship.")
    }
}

class StoreOrderPacking: OrderPackingTemplate {
    override func delivery() {
        print("Add thanks message to the box and deliver to the customer.")
    }
}

func testTemplatePatternOrder() {
    let onlineOrder = OnlineOrderPacking()
    onlineOrder.packProduct()

    print()

    let storeOrder = StoreOrderPacking()
    storeOrder.packProduct()
}

testTemplatePatternOrder()
