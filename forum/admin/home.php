<h1>Welcome, <?php echo $_settings->userdata('firstname')." ".$_settings->userdata('lastname') ?>!</h1>
<hr>
<h2>Forum Statistics</h2>
<div class="row">
  <div class="col-12 col-sm-3 col-md-3">
      <div class="info-box">
        <span class="info-box-icon bg-gradient-navy elevation-1"><i class="fas fa-th-list"></i></span>
        <div class="info-box-content">
          <span class="info-box-text">Thể loại</span>
          <span class="info-box-number">
            <?php 
              $category = $conn->query("SELECT * FROM category_list where cate_delete_flag = 0 and `cate_status` = 1")->num_rows;
              echo format_num($category);
            ?>
            <?php ?>
          </span>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
    <!-- /.col -->
    <div class="col-12 col-sm-3 col-md-3">
      <div class="info-box">
        <span class="info-box-icon bg-gradient-light border elevation-1"><i class="fas fa-users-cog"></i></span>
        <div class="info-box-content">
          <span class="info-box-text">Registered Users</span>
          <span class="info-box-number">
            <?php 						
              $user = $conn->query("SELECT * FROM users where `user_type` = 4 ")->num_rows;
              echo format_num($user);
            ?>
            <?php ?>
          </span>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
    <!-- /.col -->
    <div class="col-12 col-sm-3 col-md-3">
      <div class="info-box">
        <span class="info-box-icon bg-gradient-primary elevation-1"><i class="fas fa-blog"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">Published Topic</span>
          <span class="info-box-number">
            <?php 
              $posts = $conn->query("SELECT * FROM topics where `to_status` = 1 and to_delete_flag = 0 ")->num_rows;
              echo format_num($posts);
            ?>
            <?php ?>
          </span>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
    <!-- /.col -->
    <div class="col-12 col-sm-3 col-md-3">
      <div class="info-box">
        <span class="info-box-icon bg-gradient-secondary elevation-1"><i class="fas fa-blog"></i></span>

        <div class="info-box-content">
          <span class="info-box-text">Unpublished Post</span>
          <span class="info-box-number">
            <?php 
              $posts = $conn->query("SELECT * FROM topics where `to_status` = 0 and to_delete_flag = 0 ")->num_rows;
              echo format_num($posts);
            ?>
            <?php ?>
          </span>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
  </div>
<hr>
<h2>Social Media Statistics</h2>
<div class="row">
      <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
        <div class="info-box">
          <span class="info-box-icon bg-gradient-secondary elevation-1"><i class="fas fa-users"></i></span>
          <div class="info-box-content">
            <span class="info-box-text">Total Members</span>
            <span class="info-box-number">
              <?php 
                $member = $conn->query("SELECT * FROM users where `user_type` = 3")->num_rows;
                echo format_num($member);
              ?>
              <?php ?>
            </span>
          </div>
          <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
      </div>
      <!-- /.col -->
      <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
      <div class="info-box">
        <span class="info-box-icon bg-gradient-primary elevation-1"><i class="fas fa-image"></i></span>
        <div class="info-box-content">
          <span class="info-box-text">Total Posts</span>
          <span class="info-box-number">
            <?php 
              $posts = $conn->query("SELECT * FROM topics")->num_rows;
              echo format_num($posts);
            ?>
            <?php ?>
          </span>
        </div>
        <!-- /.info-box-content -->
      </div>
      <!-- /.info-box -->
    </div>
    <!-- /.col -->
</div>
<hr>
<div class="container">
  <?php 
    $files = array();
      $fopen = scandir(base_app.'uploads/banner');
      foreach($fopen as $fname){
        if(in_array($fname,array('.','..')))
          continue;
        $files[]= validate_image('uploads/banner/'.$fname);
      }
  ?>
  <div id="tourCarousel"  class="carousel slide" data-ride="carousel" data-interval="3000">
      <div class="carousel-inner h-100">
          <?php foreach($files as $k => $img): ?>
          <div class="carousel-item  h-100 <?php echo $k == 0? 'active': '' ?>">
              <img class="d-block w-100  h-100" style="object-fit:contain" src="<?php echo $img ?>" alt="">
          </div>
          <?php endforeach; ?>
      </div>
      <a class="carousel-control-prev" href="#tourCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#tourCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
      </a>
  </div>
</div>
