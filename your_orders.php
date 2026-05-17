<!DOCTYPE html>
<html lang="en">
<?php
include("connection/connect.php");
error_reporting(0);
session_start();

if(empty($_SESSION['user_id']))  
{
	header('location:login.php');
}
else
{
?>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="#">
    <title>My Orders</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animsition.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <!-- Add rating styles -->
    <style type="text/css" rel="stylesheet">
    .rating-stars {
        display: inline-block;
    }
    
    .rating-stars input[type="radio"] {
        display: none;
    }
    
    .rating-stars label {
        font-size: 20px;
        padding: 0 2px;
        cursor: pointer;
        color: #ddd;
    }
    
    .rating-stars label:hover,
    .rating-stars label:hover ~ label,
    .rating-stars input[type="radio"]:checked ~ label {
        color: #ffd700;
    }

    .rating-stars label i {
        display: inline-block;
    }

    .current-rating {
        margin-top: 5px;
        font-size: 14px;
        color: #666;
    }
    </style>
</head>

<body>
    <?php include("include/header.php"); ?>

    <div class="page-wrapper">
        <div class="inner-page-hero bg-image" data-image-src="images/img/pimg.jpg">
            <div class="container"> </div>
        </div>
        
        <section class="restaurants-page">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="bg-gray">
                            <div class="row">
                                <table class="table table-bordered table-hover">
                                    <thead style="background: #404040; color:white;">
                                        <tr>
                                            <th>Item</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                            <th>Status</th>
                                            <th>Date</th>
                                            <th>Action</th>
                                            <th>Rating</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php 
                                        $query_res = mysqli_query($db,"select * from users_orders where u_id='".$_SESSION['user_id']."'");
                                        if(!mysqli_num_rows($query_res) > 0 )
                                        {
                                            echo '<td colspan="7"><center>You have No orders Placed yet. </center></td>';
                                        }
                                        else
                                        {			      
                                            while($row = mysqli_fetch_array($query_res))
                                            {
                                                // Get rating if exists
                                                $rating_query = mysqli_query($db, "SELECT rating FROM ratings WHERE o_id='".$row['o_id']."' AND u_id='".$_SESSION['user_id']."'");
                                                $rating_row = mysqli_fetch_array($rating_query);
                                                $current_rating = $rating_row ? $rating_row['rating'] : 0;
                                        ?>
                                        <tr>
                                            <td data-column="Item"> <?php echo $row['title']; ?></td>
                                            <td data-column="Quantity"> <?php echo $row['quantity']; ?></td>
                                            <td data-column="price">Rs<?php echo $row['price']; ?></td>
                                            <td data-column="status">
                                                <?php 
                                                $status=$row['status'];
                                                if($status=="" or $status=="NULL")
                                                {
                                                ?>
                                                <button type="button" class="btn btn-info">
                                                    <span class="fa fa-bars" aria-hidden="true"></span> Dispatch
                                                </button>
                                                <?php 
                                                }
                                                if($status=="in process")
                                                { 
                                                ?>
                                                <button type="button" class="btn btn-warning">
                                                    <span class="fa fa-cog fa-spin" aria-hidden="true"></span> On The Way!
                                                </button>
                                                <?php
                                                }
                                                if($status=="closed")
                                                {
                                                ?>
                                                <button type="button" class="btn btn-success">
                                                    <span class="fa fa-check-circle" aria-hidden="true"></span> Delivered
                                                </button>
                                                <?php 
                                                } 
                                                if($status=="rejected")
                                                {
                                                ?>
                                                <button type="button" class="btn btn-danger"> 
                                                    <i class="fa fa-close"></i> Cancelled
                                                </button>
                                                <?php 
                                                } 
                                                ?>
                                            </td>
                                            <td data-column="Date"> <?php echo $row['date']; ?></td>
                                            <td data-column="Action"> 
                                                <a href="delete_orders.php?order_del=<?php echo $row['o_id'];?>" 
                                                   onclick="return confirm('Are you sure you want to cancel your order?');" 
                                                   class="btn btn-danger btn-flat btn-addon btn-xs m-b-10">
                                                    <i class="fa fa-trash-o" style="font-size:16px"></i>
                                                </a>
                                            </td>
                                            <td data-column="Rating">
                                                <?php if($status=="closed") { ?>
                                                <form action="submit_rating.php" method="post">
                                                    <input type="hidden" name="o_id" value="<?php echo $row['o_id']; ?>">
                                                    <div class="rating-stars">

                                                    <input type="radio" name="rating" value="5" id="star5_<?php echo $row['o_id']; ?>" <?php echo ($current_rating == 5) ? 'checked' : ''; ?>>
                                                    <label for="star5_<?php echo $row['o_id']; ?>"><i class="fa fa-star"></i></label>

                                                        <input type="radio" name="rating" value="4" id="star4_<?php echo $row['o_id']; ?>" <?php echo ($current_rating == 4) ? 'checked' : ''; ?>>
                                                        <label for="star4_<?php echo $row['o_id']; ?>"><i class="fa fa-star"></i></label>
                                                        
                                                        <input type="radio" name="rating" value="3" id="star3_<?php echo $row['o_id']; ?>" <?php echo ($current_rating == 3) ? 'checked' : ''; ?>>
                                                        <label for="star3_<?php echo $row['o_id']; ?>"><i class="fa fa-star"></i></label>
                                                        
                                                        <input type="radio" name="rating" value="2" id="star2_<?php echo $row['o_id']; ?>" <?php echo ($current_rating == 2) ? 'checked' : ''; ?>>
                                                        <label for="star2_<?php echo $row['o_id']; ?>"><i class="fa fa-star"></i></label>
                                                        
                                                        <input type="radio" name="rating" value="1" id="star1_<?php echo $row['o_id']; ?>" <?php echo ($current_rating == 1) ? 'checked' : ''; ?>>
                                                        <label for="star1_<?php echo $row['o_id']; ?>"><i class="fa fa-star"></i></label>
                                                    </div>
                                                    <button type="submit" class="btn btn-xs btn-info mt-2">Submit Rating</button>
                                                </form>
                                                <?php if($current_rating > 0) { ?>
                                                <div class="current-rating">
                                                    Current rating: <?php echo $current_rating; ?> star<?php echo $current_rating > 1 ? 's' : ''; ?>
                                                </div>
                                                <?php }
                                                } else { 
                                                    echo "Order not yet delivered"; 
                                                } ?>
                                            </td>
                                        </tr>
                                        <?php 
                                            }
                                        } 
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <?php include "include/footer.php" ?>
    </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/animsition.min.js"></script>
    <script src="js/bootstrap-slider.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/headroom.js"></script>
    <script src="js/foodpicky.min.js"></script>
</body>
</html>
<?php
}
?>