<%@ page import="services.UserService" %>
<%@ page import="tablePojos.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%
  UserService us = new UserService();
  try {

    User user = us.getByUserName(request.getParameter("user"));
    if(user != null){

    session.setAttribute("user", user.getUser());
    session.setAttribute("instructor", user.getInstructor());
    if (user.getPassword().equals(request.getParameter("password"))) {
      if (user.getInstructor() == 1) {
        response.sendRedirect("../instructor/userPageInstructor.jsp");
      } else {
        response.sendRedirect("../trainee/userPageTrainee.jsp");
      }
    } else {
      response.sendRedirect("../error.jsp");
    }
    }
    else {
      response.sendRedirect("../error.jsp");
    }
  } catch (Exception e){
    response.sendRedirect("../error.jsp");
  }
  us.close();
%>
