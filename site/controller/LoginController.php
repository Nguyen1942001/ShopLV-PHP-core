<?php 
class LoginController {
    function form() {
        $email = $_POST["email"];
        
        $password = $_POST["password"];

        $customerRepository = new CustomerRepository();
        $customer = $customerRepository->findEmail($email);

        if ($customer) {
            $encodePassword = $customer->getPassword();
            if (password_verify($password, $encodePassword)) {
                if ($customer->getIsActive() == 1) {
                    $_SESSION["success"] = "Đăng nhập thành công";
                    $_SESSION["email"] = $email;
                    $_SESSION["name"] = $customer->getName();
                }
                else {
                    $_SESSION["error"] = "Vui lòng nhấp vào link trong email để kích hoạt tài khoản";
                }

                header("location: index.php");
                exit;
            }
        }
        
        $_SESSION["error"] = "Vui lòng nhập lại email hoặc mật khẩu";
        header("location: index.php"); 
    }

    function logout() {
        session_destroy();
        header("location: index.php");
    }
}
?>