<?php 
class OrderRepository {
    protected function fetchAll($condition = null, $sort = null) {
        global $conn;
        $orders = array();
        $sql = "SELECT * FROM `order`";

        if ($condition) {
            $sql .= " WHERE $condition";
        }

        if ($sort) {
            $sql .= " $sort";
        }

        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $order = new Order($row["ID"], $row["CREATED_DATE"], $row["ORDER_STATUS_ID"], $row["STAFF_ID"], $row["CUSTOMER_ID"], $row["SHIPPING_FULLNAME"], $row["SHIPPING_MOBILE"], $row["PAYMENT_METHOD"], $row["ADDRESS"], $row["DELIVERED_DATE"]);
                $orders[] = $order;
            }
        }
        return $orders;
    }

    function getAll() {
        return $this->fetchAll();
    }

    function find($id) {
        $condition = "ID = $id";
        $orders = $this->fetchAll($condition);
        $order = current($orders);
        return $order;
    }

    function save($data) {
        global $conn;
        $created_date = $data["created_date"];
        $order_status_id = $data["order_status_id"];
        $staff_id = $data["staff_id"];
        $customer_id = $data["customer_id"];
        $shipping_fullname = $data["shipping_fullname"];
        $shipping_mobile = $data["shipping_mobile"];
        $payment_method = $data["payment_method"];
        $address = $data["address"];
        $delivered_date = $data["delivered_date"];

        if (empty($staff_id)) {
			$staff_id = "NULL";
		}

        $sql = "INSERT INTO `order` (CREATED_DATE, ORDER_STATUS_ID, STAFF_ID, CUSTOMER_ID, SHIPPING_FULLNAME, SHIPPING_MOBILE, PAYMENT_METHOD, ADDRESS, DELIVERED_DATE) VALUES ('$created_date', '$order_status_id', '$staff_id', '$customer_id', '$shipping_fullname', '$shipping_mobile', '$payment_method', '$address', '$delivered_date')";

        if ($conn->query($sql) === TRUE) {
            $last_id = $conn->insert_id;
            return $last_id;
        }
        echo "Error: " . $sql . PHP_EOL . $conn->error;
		return false;
    }

    function update($order) {
        global $conn;
		$id = $order->getId();
        $shipping_fullname = $order->getShippingFullname();
        $status_id = $order->getOrderStatusId();
        $shipping_mobile = $order->getShippingMobile();
        $address = $order->getAddress();
        $payment_method = $order->getPaymentMethod();
        $staff_id = $order->getStaffId();

        $sql = "UPDATE `order` SET SHIPPING_FULLNAME = '$shipping_fullname', ORDER_STATUS_ID = $status_id, SHIPPING_MOBILE = '$shipping_mobile', ADDRESS = '$address', PAYMENT_METHOD = $payment_method, STAFF_ID = $staff_id WHERE ID = $id";

        if ($conn->query($sql) === TRUE) {
		    return true;
		} 
		echo "Error: " . $sql . PHP_EOL . $conn->error;
		return false;
    }

    function delete($order) {
		global $conn;
		$orderItemRepository = new OrderItemRepository();
		$orderItems = $order->getOrderItems();
		foreach ($orderItems as $orderItem) {
			if (!$orderItemRepository->delete($orderItem)) {
				echo "Error: " . $sql . PHP_EOL . $conn->error;
				return false;
			}
			
		}
		
		$id = $order->getId();
		$sql = "DELETE FROM `order` WHERE ID = $id";
		if ($conn->query($sql) === TRUE) {
		    return true;
		} 
		echo "Error: " . $sql . PHP_EOL . $conn->error;
		return false;
	}

    // Lấy danh sách các đơn hàng đã đặt của khách hàng
    function getByCustomerId($customer_id) {
		$condition = "CUSTOMER_ID = $customer_id";
		$sort = "ORDER BY ID DESC";
		return $this->fetchAll($condition, $sort);
	}
}

?>