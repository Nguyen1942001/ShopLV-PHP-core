<?php 
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class RegisterController {
    function create() {
        $data = [
            "name" => $_POST["name"],
            "mobile" => $_POST["mobile"],
            "email" => $_POST["email"],
            "password" => password_hash($_POST["password"], PASSWORD_BCRYPT),
            "login_by" => "form",
            "is_active" => 0,
            "address" => ""
        ];

        $customerRepository = new CustomerRepository();
        if ($customerRepository->save($data)) {
            $_SESSION["success"] = "Đã tạo tài khoản thành công";

            // Gửi email để kích hoạt tài khoản
            $email = $_POST["email"];
            $mailServer = new MailService();

            // JWT
            $key = JWT_KEY;
            $payload = array("email" => $email);
            $code = JWT::encode($payload, $key, 'HS256');

            $activeUrl = get_domain_site(). "/index.php?c=register&a=active&code=$code";
            $content = "
                Chào $email <br>
                Vui lòng click vào link bên dưới để kích hoạt tài khoản <br>
                <a href='$activeUrl'>Active Account</a>
            ";
            $mailServer->send($email, "Active account", $content);
        }
        else {
            $_SESSION["error"] = $customerRepository->getError();
        }
        header("location: index.php");
    }

    function active() {
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
            $customer->setIsActive(1);
            $customerRepository->update($customer);
            $_SESSION["success"] = "Tài khoản của bạn đã được active";

            // Sau khi kích hoạt email thành công thì đăng nhập luôn cho khách hàng
            $_SESSION["email"] = $email;
            $_SESSION["name"] = $customer->getName();
            header("location: /");

        }
        catch (Exception $e) {
            echo "You tried to hack!!";
        }
    }

    // Check email đã được đăng ký chưa ngay lúc người dùng điền email vào form đăng ký
    function notExistingEmail () {
        $email = $_GET["email"];
        $customerRepository = new CustomerRepository();
        $customer = $customerRepository->findEmail($email);
        if (!$customer) {
            echo "true";
            return;
        } else {
            echo "false";
            return;
        }
    }
}
?>