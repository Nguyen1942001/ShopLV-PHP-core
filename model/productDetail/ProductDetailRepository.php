<?php 
class ProductDetailRepository {
    protected function fetchAll($condition = null) {
        global $conn;
        $productDetails = array();
        $sql = "SELECT * FROM PRODUCT_DETAIL";
        if ($condition) {
            $sql .= " WHERE $condition";
        }

        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $productDetail = new ProductDetail($row["ID"], $row["PRODUCT_ID"], $row["SIZE"], $row["QTY"]);
                $productDetails[] = $productDetail;
            }
        }
        return $productDetails;
    }

    function getAll() {
        return $this->fetchAll();
    }

    function getByProductID($product_id) {
        $condition = "PRODUCT_ID = $product_id";
        $productDetails = $this->fetchAll($condition);

        $arraySizeAndQty = [];  
        $totalArray = [];
        foreach($productDetails as $productDetail) {
            $arraySizeAndQty = [
                "size" => $productDetail->getSize(),
                "qty" => $productDetail->getQty()
            ];
            $totalArray[] = $arraySizeAndQty;
        }
        return $totalArray;
        // Mảng $totalArray có index = 0 là size S, index = 1 là size M, index = 2 là size L, index = 3 là size XL

    }

    function updateQty($product_id, $size, $qty) {
        global $conn;
        $sql = "UPDATE PRODUCT_DETAIL SET QTY = $qty WHERE PRODUCT_ID = $product_id";
        if ($size) {
            $sql .= " AND SIZE = '$size'";
        }
        if ($conn->query($sql) === TRUE) {
			return true;
		} 
		echo "Error: " . $sql . PHP_EOL . $conn->error;
		return false;
    }

    function save($arraySize, $arrayQty, $last_id) {
        global $conn;
        $check = false;
        for ($i = 0; $i < count($arraySize); $i++) {
            $sql = "INSERT INTO product_detail (PRODUCT_ID, SIZE, QTY) VALUES ($last_id, '$arraySize[$i]', $arrayQty[$i])";
            if ($conn->query($sql) === TRUE) {
                $check = true;
            }
            else {
                $check = false;
            }
        }

        if ($check == true) {
            return true;
        }
        echo "Error: " . $sql . PHP_EOL . $conn->error;
		return false;
    }

    function delete($product_id) {
        global $conn;
        $sql = "DELETE FROM product_detail WHERE PRODUCT_ID = $product_id";
        if ($conn->query($sql) === TRUE) {
		    return true;
		} 
		$this->error =  "Error: " . $sql . PHP_EOL . $conn->error;
		return false;
    }
}

?>