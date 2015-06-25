/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.atsamour.habitatweave.controller;

import com.atsamour.habitatweave.dao.ApplianceDAO;
import com.atsamour.habitatweave.models.Appliance;
import com.atsamour.habitatweave.util.AutoCompleteData;
import com.atsamour.habitatweave.util.HibernateUtil;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.shiro.SecurityUtils;
import org.hibernate.Session;

/**
 *
 * @author AlariC
 */
public class AutoCompleteResponce extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        Session hiberSession = HibernateUtil.getSessionFactory().openSession();
        hiberSession.beginTransaction();
        

//                final String param = request.getParameter("term");
//                final List<AutoCompleteData> result = new ArrayList<>();
//            Iterable<Appliance> appliances;
//                for (final Appliance appliance : appliances) {
//                    if (appliance.getDescription().toLowerCase().startsWith(param.toLowerCase())) {
//                        result.add(new AutoCompleteData( appliance.getDescription(), appliance.getVendorname() ));
//                    }
//                }
//                String jresp = new Gson().toJson(result);
//                response.setContentType("application/json");
//                response.getWriter().write(jresp);
       
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
//        response.setContentType("text/html");
//        response.setHeader("Cache-control", "no-cache, no-store");
//        response.setHeader("Pragma", "no-cache");
//        response.setHeader("Expires", "-1");

        ApplianceDAO applianceDAO = new ApplianceDAO(hiberSession);
        final List<Appliance> appliances;
        appliances = applianceDAO.getAppliancesByUserId(Integer.parseInt(getCurrentUserId()));

        final List<AutoCompleteData> result = new ArrayList<>();

        String term = request.getParameter("term");
        term = term.toLowerCase();
        for (final Appliance appliance : appliances) {
            if (appliance.getDescription().toLowerCase().startsWith(term.toLowerCase())) {
                //result.add(new AutoCompleteData( appliance.getDescription(), appliance.getVendorname() ));
                result.add( new AutoCompleteData( appliance.getDescription(), Integer.toString(appliance.getId()), appliance.getVendorname() ) );
            }
        }
        String jresp = new Gson().toJson(result);
        out.println(jresp);
        out.close();
    
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    public String getCurrentUserId() {
	org.apache.shiro.subject.Subject currentUser = SecurityUtils.getSubject();

	if (currentUser.isAuthenticated()) {
            String id = (String) currentUser.getSession().getAttribute("id");
		return id;
	} else {
		return null;
	}
    }

}
