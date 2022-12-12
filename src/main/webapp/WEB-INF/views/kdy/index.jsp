<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <style>

            /* #ch:hover{
                box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            }  */
            #ch{
                height:200px;
                width: 200px;
                overflow: hidden; 
            }
            #ch img{
                    height:100%;
                    width: 100%;
                    object-fit:cover;   
                    transform:scale(1.0);        
                    transition: transform .5s; 
            }  
            #ch img:hover{            /* ë§ì°ì¤ í¸ë²ì */
            transform:scale(1.5);            /* ì´ë¯¸ì§ íë */
            transition: transform .5s; 	/*  ìê° ì¤ì   */
            }  
         </style>
    </head>
    <body>

        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <p class="lead fw-normal text-white-50 mb-0">ìì±íì¤ ìë¥ë¥¼ ì íí´ì£¼ì¸ì</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <!-- í´ê° ì ì²­ì -->
                    <div class="col mb-5">
                        <div class="card h-100" id="ch" onclick="location.href='/vacationApplication.html'">
                            <!-- Product image-->
                            <img class="card-img-top" style="width: 210px; height: 220px;" src="../img/KakaoTalk_20221208_194843493.jpg" alt="..." />
                            <!-- Product details--> 
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">í´ê° ì ì²­ì</h5>
                                    <!-- Product price-->   
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ë³´ê³ ì -->
                    <div class="col mb-5">
                        <div class="card h-100" id="ch" onclick="location.href='/workReport.html'">
                            <!-- Product image-->
                            <img class="card-img-top"  style="width: 223px; height: 240px;" src="../img/KakaoTalk_20221208_194900459.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4" >
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">ìë¬´ ë³´ê³ ì</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ì§ì¶ ê²°ìì -->
                    <div class="col mb-5">
                        <div class="card h-100" id="ch" onclick="location.href='/cashDisbursementVoucher.html'">
                            <!-- Product image-->
                            <img class="card-img-top" style="width: 223px; height: 240px;" src="../img/KakaoTalk_20221208_194918654.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">ì§ì¶ê²°ìì</h5>   
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ì¶ì²ì -->
                    <div class="col mb-5">
                        <div class="card h-100" id="ch"  onclick="location.href='/writtenApology.html'">
                            <!-- Product image-->
                            <img class="card-img-top" style="width: 223px; height: 240px;" src="../img/KakaoTalk_20221208_2046163ã´ã´ã´ã´44.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">ìë§ì</h5>
                                </div>
                            </div>   
                        </div>
                    </div>
                 
                </div>
            </div>

            
        </section>
     
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
