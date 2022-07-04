<?php 
class CustomerRepository extends BaseRepository {
    protected function fetchAll($condition = null) {
        global $conn;
        $customers = [];
        $sql = "SELECT * FROM customer";

        if ($condition) {
            $sql .= " WHERE $condition";
        }

        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $customer = new Customer($row["ID"], $row["NAME"], $row["PASSWORD"], $row["EMAIL"], $row["LOGIN_BY"], $row["MOBILE"], $row["ADDRESS"], $row["IS_ACTIVE"]);
                $customers[] = $customer;
            }
        }

        return $customers;
    }

    function getAll() {
        return $this->fetchAll();
    }

    function save($data) {
        global $conn;
        $name = $data["name"];
        $password = $data["password"];
        $email = $data["email"];
        $login_by = $data["login_by"];
        $mobile = $data["mobile"];
        $address = $data["address"];
        $is_active = $data["is_active"];

        if (empty($is_active)) {
            $is_active = 0;
        }

        $sql = "INSERT INTO customer (NAME, PASSWORD, EMAIL, LOGIN_BY, MOBILE, ADDRESS, IS_ACTIVE) VALUES ('$name', '$password', '$email', '$login_by', '$mobile', '$address', '$is_active')";

        if ($conn->query($sql) === TRUE) {
            $last_id = $conn->insert_id;
            return $last_id;
        }

        $this->error = "Error: " . $sql . PHP_EOL . $conn->error;
        return false;
    }

    function find($id) {
		global $conn; 
		$condition = "ID = $id";
		$customers = $this->fetchAll($condition);
		$customer = current($customers);
		return $customer;
	}

    function findEmail($email) {
        global $conn;
        $condition = "email = '$email'";
        $customers = $this->fetchAll($condition);
        $customer = current($customers);
        return $customer;
    }

    function update($customer) {
        global $conn;
        $id = $customer->getId();
        $name = $customer->getName();
        $password = $customer->getPassword();
        $email = $customer->getEmail();
        $login_by = $customer->getLoginBy();
        $mobile = $customer->getMobile();
        $address = $customer->getAddress();
        $is_active = $customer->getIsActive();

        if (empty($is_active)) {
            $is_active = 0;
        }

        $sql = "UPDATE customer SET NAME = '$name', PASSWORD = '$password', EMAIL = '$email', LOGIN_BY = '$login_by', MOBILE = '$mobile', ADDRESS = '$address', IS_ACTIVE = '$is_active' WHERE ID = $id";

        if ($conn->query($sql) === TRUE) {
            return true;
        }
        $this->error = "Error: " . $sql . PHP_EOL . $conn->error;
		return false;
    }

    function delete($customer) {
		global $conn;
		$id = $customer->getId();
		$sql = "DELETE FROM customer WHERE ID = $id";
		if ($conn->query($sql) === TRUE) {
		    return true;
		} 
		$this->error = "Error: " . $sql . PHP_EOL . $conn->error;
		return false;
	}
}

?>