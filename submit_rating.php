<?php
include("connection/connect.php");
session_start();

if (isset($_POST['rating']) && isset($_POST['o_id']) && !empty($_SESSION['user_id'])) {
    $rating = mysqli_real_escape_string($db, $_POST['rating']);
    $o_id = mysqli_real_escape_string($db, $_POST['o_id']);
    $u_id = $_SESSION['user_id'];
    
    // Fetch order and dish details using proper JOIN
    $order_query = mysqli_query($db, "SELECT 
        uo.title, 
        uo.quantity, 
        uo.price, 
        d.d_id,
        d.img 
    FROM users_orders uo 
    INNER JOIN dishes d ON uo.title = d.title 
    WHERE uo.o_id='$o_id' AND uo.u_id='$u_id'");

    if ($order_query && mysqli_num_rows($order_query) > 0) {
        $order_details = mysqli_fetch_assoc($order_query);
        
        // Store all required fields
        $d_id = $order_details['d_id'];
        $food_name = $order_details['title'];
        $food_img = $order_details['img'];
        $quantity = $order_details['quantity'];
        $price = $order_details['price'];
        
        // Check order status for repeat_order flag
        $status_query = mysqli_query($db, "SELECT status FROM users_orders WHERE o_id='$o_id' AND u_id='$u_id'");
        $repeat_order = 0; // Default to false
        
        if ($status_query && $status_row = mysqli_fetch_assoc($status_query)) {
            $repeat_order = ($status_row['status'] == 'closed') ? 1 : 0;
        }

        // Validate rating (1-5)
        if ($rating >= 1 && $rating <= 5) {
            // Check if rating already exists
            $check_query = mysqli_query($db, "SELECT rating_id FROM ratings 
                WHERE o_id='$o_id' AND u_id='$u_id'");
            
            if ($check_query && mysqli_num_rows($check_query) > 0) {
                // Update existing rating
                $rating_row = mysqli_fetch_assoc($check_query);
                $update_query = mysqli_query($db, "UPDATE ratings SET 
                    rating = '$rating',
                    d_id = '$d_id',
                    food_name = '$food_name',
                    food_img = '$food_img',
                    quantity = '$quantity',
                    price = '$price',
                    repeat_order = '$repeat_order'
                    WHERE rating_id = '{$rating_row['rating_id']}'");
                
                if (!$update_query) {
                    error_log("Rating update failed: " . mysqli_error($db));
                }
            } else {
                // Insert new rating
                $insert_query = mysqli_query($db, "INSERT INTO ratings 
                    (o_id, u_id, d_id, food_name, food_img, quantity, price, rating) 
                    VALUES 
                    ('$o_id', '$u_id', '$d_id', '$food_name', '$food_img', '$quantity', 
                     '$price', '$rating')");
                
                if (!$insert_query) {
                    error_log("Rating insertion failed: " . mysqli_error($db));
                }
            }
        } else {
            error_log("Invalid rating value: $rating");
        }
    } else {
        error_log("Order not found or query failed: " . mysqli_error($db));
    }
}

// Redirect back to orders page
header('location:your_orders.php');
exit();
?>