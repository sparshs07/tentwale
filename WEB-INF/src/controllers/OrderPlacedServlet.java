package controllers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.annotation.WebServlet;

import java.io.*;

@WebServlet("/order_placed.do")
public class OrderPlacedServlet extends HttpServlet {
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        request.getRequestDispatcher("order_placed.jsp").forward(request, response);
    }
}
