<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/4/20
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/page.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/bootstrap.min.js"></script>
    <link href="${ctxStatic}/css//bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        #tb_selection {
            width: 70%;
            margin: 20px auto 0;
        }
        #tb_selection tr th {
            height: 50px;
            background-color: #6196bb;
            font-family: 新宋体, serif;
            font-size: 15px;
            color: #ffffff;
        }
        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
        }
    </style>
    <script type="text/javascript">


        $(function () {
            jQuery.page("div_selection",10);
            $("#tb_selection tr:not('#tr_th'):odd").css("background-color", "#cccccc");
        })
    </script>
</head>

<body>
<div class="div_selection" id="div_selection">

    <table id="tb_selection" class="table table-bordered">
        <thead>
        <tr id="tr_th">
            <th>课程名称</th>
            <th>课程学时</th>
            <th>课程类别</th>
            <th>上课地点</th>
            <th>上课时间</th>
            <th>教师</th>
            <th>选课</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${jobneedsdetails.size()==0}">
            <td colspan="7">您已选完所有课或是管理员还未制定岗位需求，请联系管理员</td>
        </c:if>
        <c:if test="${jobneedsdetails.size()!=0}">
            <c:forEach items="${jobneedsdetails}" var="detail" varStatus="status">
                <tr>
                    <td>${detail.get("CourseName")}</td>
                    <td>${detail.get("Credit")}</td>
                    <td>${detail.get("CourseType")}</td>
                    <td>${detail.get("Location")}</td>
                    <td>${detail.get("Duration")}</td>
                    <td>${detail.get("TeaName")}</td>
                    <td><a href="../employee/addEmpNeeds?empid=${empid}&courseid=${detail.get("CourseId")}&jobid=${detail.get("JobId")}">选课</a></td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
    <br/>
</div>
</body>
</html>
