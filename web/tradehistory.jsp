<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
  <head>
    <title>${sessionScope.user.username}的交易记录</title>
    <%@ include file="default/static/header.jsp"%>
    <%-- <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    
    <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->--%>

  </head>
  <body>  
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>交易记录</h1>
        </header>
        <div class="profile-photo-container">
          <img src="images/profile-photo.jpg" alt="Profile Photo" class="img-responsive">
          <div class="profile-photo-overlay"></div>
        </div>      
        <!-- Search box -->
        <form class="templatemo-search-form" role="search">
          <div class="input-group">
              <button type="submit" class="fa fa-search"></button>
              <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">           
          </div>
        </form>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
          </div>
        <nav class="templatemo-left-nav">          
          <ul>
            <%--
              <li><a href="main_index.jsp" class="active"><i class="fa fa-home fa-fw"></i>我的主页</a></li>
            <li><a href="car.jsp"><i class="fa fa-sliders fa-fw"></i>购物车</a></li>
            <li><a href="tradehistory.html"><i class="fa fa-map-marker fa-fw"></i>交易记录</a></li>
            <li><a href="goodServlet?action=list"><i class="fa fa-users fa-fw"></i>我的商品</a></li>
            <li><a href="person_setting.jsp"><i class="fa fa-sliders fa-fw"></i>设置</a></li>
            <li><a href="index.jsp"><i class="fa fa-eject fa-fw"></i>退出系统</a></li>
            --%>
            <li><a href="main_index.jsp"><i class="fa fa-home fa-fw"></i>我的主页</a></li>
            <li><a href="car.jsp"><i class="fa fa-sliders fa-fw"></i>购物车</a></li>
            <li><a href="tradehistory.jsp" class="active"><i class="fa fa-map-marker fa-fw"></i>交易记录</a></li>
            <li><a href="goodServlet?action=list"><i class="fa fa-users fa-fw"></i>我的商品</a></li>
            <li><a href="person_setting.jsp"><i class="fa fa-sliders fa-fw"></i>设置</a></li>
            <li> <a href="userServlet?action=logout"><i class="fa fa-eject fa-fw"></i>退出系统</a></li>          </ul>
        </nav>
      </div>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">

        <%@include file="default/static/shop_bar.jsp"%>
        <div class="templatemo-content-container">
          <div class="templatemo-content-widget no-padding">
            <div class="panel panel-default table-responsive">
              <table class="table table-striped table-bordered templatemo-user-table">
                <thead>
                  <tr>
                    <td><a href="" class="white-text templatemo-sort-by">商品id<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">商品名<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">价格<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">状态<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">交易时间<span class="caret"></span></a></td>
                    <td>数量</td>
                    <td>删除</td>
                    <td>交易</td>
                  </tr>
                </thead>
               <!-- <tbody>
                  <tr>
                    <td>1.</td>
                    <td>John</td>
                    <td>Smith</td>
                    <td>@jS</td>
                    <td>js@company.com</td>
                    <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                    <td><a href="" class="templatemo-link">Action</a></td>
                    <td><a href="" class="templatemo-link">Delete</a></td>
                  </tr>
                  <tr>
                    <td>2.</td>
                    <td>Bill</td>
                    <td>Jones</td>
                    <td>@bJ</td>
                    <td>bj@company.com</td>
                    <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                    <td><a href="" class="templatemo-link">Action</a></td>
                    <td><a href="" class="templatemo-link">Delete</a></td>
                  </tr>
                  <tr>
                    <td>3.</td>
                    <td>Mary</td>
                    <td>James</td>
                    <td>@mJ</td>
                    <td>mj@company.com</td>
                    <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                    <td><a href="" class="templatemo-link">Action</a></td>
                    <td><a href="" class="templatemo-link">Delete</a></td>
                  </tr>
                  <tr>
                    <td>4.</td>
                    <td>Steve</td>
                    <td>Bride</td>
                    <td>@sB</td>
                    <td>sb@company.com</td>
                    <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                    <td><a href="" class="templatemo-link">Action</a></td>
                    <td><a href="" class="templatemo-link">Delete</a></td>
                  </tr>
                  <tr>
                    <td>5.</td>
                    <td>Paul</td>
                    <td>Richard</td>
                    <td>@pR</td>
                    <td>pr@company.com</td>
                    <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                    <td><a href="" class="templatemo-link">Action</a></td>
                    <td><a href="" class="templatemo-link">Delete</a></td>
                  </tr>
                   <tr>
                    <td>6.</td>
                    <td>Will</td>
                    <td>Brad</td>
                    <td>@wb</td>
                    <td>wb@company.com</td>
                    <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                    <td><a href="" class="templatemo-link">Action</a></td>
                    <td><a href="" class="templatemo-link">Delete</a></td>
                  </tr>
                   <tr>
                    <td>7.</td>
                    <td>Steven</td>
                    <td>Eric</td>
                    <td>@sE</td>
                    <td>se@company.com</td>
                    <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                    <td><a href="" class="templatemo-link">Action</a></td>
                    <td><a href="" class="templatemo-link">Delete</a></td>
                  </tr>
                   <tr>
                    <td>8.</td>
                    <td>Landi</td>
                    <td>Susan</td>
                    <td>@lS</td>
                    <td>ls@company.com</td>
                    <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                    <td><a href="" class="templatemo-link">Action</a></td>
                    <td><a href="" class="templatemo-link">Delete</a></td>
                  </tr>
                </tbody>-->
              </table>    
            </div>                          
          </div>          
          <!--<div class="templatemo-flex-row flex-content-row">
            <div class="col-1">
              <div class="panel panel-default margin-10">
                <div class="panel-heading"><h2 class="text-uppercase">Login Form</h2></div>
                <div class="panel-body">
                  <form action="main_index.jsp" class="templatemo-login-form">
                    <div class="form-group">
                      <label for="inputEmail">Email address</label>
                      <input type="email" class="form-control" id="inputEmail" placeholder="Enter email">
                    </div>
                    <div class="form-group">                      
                      <label for="inputEmail">Password</label>
                      <input type="password" class="form-control" placeholder="Enter password">                                 
                    </div>              
                    <div class="form-group">
                        <div class="checkbox squaredTwo">
                            <label>
                              <input type="checkbox"> Remember me
                            </label>
                        </div>            
                    </div>
                    <div class="form-group">
                      <button type="submit" class="templatemo-blue-button">Submit</button>
                    </div>
                  </form>
                </div>                
              </div>              
            </div>
            <div class="col-1">              
              <div class="templatemo-content-widget pink-bg">
                <i class="fa fa-times"></i>                
                <h2 class="text-uppercase margin-bottom-10">Latest Data</h2>
                <p class="margin-bottom-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc mi sapien, fringilla at orci nec, viverra rhoncus leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus rhoncus erat non purus commodo, sit amet varius dolor sagittis.</p>                  
              </div>            
              <div class="templatemo-content-widget blue-bg">
                <i class="fa fa-times"></i>
                <h2 class="text-uppercase margin-bottom-10">Older Data</h2>
                <p class="margin-bottom-0">Phasellus dapibus nulla quis risus auctor, non placerat augue consectetur. Aliquam convallis pharetra odio, in convallis erat molestie sed. Fusce mi lacus, semper sit amet mattis eu, volutpat vitae enim.</p>                
              </div>            
            </div>                       
          </div> &lt;!&ndash; Second row ends &ndash;&gt;
          <div class="templatemo-flex-row flex-content-row">
            <div class="templatemo-content-widget white-bg col-2">
              <i class="fa fa-times"></i>
              <div class="media margin-bottom-30">
                <div class="media-left padding-right-25">
                  <a href="#">
                    <img class="media-object img-circle templatemo-img-bordered" src="images/person.jpg" alt="Sunset">
                  </a>
                </div>
                <div class="media-body">
                  <h2 class="media-heading text-uppercase blue-text">John Barnet</h2>
                  <p>Project Manager</p>
                </div>        
              </div>-->
           <!--   <div class="table-responsive">
                <table class="table">
                  <tbody>
                    <tr>
                      <td><div class="circle green-bg"></div></td>
                      <td>New Task Issued</td>
                      <td>02</td>                    
                    </tr> 
                    <tr>
                      <td><div class="circle pink-bg"></div></td>
                      <td>Task Pending</td>
                      <td>22</td>                    
                    </tr>  
                    <tr>
                      <td><div class="circle blue-bg"></div></td>
                      <td>Inbox</td>
                      <td>13</td>                    
                    </tr>  
                    <tr>
                      <td><div class="circle yellow-bg"></div></td>
                      <td>New Notification</td>
                      <td>18</td>                    
                    </tr>                                      
                  </tbody>
                </table>
              </div>             
            </div>-->
<!--            <div class="templatemo-content-widget white-bg col-1 text-center templatemo-position-relative">
              <i class="fa fa-times"></i>
              <img src="images/person.jpg" alt="Bicycle" class="img-circle img-thumbnail margin-bottom-30">
              <h2 class="text-uppercase blue-text margin-bottom-5">Paul Smith</h2>
              <h3 class="text-uppercase margin-bottom-70">Managing Director</h3>
              <div class="templatemo-social-icons-container">
                <div class="social-icon-wrap">
                  <i class="fa fa-facebook templatemo-social-icon"></i>  
                </div>
                <div class="social-icon-wrap">
                  <i class="fa fa-twitter templatemo-social-icon"></i>  
                </div>
                <div class="social-icon-wrap">
                  <i class="fa fa-google-plus templatemo-social-icon"></i>  
                </div>                
              </div>
            </div>-->
           <!-- <div class="templatemo-content-widget white-bg col-1 templatemo-position-relative templatemo-content-img-bg">
              <img src="images/sunset-big.jpg" alt="Sunset" class="img-responsive content-bg-img">
              <i class="fa fa-heart"></i><h1>=================================</h1>
              <h2 class="templatemo-position-relative white-text">Sunset</h2>
              <div class="view-img-btn-wrap">
                <a href="" class="btn btn-default templatemo-view-img-btn">View</a>  
              </div>              
            </div>-->
          </div>
<!--          页脚-->
          <div class="pagination-wrap">
            <ul class="pagination">
              <li><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li class="active"><a href="#">3<span class="sr-only">(current)</span></a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li>
                <a href="#" aria-label="Next">
                  <span aria-hidden="true"><i class="fa fa-play"></i></span>
                </a>
              </li>
            </ul>
          </div>
        <%@ include file="/default/static/footer.jsp"%>
        </div>
      </div>
    </div>
    
    <!-- JS -->
  <%--  <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->
    <script>
      $(document).ready(function(){
        // Content widget with background image
        var imageUrl = $('img.content-bg-img').attr('src');
        $('.templatemo-content-img-bg').css('background-image', 'url(' + imageUrl + ')');
        $('img.content-bg-img').hide();        
      });
    </script>--%>
  </body>
</html>