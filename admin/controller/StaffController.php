<?php 
class StaffController {
    function list() {
        $staffRepository = new StaffRepository();
        $staffs = $staffRepository->getAll();
        require "view/staff/list.php";
    }

    function add() {
        $roleRepository = new RoleRepository();
        $roles = $roleRepository->getAll();
        require "view/staff/add.php";
    }

    function edit() {
        $staff_id = $_GET["staff_id"];
        $staffRepository = new StaffRepository();
        $staff = $staffRepository->find($staff_id);

        $roleRepository = new RoleRepository();
        $roles = $roleRepository->getAll();
        require "view/staff/edit.php";
    }

    function update() {
        $staff_id = $_POST["staff_id"];
        $staffRepository = new StaffRepository();
        $staff = $staffRepository->find($staff_id);

        $staff->setName($_POST["fullname"]);
        $staff->setUsername($_POST["username"]);
        if (!empty($_POST["password"])) {
			$staff->setPassword(password_hash($_POST["password"], PASSWORD_BCRYPT));
		}
        $staff->setMobile($_POST["phoneNumber"]);
        $staff->setEmail($_POST["email"]);
        $staff->setRoleId($_POST["role_id"]);
        $staff->setIsActive(0);
		if (!empty($_POST["is_active"])) {
			$staff->setIsActive(1);
		}

        if ($staffRepository->update($staff)) {
            $_SESSION["success"] = "Chỉnh sửa thông tin nhân viên thành công";
            header("location: index.php?c=staff");
			exit;
        }
    }

    function save() {
        $data = [];
        $data["name"] = $_POST["fullname"];
		$data["password"] = md5($_POST["password"]);
		$data["username"] = $_POST["username"];
		$data["mobile"] = $_POST["phoneNumber"];
		$data["email"] = $_POST["email"];
		$data["role_id"] = $_POST["role_id"];
        if (!empty($_POST["is_active"])) {
			$data["is_active"] = 1;
		} 
        else {
			$data["is_active"] = 0;
        }

        $staffRepository = new StaffRepository();
        if ($staffRepository->save($data)) {
            $_SESSION["success"] = "Thêm nhân viên mới thành công";
            header("location: index.php?c=staff");
			exit;
        }
    }

    function disable() {
		$staff_id = $_GET["staff_id"];
		if ($this->activeOrDisable($staff_id, 0)) {
            $_SESSION["success"] = "Vô hiệu hóa tài khoản nhân viên thành công";
			header("location: index.php?c=staff");
			exit;
		}
	}

    // Kiểm tra xem là quyền admin hay là quyền thông thường
	protected function activeOrDisable($staff_id, $is_active) {
		
		$staffRepository = new StaffRepository();
		$staff = $staffRepository->find($staff_id);
		if ($staff->getRoleId() == 1) {//quản trị viên
			return true;
		}
		$staff->setIsActive($is_active);
		return $staffRepository->update($staff);
	}
}
?>