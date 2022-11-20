<?php require_once('initialize.php'); ?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>DS - Welcome to websites</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/DSicon.jpg" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Simple line icons-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="assets/css/mstyles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        
        <!-- Header-->
        <!--<header class="masthead d-flex align-items-center">
            <div class="container px-4 px-lg-5 text-center">
                <h1 class="mb-1">Xin chào, chào mừng bạn tới DS</h1>
                <h3 class="mb-5"><em>Bạn muốn truy cập vào trang nào trước?</em></h3>
                <a class="btn btn-primary btn-xl" href="https://startbootstrap.com/theme/stylish-portfolio/">Forum DS</a>
                <a class="btn btn-primary btn-xl" href="https://startbootstrap.com/theme/stylish-portfolio/">Social DS</a>
            </div>
        </header>-->
        <section class="content-section" id="portfolio">
            <div class="container px-4 px-lg-5">
                <div class="content-section-heading text-center">
                    <h2 class="text-secondary mb-0">Chào mừng tới DS</h2>
                        <hr>
                    <h3 class="mb-5">Bạn muốn truy cập trang nào trước?</h3>
                </div>
                <div class="row gx-0">
                    
                    <div class="col-lg-6">
                        <a class="portfolio-item" href="<?php echo fr_url ?>">
                            <div class="caption">
                                <div class="caption-content">
                                    <div class="h2">Forum</div>
                                    <p class="mb-0" >Diễn đàn công khai, đăng topic, câu hỏi, trả lời và trao đổi, chia sẻ thông tin</p>
                                </div>
                            </div>
                            <img class="img-fluid" src="assets/img/portfolio-3.jpg" alt="..." />
                        </a>
                    </div>
                    <div class="col-lg-6">
                        <a class="portfolio-item" href="<?php echo sc_url ?>">
                            <div class="caption">
                                <div class="caption-content">
                                    <div class="h2">Mạng xã hội</div>
                                    <p class="mb-0">Giao lưu với mọi người, bạn sẽ phải đăng nhập để xem được nội dung</p>
                                </div>
                            </div>
                            <img class="img-fluid" src="assets/img/portfolio-4.jpg" alt="..." />
                        </a>
                    </div>
                </div>
            </div>
        </section>        
    </body>
</html>
