<?php 
class OrderItemRepository {
    protected function fetchAll($condition = null) {
        global $conn;
        $orderItems = [];
        $sql = "SELECT * FROM order_item";

        if ($condition) {
            $sql .= " WHERE $condition";
        }
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $orderItem = new OrderItem($row["PRODUCT_ID"], $row["ORDER_ID"], $row["QTY"], $row["SIZE"], $row["UNIT_PRICE"], $row["TOTAL_PRICE"]);
				$orderItems[] = $orderItem;
            }
        }
        return $orderItems;
    }

    function getAll() {
        return $this->fetchAll();
    }

    function find($order_id, $product_id, $size) {
		global $conn; 
		$condition = "ORDER_ID = $order_id AND PRODUCT_ID = $product_id AND SIZE = '$size'";
		$orderItems = $this->fetchAll($condition);
		$orderItem = current($orderItems);
		return $orderItem;
	}

    function save($dataItem) {
        global $conn;
        $product_id = $dataItem["product_id"];
        $order_id = $dataItem["order_id"];
        $qty = $dataItem["qty"];
        $size = $dataItem["size"];
        $unit_price = $dataItem["unit_price"];
        $total_price = $dataItem["total_price"];

        $sql = "INSERT INTO order_item (PRODUCT_ID, ORDER_ID, QTY, SIZE, UNIT_PRICE, TOTAL_PRICE) VALUES ('$product_id', '$order_id', '$qty', '$size', '$unit_price', '$total_price')";

        if ($conn->query($sql) === TRUE) {
			return true;
		} 
		echo "Error: " . $sql . PHP_EOL . $conn->error;
		return false;
    }

    function getByOrderId($order_id) {
		global $conn; 
		$condition = "ORDER_ID = $order_id";
		$orderItems = $this->fetchAll($condition);
		return $orderItems;
	}

    function delete($orderItem) {
		global $conn;
		$product_id = $orderItem->getProductId();
		$order_id = $orderItem->getOrderId();
        $size = $orderItem->getSize();
		$sql = "DELETE FROM order_item WHERE ORDER_ID = $order_id AND PRODUCT_ID = $product_id AND SIZE = '$size'";
		if ($conn->query($sql) === TRUE) {
		    return true;
		} 
		echo "Error: " . $sql . PHP_EOL . $conn->error;
		return false;
	}
}
?>