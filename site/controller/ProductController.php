<?php 
class ProductController {
    function index() {
        $productRepository = new ProductRepository();
        $categoryRepository = new CategoryRepository();
        $conds = [];
        $sorts = [];
        $categoryName = "Tất cả sản phẩm";

        // Lấy các sản phẩm theo các danh mục sản phẩm tương ứng (trang sản phẩm)
        $category_id = $_GET["category_id"] ?? null;
        if ($category_id) {
            $conds = [
                "category_id" => [
                    "type" => "=",
                    "val" => $category_id
                ]
            ];
            // Xuất hiện các tiêu đề sp tương ứng khi click vào danh mục sp tương ứng (2 dòng dưới)
            $category = $categoryRepository->find($category_id);
            $categoryName = $category->getName();
        }// SELECT * FROM ... WHERE category_id = $category_id


        // Sắp xếp giá sp
        $price_range = $_GET["price-range"] ?? null;
        if ($price_range) {
            $tmp = explode("-", $price_range);
            $start = $tmp[0];
            $end = $tmp[1];

            // Nếu đã chọn những sản phẩm cùng danh mục, thì phải sắp xếp khoảng giá trên các sp cùng danh mục đó
            if ($category_id) {
                $conds = [
                    "price" => [
                        "type" => "BETWEEN",
                        "val" => "$start AND $end"
                    ],
                    "category_id" => [
                        "type" => "=",
                        "val" => $category_id
                    ]
                ];

                if ($end == "greater") {
                    $conds = [
                        "price" => [
                            "type" => ">=",
                            "val" => $start
                        ], 
                        "category_id" => [
                            "type" => "=",
                            "val" => $category_id
                        ]
                    ];
                }
            }

            // Nếu danh mục sản phẩm không được chọn, thì sắp xếp khoảng giá trên tất cả sản phẩm
            else {
                $conds = [
                    "price" => [
                        "type" => "BETWEEN",
                        "val" => "$start AND $end"
                    ]
                ];
                if ($end == "greater") {
                    $conds = [
                        "price" => [
                            "type" => ">=",
                            "val" => $start
                        ]
                    ];
                }
            }
            
        }


        // Sort sản phẩm theo các tiêu chí
        $sort = $_GET["sort"] ?? null;
        if ($sort) {
            $tmp = explode("-", $sort);
            $first = $tmp[0];
            $second = $tmp[1];
            $mapCol = ["price" => "price", "alpha" => "name", "created" => "created_date"];

            $column = $mapCol[$first];
            $order = $second;
            $sorts = [$column => $order];
        }

        // Ô search sản phẩm
        $search = $_GET["search"] ?? null;
        if ($search) {
            $conds = [
                "NAME" => [
                    "type" => "LIKE",
                    "val" => "'%$search%'"
                ]
            ];
        }

        $products = $productRepository->getBy($conds, $sorts);

        // Lấy tất cả các danh mục
        $categoryRepository = new CategoryRepository();
        $categories = $categoryRepository->getAll();
        require "view/product/index.php";
    }

    function show() {
        $id = $_GET["id"];
        $productRepository = new ProductRepository();
        $product = $productRepository->find($id);
        $category_id = $product->getCategoryId() ;

        // Phần "bạn cũng có thể thích" trong trang chi tiết sp
        $conds = [
            // Lấy những sp có cùng danh mục với sp chính
            "category_id" => [
                "type" => "=",
                "val" => $category_id
            ],
            // Loại bỏ sản phẩm đang tìm kiếm khỏi phần sản phẩm liên quan
            "id" => [
                "type" => "!=",
                "val" => $id
            ]
        ];
        $relatedProducts = $productRepository->getBy($conds);

        require "view/product/show.php";
    }

    function storeComment() {
        $data = [
            "email" => $_POST["email"],
            "fullname" => $_POST["fullname"],
            "created_date" => date("Y-m-d H:i:s"),
            "description" => $_POST["description"],
            "product_id" => $_POST["product_id"]
        ];
        $commentRepository = new CommentRepository();
        $commentRepository->save($data);

        // Lấy lại danh sách comment bao gồm cả comment mới lưu vào database
        $productRepository = new ProductRepository();
        $product = $productRepository->find($_POST["product_id"]);
        $comments = $product->getComments();
        require "layout/comment.php";
    }
}
?>