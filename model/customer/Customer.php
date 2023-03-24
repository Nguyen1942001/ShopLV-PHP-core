<?php 
class Customer {
    protected $id;
    protected $name;
    protected $password;
    protected $email;
    protected $login_by;
    protected $mobile;
    protected $address;
    protected $is_active;

    function __construct($id, $name, $password, $email, $login_by, $mobile, $address, $is_active) {
        $this->id = $id;
        $this->name = $name;
        $this->password = $password;
        $this->email = $email;
        $this->login_by = $login_by;
        $this->mobile = $mobile;
        $this->address = $address;
        $this->is_active = $is_active;
    }

    function getId() {
        return $this->id;
    }

    function getName() {
        return $this->name;
    }

    function getPassword() {
        return $this->password;
    }

    function getEmail() {
        return $this->email;
    }

    function getLoginBy() {
        return $this->login_by;
    }

    function getMobile() {
        return $this->mobile;
    }

    function getAddress() {
        return $this->address;
    }

    function getIsActive() {
        return $this->is_active;
    }

    function setName($name){
		$this->name = $name;
		return $this;
	}

	function setPassword($password) {
		$this->password = $password;
		return $this;
	}

	function setMobile($mobile) {
		$this->mobile = $mobile;
		return $this;
	}

	function setEmail($email) {
		$this->email = $email;
		return $this;
	}

	function setLoginBy($login_by) {
		$this->login_by = $login_by;
		return $this;
	}

    function setAddress($address) {
        $this->address = $address;
        return $this;
    }

    function setIsActive($is_active) {
		$this->is_active = $is_active; 
		return $this;
	}

    function getOrders() {
        
    }
}

?>