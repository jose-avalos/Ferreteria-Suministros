<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<c:if test="${sessionScope.cargo!=1}">
    <c:redirect url="index.jsp" />
</c:if>


<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css/principal.css">
        <link rel="stylesheet" href="css/jmenu.css">
        <link rel="stylesheet" href="jquery-ui.min.css">        
        <link rel="stylesheet" href="css/jquery.validity.css">
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/prefixfree.jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/login.js"></script>
        <script type="text/javascript" src="js/jMenu.jquery.js"></script>
        <script type="text/javascript" src="js/jMenu.jquery.min.js"></script>
        <script type="text/javascript" src="js/menu-interno.js"></script>
        <script type="text/javascript" src="js/jquery.validity.js"></script>
        <script type="text/javascript" src="js/jquery.validity.lang.es.js"></script>


        <!-- CSS PARA EL DISPLAYTAG -->
        <link rel="stylesheet" href="css/displaytag.css">
        
        
        <!-- Style sheet para formularios -->
        <link href="css/StyleSheet.css" rel="stylesheet" />  
        
        
        <!-- Menu Desplegable -->
        
        <link rel="stylesheet" href="css/jmenu.css" type="text/css" />
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        <script type="text/javascript" src="js/jMenu.jquery.js"></script>

        
    </head>
<style>
        #categoria{padding-left: 7.5Ex;}
        a:link   {   text-decoration:none;   }  
        #gear{margin-left: 20Ex;}
#words {
    margin-left: auto;
    margin-right: auto;
    width: 100%;
    margin-top:1Ex;
    font-style: oblique;
    font-size:2em;
    font-color:white;
    padding-left:20Ex;  }
        </style>
