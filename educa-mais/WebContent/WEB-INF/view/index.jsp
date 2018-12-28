<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="utf-8">
  <title>Plato - Clean responsive bootstrap website template</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Clean responsive bootstrap website template">
  <meta name="author" content="">
  <!-- styles -->
  <link href="<%=request.getContextPath()%>/resources/assets/css/bootstrap.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/css/bootstrap-responsive.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/css/docs.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/css/prettyPhoto.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/css/flexslider.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/css/refineslide.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/css/font-awesome.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets/css/animate.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,700" rel="stylesheet">

  <link href="assets/css/style.css" rel="stylesheet">
  <link href="assets/color/default.css" rel="stylesheet">

  <!-- fav and touch icons -->
  <link rel="shortcut icon" href="assets/ico/favicon.ico">
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=request.getContextPath()%>/resources/assets/ico/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=request.getContextPath()%>/resources/assets/ico/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=request.getContextPath()%>/resources/assets/ico/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="<%=request.getContextPath()%>/resources/assets/ico/apple-touch-icon-57-precomposed.png">

  <!-- =======================================================
    Theme Name: Plato
    Theme URL: https://bootstrapmade.com/plato-responsive-bootstrap-website-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>

<body>
  <header>
    <!-- Navbar
    ================================================== -->
    <div class="cbp-af-header">
      <div class=" cbp-af-inner">
        <div class="container">
          <div class="row">

            <div class="span4">
              <!-- logo -->
              <div class="logo">
                <h1><a href="index.html">Plato</a></h1>
                <!-- <img src="assets/img/logo.png" alt="" /> -->
              </div>
              <!-- end logo -->
            </div>

            <div class="span8">
              <!-- top menu -->
              <div class="navbar">
                <div class="navbar-inner">
                  <nav>
                    <ul class="nav topnav">
                      <li class="dropdown active">
                        <a href="index.html">Home</a>
                      </li>
                      <li class="dropdown">
                        <a href="#">Features</a>
                        <ul class="dropdown-menu">
                          <li><a href="scaffolding.html">Scaffolding</a></li>
                          <li><a href="base-css.html">Base CSS</a></li>
                          <li><a href="components.html">Components</a></li>
                          <li><a href="icons.html">Icons</a></li>
                          <li><a href="list.html">Styled lists</a></li>
                          <li class="dropdown"><a href="#">3rd level</a>
                            <ul class="dropdown-menu sub-menu">
                              <li><a href="#">Example menu</a></li>
                              <li><a href="#">Example menu</a></li>
                              <li><a href="#">Example menu</a></li>
                            </ul>
                          </li>
                        </ul>
                      </li>
                      <li class="dropdown">
                        <a href="#">Pages</a>
                        <ul class="dropdown-menu">
                          <li><a href="about.html">About us</a></li>
                          <li><a href="pricingtable.html">Pricing table</a></li>
                          <li><a href="fullwidth.html">Fullwidth</a></li>
                          <li><a href="404.html">404</a></li>
                        </ul>
                      </li>
                      <li class="dropdown">
                        <a href="#">Portfolio</a>
                        <ul class="dropdown-menu">
                          <li><a href="portfolio-2cols.html">Portfolio 2 columns</a></li>
                          <li><a href="portfolio-3cols.html">Portfolio 3 columns</a></li>
                          <li><a href="portfolio-4cols.html">Portfolio 4 columns</a></li>
                          <li><a href="portfolio-detail.html">Portfolio detail</a></li>
                        </ul>
                      </li>
                      <li class="dropdown">
                        <a href="#">Blog</a>
                        <ul class="dropdown-menu">
                          <li><a href="blog_left_sidebar.html">Blog left sidebar</a></li>
                          <li><a href="blog_right_sidebar.html">Blog right sidebar</a></li>
                          <li><a href="post_left_sidebar.html">Post left sidebar</a></li>
                          <li><a href="post_right_sidebar.html">Post right sidebar</a></li>
                        </ul>
                      </li>
                      <li>
                        <a href="contact.html">Contact</a>
                      </li>
                    </ul>
                  </nav>
                </div>
              </div>
              <!-- end menu -->
            </div>

          </div>
        </div>
      </div>
    </div>
  </header>
  <section id="intro">

    <div class="container">
      <div class="row">
        <div class="span6">
          <h2><strong>Bootstrap <span class="highlight primary">business theme</span></strong></h2>
          <p class="lead">
            Lorem ipsum dolor sit amet, qui corpora oportere cu. Usu et iudico maluisset, pro ut lobortis vituperatoribus, percipit aliquando efficiendi est ex.
          </p>
          <ul class="list list-ok strong bigger">
            <li>100% Compatible with twitter bootstrap</li>
            <li>Valid HTML5 code and well structured</li>
            <li>Really updatable and easy to customize</li>
          </ul>

        </div>
        <div class="span6">

          <div class="group section-wrap upper" id="upper">
            <div class="section-2 group">
              <ul id="images" class="rs-slider">
                <li class="group">
                  <a href="#">
				            <img src="assets/img/slides/refine/slide1.png" alt="" />
				        </a>
                </li>
                <li class="group">
                  <a href="#" class="slide-parent">
				            <img src="assets/img/slides/refine/slide2.png" alt=""/>
				        </a>
                </li>
                <li class="group">
                  <img src="assets/img/slides/refine/slide3.png" alt="" />
                </li>
              </ul>
            </div>
            <!-- /.section-2 -->
          </div>

        </div>
      </div>
    </div>

  </section>
  <section id="maincontent">
    <div class="container">
      <div class="row">
        <div class="span4">
          <div class="features">
            <div class="icon">
              <i class="icon-bg-light icon-circled icon-code icon-5x active"></i>
            </div>
            <div class="features_content">
              <h3>Valid Coding</h3>
              <p class="left">
                Dolorem adipiscing definiebas ut nec. Dolore consectetuer eu vim, elit molestie ei has, petentium imperdiet in pri mel virtute nam.
              </p>
              <a href="#" class="btn btn-color btn-rounded"><i class="icon-angle-right"></i> Read more</a>
            </div>
          </div>
        </div>
        <div class="span4">
          <div class="features">
            <div class="icon">
              <i class="icon-bg-dark icon-circled icon-bug icon-5x"></i>
            </div>
            <div class="features_content">
              <h3>Bug free</h3>
              <p class="left">
                Dolorem adipiscing definiebas ut nec. Dolore consectetuer eu vim, elit molestie ei has, petentium imperdiet in pri mel virtute nam.
              </p>
              <a href="#" class="btn btn-color btn-rounded"><i class="icon-angle-right"></i> Read more</a>
            </div>
          </div>
        </div>
        <div class="span4">
          <div class="features">
            <div class="icon">
              <i class="icon-bg-dark icon-circled icon-android icon-5x"></i>
            </div>
            <div class="features_content">
              <h3>Mobile ready</h3>
              <p class="left">
                Dolorem adipiscing definiebas ut nec. Dolore consectetuer eu vim, elit molestie ei has, petentium imperdiet in pri mel virtute nam.
              </p>
              <a href="#" class="btn btn-color btn-rounded"><i class="icon-angle-right"></i> Read more</a>
            </div>
          </div>
        </div>

      </div>

      <!-- blank divider -->
      <div class="row">
        <div class="span12">
          <div class="blank10"></div>
        </div>
      </div>

      <div class="row">
        <div class="span12">
          <div class="cta-box">
            <div class="cta-text">
              <h2>Put special offer in standout call to action area here</h2>
            </div>
            <div class="cta">
              <a class="btn btn-large btn-rounded btn-color" href="#">
					<i class="icon-chevron-right"></i> Call action</a>
            </div>
          </div>
          <!-- end tagline -->
        </div>
      </div>

      <div class="row">
        <div class="span6">
          <h4>What people say about us</h4>
          <div class="testmonial_slider">
            <ul class="slides">
              <li>
                <div class="testimonial_item">
                  <p>
                    Lorem ipsum dolor sit amet nec, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes.
                  </p>
                  <span class="author">Johny doe</span>
                  <span class="occupation">Graphic and HTML Web Designer</span>
                  <!-- end testmonial -->
                </div>
              </li>
              <li>
                <div class="testimonial_item">
                  <p>
                    Aenean commodo ligula eget dolor. Aenean massa.
                  </p>
                  <span class="author">John Doe</span>
                  <span class="occupation">CEO Engineer</span>
                  <!-- end testmonial -->
                </div>
              </li>
              <li>
                <div class="testimonial_item">
                  <p>
                    libero quam euismod quam, sed sodales purus nisl eget felis. Pellentesque elit massa, cursus id.
                  </p>
                  <span class="author">Roro Still</span>
                  <span class="occupation">New In Field</span>
                  <!-- end testmonial -->
                </div>
              </li>
            </ul>
            <!-- end testmonial slider -->
          </div>
          <div class="blank"></div>

          <h4>Our satisfied clients</h4>
          <ul class="clients">
            <li>
              <a href="#">
									<img src="assets/img/dummies/clients/client1.png" class="client-logo" alt="" />
								</a>
            </li>
            <li>
              <a href="#">
									<img src="assets/img/dummies/clients/client2.png" class="client-logo" alt="" />
								</a>
            </li>
            <li>
              <a href="#">
									<img src="assets/img/dummies/clients/client3.png" class="client-logo" alt="" />
								</a>
            </li>

          </ul>

        </div>

        <div class="span6">
          <h4>Our services</h4>
          <!-- start: Accordion -->
          <div class="accordion" id="accordion2">
            <div class="accordion-group">
              <div class="accordion-heading">
                <a class="accordion-toggle active" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
								<i class="icon-caret-down"></i> Social media optimization </a>
              </div>
              <div id="collapseOne" class="accordion-body collapse in">
                <div class="accordion-inner">
                  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
                  on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table,
                  raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                </div>
              </div>
            </div>
            <div class="accordion-group">
              <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
								<i class="icon-caret-right"></i> Web design and development </a>
              </div>
              <div id="collapseTwo" class="accordion-body collapse">
                <div class="accordion-inner">
                  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
                  on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table,
                  raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                </div>
              </div>
            </div>
            <div class="accordion-group">
              <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
								<i class="icon-caret-right"></i> Business strategy and management </a>
              </div>
              <div id="collapseThree" class="accordion-body collapse">
                <div class="accordion-inner">
                  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird
                  on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table,
                  raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                </div>
              </div>
            </div>
          </div>
          <!--end: Accordion -->
        </div>
      </div>



    </div>
  </section>
  <!-- Footer
 ================================================== -->
  <footer class="footer">
    <div class="container">
      <div class="row">
        <div class="span3">
          <div class="widget">
            <!-- logo -->
            <div class="footerlogo">
              <h6><a href="index.html">Plato</a></h6>
              <!-- <img src="assets/img/logo.png" alt="" /> -->
            </div>
            <!-- end logo -->
            <address>
				<strong>Plato business company, Inc.</strong><br>
				 4455 Great building Ave, Suite A10<br>
				 San Francisco, CA 94107<br>
				<abbr title="Phone">P:</abbr> (123) 456-7890 </address>
          </div>
        </div>
        <div class="span3">
          <div class="widget">
            <h5>Browse pages</h5>
            <ul class="list list-ok">
              <li><a href="#">Lorem ipsum dolor sit amet</a></li>
              <li><a href="#">Tamquam ponderum at eum, nibh dicta offendit mei</a></li>
              <li><a href="#">Vix no vidisse dolores intellegam</a></li>
              <li><a href="#">Est virtute feugiat accommodare eu</a></li>
            </ul>
          </div>
        </div>
        <div class="span3">
          <div class="widget">
            <h5>Flickr photostream</h5>
            <div class="flickr_badge">
              <script type="text/javascript" src="http://www.flickr.com/badge_code_v2.gne?count=8&amp;display=random&amp;size=s&amp;layout=x&amp;source=user&amp;user=34178660@N03"></script>
            </div>
            <div class="clear"></div>
          </div>
        </div>
        <div class="span3">
          <div class="widget">
            <h5>Keep updated</h5>
            <p>
              Enter your email to subcribe newsletter
            </p>
            <form>
              <div class="input-append">
                <input class="span2" id="appendedInputButton" type="text">
                <button class="btn btn-color" type="submit">Subscribe</button>
              </div>
            </form>
            <ul class="social-network">
              <li><a href="#"><i class="icon-bg-light icon-facebook icon-circled icon-1x"></i></a></li>
              <li><a href="#" title="Twitter"><i class="icon-bg-light icon-twitter icon-circled icon-1x"></i></a></li>
              <li><a href="#" title="Linkedin"><i class="icon-bg-light icon-linkedin icon-circled icon-1x"></i></a></li>
              <li><a href="#" title="Pinterest"><i class="icon-bg-light icon-pinterest icon-circled icon-1x"></i></a></li>
              <li><a href="#" title="Google plus"><i class="icon-bg-light icon-google-plus icon-circled icon-1x"></i></a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="subfooter">
      <div class="container">
        <div class="row">
          <div class="span6">
            <p>
              &copy; Plato - All right reserved
            </p>
          </div>
          <div class="span6">
            <div class="pull-right">
              <div class="credits">
                <!--
                  All the links in the footer should remain intact.
                  You can delete the links only if you purchased the pro version.
                  Licensing information: https://bootstrapmade.com/license/
                  Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Plato
                -->
                Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>

  <script src="<%=request.getContextPath()%>/resources/assets/js/jquery.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/js/modernizr.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/js/jquery.easing.1.3.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/js/google-code-prettify/prettify.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/js/bootstrap.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/js/jquery.prettyPhoto.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/js/portfolio/jquery.quicksand.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/js/portfolio/setting.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/js/hover/jquery-hover-effect.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/js/jquery.flexslider.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/js/classie.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/js/cbpAnimatedHeader.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/js/jquery.refineslide.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/js/jquery.ui.totop.js"></script>

  <!-- Template Custom Javascript File -->
  <script src="<%=request.getContextPath()%>/resources/assets/js/custom.js"></script>

</body>

</html>