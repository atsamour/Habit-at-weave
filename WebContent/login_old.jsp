<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login Page</title>
	

    <script src="resources/js/jquery.js" ></script>
    <script src="resources/bootstrap/js/bootstrap.min.js"></script> 
	
	
	<!-- Bootstrap -->
    <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Optional theme -->
    <link rel="stylesheet" href="resources/bootstrap/css/bootstrap-theme.min.css">
    <!-- Custom CSS -->
    <link href="resources/css/sb-admin.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <!-- vvvvv this one not working..
    <link href="resources/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">-->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Plug Server</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">default Alert<span class="label label-default">Alert Badge</span></a>
                        </li>
                        
                        <li>
                            <a href="#">warning Alert <span class="label label-warning">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">danger Alert <span class="label label-danger">Alert Badge</span></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">View All</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${currentEmail} <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="logout"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            
            
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li>
                        <a href="index.html"><i class="fa fa-fw fa-desktop"></i> Home</a>
                    </li>
                    <li class="active">
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-adjust"></i> Plug Wise <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                    <a href="plugwise?tab=Charts"><i class="fa fa-fw fa-area-chart"></i> Plug Charts</a>
                            </li>
                            <li>
                                    <a href="plugcreate"><i class="fa fa-fw fa-plus-circle"></i> Create Plugs</a>
                            </li>
                            <li>
                                    <a href="plugrooms"><i class="fa fa-fw fa-building-o"></i> Arrange Plugs</a>
                            </li>
                            <li>
                                    <a href="plugschedule"><i class="fa fa-fw fa-calendar"></i> Schedule Plugs</a>
                            </li>
                            <li>
                                    <a href="plugsource"><i class="fa fa-fw fa-wrench"></i> Plugs Live</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="tables.html"><i class="fa fa-fw fa-table"></i> UP24</a>
                    </li>
                    <li>
                        <a href="forms.html"><i class="fa fa-fw fa-edit"></i> Options</a>
                    </li>
                    <li>
                        <a href="blank.html"><i class="fa fa-fw fa-file"></i> Page 1</a>
                    </li>
                    <li>
                        <a href="blank2.html"><i class="fa fa-fw fa-dashboard"></i> Page 2</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Assisted Living Control Center
                            <small>App name</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="home">Home</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-sign-in"></i> Login
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                
                <div class="row">
                    <div class="col-lg-6">
                        
                        <c:out value="${requestScope.message}"/>
                        <h1>Login</h1> 

                        <form role="form" method="post" action="login">

                            <div class="form-group">
                                <label>E-Mail</label>
                                <input class="form-control" name="email" placeholder="enter e-mail">
                            </div>

                            <div class="form-group">
                                <label>Password</label>
                                <input class="form-control" type="password" name="p" placeholder="enter your password">
                            </div>

                            <button type="submit" class="btn btn-default">Submit</button>
                        </form>

                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

</body>

</html>

