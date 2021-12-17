<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Landing Page - Start Bootstrap Theme</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
        
        <!-- 알람입니당 -->
			<script type="text/javascript">
			window.onload=function alramList(){
				str = "";
				$.ajax({
					url:"alramList",  
					data:{id : '${id}'},
					dataType:'json',
					success:function(data){
						if(data.length >0){
							//alert("알람ON"+data);	
							$("#alramImg").attr("src","img/ds/alram-on.png");
							
							$(data).each(
									function(){
										if(this.ntc_ctg == '001'){
											str +="<li><a class='dropdown-item' href='#scrollspyHeading3'>["+this.anno_title+"]공고에 "+this.apply_id+"]님이 지원했습니다</a></li>"
												 +"<li><hr class='dropdown-divider'></li>";
										}else if(this.ntc_ctg =='002'){
											str += "<li><a class='dropdown-item' href='#scrollspyHeading3'>지원하신 ["+this.anno_title+"] 공고에 "+this.app_sts+"하셨습니다</a></li>"
												  +"<li><hr class='dropdown-divider'></li>";
										}else if(this.ntc_ctg =='003'){
											str += "<li><a class='dropdown-item' href=''#scrollspyHeading3'>["+this.com_name+"]님이 ["+this.read_res+"]를 조회했습니다</a></li>"
												  +"<li><hr class='dropdown-divider'></li>";	
										}
									}
							)	
						}else{
							//alert("알람OFF"+data);
							$("#alramImg").attr("src","img/ds/alram-off.png");
							str = "<li><hr class='dropdown-divider'></li>"
							+"<li><a class='dropdown-item' href='#scrollspyHeading3'>알림이 없어요~</a></li>"
							+"<li><hr class='dropdown-divider'></li>";
						}
						$('.dropdown-menu').append(str);
						
						
					}
				});
			}
			</script>
    </head>
    <body>
    	<%@ include file="/WEB-INF/views/header.jsp"%>
          
       <!-- Masthead-->
        <header class="masthead">
            <div class="container position-relative">
                <div class="row justify-content-center">
                    <div class="col-xl-6">
                        <div class="text-center text-white">
                            <!-- Page heading-->
                            <h1 class="mb-5">Coding&talent, Codingmonster</h1>
                            <!-- Signup form-->
                            <!-- * * * * * * * * * * * * * * *-->
                            <!-- * * SB Forms Contact Form * *-->
                            <!-- * * * * * * * * * * * * * * *-->
                            <!-- This form is pre-integrated with SB Forms.-->
                            <!-- To make this form functional, sign up at-->
                            <!-- https://startbootstrap.com/solution/contact-forms-->
                            <!-- to get an API token!-->
                            
                            <!-- 임시로 검색이랑 연결해 둠  -->
                            <form class="searchinput1233" id="contactForm"  action="search" method="post">
                            	 <div class="row">
                                		<div class="col">  
                                			<div class="input-group has-validation">                        
                                        		<input class="form-control form-control-lg" name="mainsearch" id="mainsearch" type="text" placeholder="검색어를 입력하세요" required="required" />
                                        		<div class="invalid-feedback">
												     검색어를 입력해주세요.
												</div>
                                        	</div> 
                                        </div>
                                        <div class="col-auto">               
                                    		<button class="btn btn-primary btn-lg" onsubmit="member_submit()" type="submit">검색</button>
                                    	</div>
                                  </div>  	
                            </form>
                            <script>
		                          //submit 눌렀을때 member_submit 함수 실행
		                            function member_submit(){
		                        	  alert('암튼 실행됨 이거');
		                              //값 비어있으면
		                              if($("#mainsearch").val() == ""){
		                                  // is-invalid 클래스를 붙여줘서 빨간 경고문구 붙여준다
		                                  $("#mainsearch").addClass("is-invalid");
		                                  // 입력해야되는 창에 어그로
		                                  $("#mainsearch").focus();
		                                  return;
		                              }
		                              
		                              //submit 처리
		                            }
                            
                            </script>
                            
                            
                            
                            <!-- 원본 수정 시 이용 예정  -->
                    			
<!--                     			 <form class="form-subscribe" id="contactForm" data-sb-form-api-token="API_TOKEN" action="searchannolist">
                                Email address input
                                <div class="row">
                                    <div class="col">
                                        <input class="form-control form-control-lg" name="mainsearch" id="emailAddress" type="email" placeholder="검색어를 입력하세요" data-sb-validations="required,email" />
                                       <div class="invalid-feedback text-white" data-sb-feedback="emailAddress:required">Email Address is required.</div>
                                        <div class="invalid-feedback text-white" data-sb-feedback="emailAddress:email">Email Address Email is not valid.</div>
                                    </div>
                                    <div class="col-auto">                                
                                    		<button class="btn btn-primary btn-lg disabled" id="submitButton" type="submit">검색</button>
                                    </div>
                                </div>
                                Submit success message
                               
                                This is what your users will see when the form
                                has successfully submitted
                                <div class="d-none" id="submitSuccessMessage">
                                    <div class="text-center mb-3">
                                        <div class="fw-bolder">Form submission successful!</div>
                                        <p>To activate this form, sign up at</p>
                                        <a class="text-white" href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                    </div>
                                </div>
                                Submit error message
                               
                                This is what your users will see when there is
                                an error submitting the form
                                <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                            </form>
                             -->                          
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Icons Grid-->
        <section class="features-icons bg-light text-center">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                            <div class="features-icons-icon d-flex"><i class="bi-person-badge-fill m-auto text-primary1234"></i></div>
                            <h3>구인구직</h3>
                            <p class="lead mb-0">기업과 프로그래머를<br>이어줘요.</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                            <div class="features-icons-icon d-flex"><i class="bi-chat-square-quote-fill m-auto text-primary1234"></i></div>
                            <h3>커뮤니티</h3>
                            <p class="lead mb-0">프로그래밍, <br>세상 모든 일을 이야기해요.</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="features-icons-item mx-auto mb-0 mb-lg-3">
                            <div class="features-icons-icon d-flex"><i class="bi-clipboard-check m-auto text-primary1234"></i></div>
                            <h3>관리기능</h3>
                            <p class="lead mb-0">간편한 UI<br> 편리하게 이용해요.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Image Showcases-->
        <section class="showcase">
            <div class="container-fluid p-0">
                <div class="row g-0">
                    <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('assets/img/bg-showcase-1.jpg')"></div>
                    <div class="col-lg-6 order-lg-1 my-auto showcase-text">
                        <h2>구인구직은 코딩몬에서 </h2>
                        <p class="lead mb-0"> 창의성 넘치는 인재들이 언제나 토론중인 코딩몬에서 IT인재를 찾아보세요! <br>이직, 구직을 원하는 프로그래머분들은 다양한 회사들을 여기에서 만날 수 있답니다.</p>
                    </div>
                </div>
                <div class="row g-0">
                    <div class="col-lg-6 text-white showcase-img" style="background-image: url('assets/img/bg-showcase-2.jpg')"></div>
                    <div class="col-lg-6 my-auto showcase-text">
                        <h2>커뮤니티가 활발한 사이트 코딩몬</h2>
                        <p class="lead mb-0"> 모르는 코드가 있나요? 혹시 생각만하고 구현에 어려움을 겪고 있나요? 여기에 수많은 고수들이 있답니다. 서로 묻고 답하면서 실력과 우정을 쌓아보아요! 코딩 이야기뿐 아니라 세상 사는 모든 이야기가 여기에!</p>
                    </div>
                </div>
                <div class="row g-0">
                    <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('assets/img/bg-showcase-3.jpg')"></div>
                    <div class="col-lg-6 order-lg-1 my-auto showcase-text">
                        <h2>Easy to Use & Fun to Use</h2>
                        <p class="lead mb-0">코딩몬에서는 이력서 작성, 지원등 모든 과정이 직관적으로 디자인되어 있어 이용하기가 쉽답니다.<br> 기업에게도 재능 넘치는 인재를 눈여겨두고 채용할 수 있는 많은 기능들이 있어요!</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Testimonials-->
        <section class="testimonials text-center bg-light">
            <div class="container">
                <h2 class="mb-5">What people are saying...</h2>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                            <img class="img-fluid rounded-circle mb-3" src="assets/img/testimonials-1.jpg" alt="..." />
                            <h5>김점례</h5>
                            <p class="font-weight-light mb-0">"코딩몬에 코드 눈팅하러 왔다가<br> 채용까지 되었지 모에용?<br> 코딩몬 정말 최고예요!"</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                            <img class="img-fluid rounded-circle mb-3" src="assets/img/testimonials-2.jpg" alt="..." />
                            <h5>강춘식</h5>
                            <p class="font-weight-light mb-0">"IT 스타트업체에서 <br>인사팀을 맡고 있어요<br> 저랑 게시판에서 싸우던 녀석들이<br>이제 제 후임이 되었네요ㅎ <br>일단 한 번 이용해보세요!"</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                            <img class="img-fluid rounded-circle mb-3" src="assets/img/testimonials-3.jpg" alt="..." />
                            <h5>윤복희</h5>
                            <p class="font-weight-light mb-0">"안녕하시죠? 관리자입니다 <br>편안하게 이용하시도록, <br>최선을 다하겠습니다 <br>감사합니다."</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Call to Action-->
        <section class="call-to-action text-white text-center" id="signup">
        
        
            <div class="container position-relative">
                <div class="row justify-content-center">
                    <div class="col-xl-6">
                        <h2 class="mb-4">Ready to get started? Let's go!</h2>
                        <!-- Signup form-->
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- * * SB Forms Contact Form * *-->
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- This form is pre-integrated with SB Forms.-->
                        <!-- To make this form functional, sign up at-->
                        <!-- https://startbootstrap.com/solution/contact-forms-->
                        <!-- to get an API token!-->
                        <form class="form-subscribe" id="contactFormFooter" data-sb-form-api-token="API_TOKEN">
                            <!-- Email address input-->
                            
                           <!-- 검색창  -->
                       <!--      <div class="row">
                                <div class="col">
                                    <input class="form-control form-control-lg" id="emailAddressBelow" type="email" placeholder="검색어를 입력하세요" data-sb-validations="required,email" />
                                    <div class="invalid-feedback text-white" data-sb-feedback="emailAddressBelow:required">Email Address is required.</div>
                                    <div class="invalid-feedback text-white" data-sb-feedback="emailAddressBelow:email">Email Address Email is not valid.</div>
                                </div>
                                <div class="col-auto"><button class="btn btn-primary btn-lg disabled" id="submitButton" type="submit">검색</button></div>
                            </div> -->
                            
                            <!-- Submit success message-->
                            <!---->
                            <!-- This is what your users will see when the form-->
                            <!-- has successfully submitted-->
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">Form submission successful!</div>
                                    <p>To activate this form, sign up at</p>
                                    <a class="text-white" href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                </div>
                            </div>
                            <!-- Submit error message-->
                            <!---->
                            <!-- This is what your users will see when there is-->
                            <!-- an error submitting the form-->
                            <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                        </form>
                    </div>
                </div>    
            </div>
            
        </section>
        
        <%@ include file="/WEB-INF/views/footer.jsp"%>
    </body>
</html>
