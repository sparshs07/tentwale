package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.InvoiceItem;
import models.TentwalaItem;

@WebServlet("/delete_tentwala_item.do")
public class DeleteTentwalaItemServlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        Integer tentwalaItemId=Integer.parseInt(request.getParameter("tentwala_item_id"));
       

        Boolean flag1=InvoiceItem.deleteItem(tentwalaItemId);
        Boolean flag=TentwalaItem.deleteItem(tentwalaItemId);
        
        if(flag)
            request.getRequestDispatcher("your_items.jsp").forward(request, response);
    }
}
