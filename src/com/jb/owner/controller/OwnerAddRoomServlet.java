package com.jb.owner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jb.pension.model.service.PensionService;

/**
 * Servlet implementation class OwnerAddRoomServlet
 */
@WebServlet("/owner/addRoom")
public class OwnerAddRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerAddRoomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//페이지 전환
		String imgSrc = request.getParameter("imgSrc");
		String pCode = request.getParameter("pCode");
		String pName = new PensionService().getPensionName(pCode);
		
		request.setAttribute("imgSrc", imgSrc);
		request.setAttribute("pCode", pCode);
		request.setAttribute("pName", pName);
		request.getRequestDispatcher("/views/owner/roomAdd.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
