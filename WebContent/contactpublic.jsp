<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="templates/public/inc/header2.jsp"%>
          <div class="container">
            <p>
              Home - Contact us
            </p>
          </div>
      </div>
      <div class="clearfix">
      </div>
      <div class="container_fullwidth">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <h5 class="title contact-title">
                Contact Us
              </h5>
              <div class="clearfix">
              </div>
              <div class="map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d122699.28794166949!2d108.1320391337205!3d16.04717467107227!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314219c792252a13%3A0xfc14e3a044436487!2zxJDDoCBO4bq1bmcsIEjhuqNpIENow6J1LCDEkMOgIE7hurVuZywgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1464769988569" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                </iframe>
              </div>
              <div class="clearfix">
              </div>
              <div class="row">
                <div class="col-md-4">
                  <div class="contact-infoormation">
                    <h5>
                      Contact Info
                    </h5>
                    <p>
                      CameraShop was buid by a person who have alot of experience in technology,CameraShop was buid by a person who have alot of experience in technology, CameraShop was buid by a person who have alot of experience in technology  
                    </p>
                    <ul>
                      <li>
                        <span class="icon">
                          <img src="<%=request.getContextPath()%>/templates/public/images/message.png" alt="">
                        </span>
                        <p>
                          ngocson.bkdn@gmail.com
                          <br>
                          support@gmail.com
                        </p>
                      </li>
                      <li>
                        <span class="icon">
                          <img src="<%=request.getContextPath()%>/templates/public/images/phone.png" alt="">
                        </span>
                        <p>
                          084. 93 668 2236
                          <br>
                          084. 93 668 6789
                        </p>
                      </li>
                      <li>
                        <span class="icon">
                          <img src="<%=request.getContextPath()%>/templates/public/images/address.png" alt="">
                        </span>
                        <p>
                          No.86 ChuaBoc St, DongDa Dt,
                          <br>
                          Hanoi, Vietnam
                        </p>
                      </li>
                    </ul>
                  </div>
                </div>
                <div class="col-md-8">
                  <div class="ContactForm">
                    <h5>
                      Contact Form
                    </h5>
                    <form action = "contact?contact=send" method = "post">
                      <div class="row">
                        <div class="col-md-6">
                          <label>
                            Your Name 
                            <strong class="red">
                              *
                            </strong>
                          </label>
                          <input class="inputfild" required = "required" type="text" name="name">
                        </div>
                        <div class="col-md-6">
                          <label>
                            Your Email
                            <strong class="red">
                              *
                            </strong>
                          </label>
                          <input class="inputfild" required = "required" type="email" name="email">
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <label>
                            Your Message 
                            <strong class="red">
                              *
                            </strong>
                          </label>
                          <textarea class="inputfild" required = "required" rows="8" name="message">
                          </textarea>
                        </div>
                      </div>
                      <button class="pull-right" type = "submit">
                        Send Message
                      </button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <%@include file="templates/public/inc/footer.jsp"%>