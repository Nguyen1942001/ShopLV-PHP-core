<?php 
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
class CustomerController {
    function forgotPassword() {
        $email = $_POST["email"];
        $customerRepository = new CustomerRepository();
        $customer = $customerRepository->findEmail($email);

        if (!$customer) {
            $_SESSION["error"] = "$email không tồn tại";
            header("location: index.php");
            exit;
        }

        $mailServer = new MailService();
        $key = JWT_KEY;
        $payload = array("email" => $email);
        $code = JWT::encode($payload, $key, 'HS256');

        $activeUrl = get_domain_site(). "/index.php?c=customer&a=resetPassword&code=$code";
        $content = "
            Chào $email <br>
            Vui lòng click vào link bên dưới để thiết lập lại password <br>
            <a href='$activeUrl'>Reset Password</a>
        ";
        $mailServer->send($email, "Reset Password", $content);
        $_SESSION["success"] = "Vui lòng check email để reset password";
        header("location: index.php");
    }

    function resetPassword() {
        $code = $_GET["code"];
        try {
            $decoded = JWT::decode($code, new Key(JWT_KEY, 'HS256'));
            $email = $decoded->email; 
            $customerRepository = new CustomerRepository();
            $customer = $customerRepository->findEmail($email);
            if (!$customer) {
                $_SESSION["error"] = "Email $email không tồn tại";
                header("location: /");
            }
            require "view/customer/resetPassword.php";
        }
        catch (Exception $e) {
            echo "You tried to hack!";
        }
    }

    function updatePassword() {
        $code = $_POST["code"];
        try {
            $decoded = JWT::decode($code, new Key(JWT_KEY, 'HS256'));
            $email = $decoded->email; 
            $customerRepository = new CustomerRepository();
            $customer = $customerRepository->findEmail($email);
            $newPassword = $_POST["password"];
            $hashNewPassword = password_hash($newPassword, PASSWORD_BCRYPT);
            $customer->setPassword($hashNewPassword);
            $customerRepository->update($customer);
            $_SESSION["success"] = "Reset mật khẩu thành công";
            header("location: index.php");
        }
        catch (Exception $e) {
            echo "You tried to hack!";
        }
    }


    // Thông tin tài khoản
    function info() {
        $email = $_SESSION["email"];
        $customerRepository = new CustomerRepository();
        $customer = $customerRepository->findEmail($email);
        require "view/customer/info.php";
    }


    // Cập nhật thông tin tài khoản
    function updateInfo() {
        $email = $_SESSION["email"];
        $customerRepository = new CustomerRepository();
        $customer = $customerRepository->findEmail($email);
        //$customer->setName(htmlspecialchars($_POST["name"], ENT_QUOTES, "UTF-8"));    
        $customer->setName($_POST["name"]);
        $customer->setMobile($_POST["mobile"]);

        $dbPassword = $customer->getPassword();
        $currentPassword = $_POST["current_password"];
        $newPassword = $_POST["new_password"];
        $confirmationPassword = $_POST["confirmation_password"];

        if ($currentPassword && $newPassword) {
            if ($newPassword == $confirmationPassword) {
                if (password_verify($currentPassword, $dbPassword)) {
                    $encodePassword = password_hash($newPassword, PASSWORD_BCRYPT);
                    $customer->setPassword($encodePassword);
                }
                else {
                    $_SESSION["error"] = "Mật khẩu hiện tại không đúng";
                    header("location: index.php?c=customer&a=info");
                    exit;
                }
            }
            else {
                $_SESSION["error"] = "Xác nhận mật khẩu mới không đúng";
                header("location: index.php?c=customer&a=info");
                exit;
            }
        }

        if ($customerRepository->update($customer)) {
            $_SESSION["name"] = $customer->getName();
            $_SESSION["success"] = "Đã cập nhật thông tin tài khoản thành công";
        }
        else {
            $_SESSION["error"] = $customerRepository->getError();
        }
        header ("location: index.php?c=customer&a=info");
    }


    // Địa chỉ giao hàng mặc định
    function shipping() {
        $customerRepository = new CustomerRepository();
        $customer = $customerRepository->findEmail($_SESSION["email"]);
        require "view/customer/shipping.php";
    }

    function updateShipping() {
        $customerRepository = new CustomerRepository();
        $customer = $customerRepository->findEmail($_SESSION["email"]);

        $name = $_POST["name"];
        $address = $_POST["address"];
        $mobile = $_POST["mobile"];

        $customer->setName($name);
        $customer->setAddress($address);
        $customer->setMobile($mobile);

        if ($customerRepository->update($customer)) {
            $_SESSION["name"] = $customer->getName();
            $_SESSION["success"] = "Đã cập nhật địa chỉ giao hàng thành công";
        }
        else {
            $_SESSION["error"] = $customerRepository->getError();
        }
        header ("location: index.php?c=customer&a=shipping");

    }
}
?>