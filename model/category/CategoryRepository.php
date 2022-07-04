<?php 
class CategoryRepository {
    protected function fetchAll($condition = null)
	{
		global $conn;
		$categories = array();
		$sql = "SELECT * FROM category";
		if ($condition) 
		{
			$sql .= " WHERE $condition"; // SELECT * FROM category WHERE id = 1
		}

		$result = $conn->query($sql);

		if ($result->num_rows > 0) 
		{
			while ($row = $result->fetch_assoc()) 
			{
				$category = new Category($row["ID"], $row["NAME"]);
				$categories[] = $category;
			}
		}
		return $categories;
	}

	function getAll($condition = null) {
		return $this->fetchAll($condition);
	}

	function find($id) {
		global $conn; 
		$condition = "id = $id";
		$categories = $this->fetchAll($condition);
		$category = current($categories);
		return $category;
	}

	function save($data) {
		global $conn;
		$category_name = $data["category_name"];
		$sql = "INSERT INTO category (NAME) VALUES ('$category_name')";
		if ($conn->query($sql) === TRUE) {
			$last_id = $conn->insert_id; // chỉ cho auto increment
		    return $last_id;
		} 
		$this->error = "Error: " . $sql . PHP_EOL . $conn->error;
		return false;
	}

	function update($category) {
		global $conn;
		$name = $category->getName();
		$id = $category->getId();
		$sql = "UPDATE category SET NAME = '$name' WHERE ID = $id";

		if ($conn->query($sql) === TRUE) {
		    return true;
		} 
		$this->error = "Error: " . $sql . PHP_EOL . $conn->error;
		return false;
	}

	function delete($category) {
		global $conn;
		$id = $category->getId();
		$sql = "DELETE FROM category WHERE ID = $id";
		if ($conn->query($sql) === TRUE) {
		    return true;
		} 
		$this->error = "Error: " . $sql . PHP_EOL . $conn->error;
		return false;
	}
}

?>