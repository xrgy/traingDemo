<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/4/20
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/page.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/bootstrap.min.js"></script>
    <link href="${ctxStatic}/css//bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        #tb_check {
            width: 70%;
            margin: 20px auto 0;
        }

        #tb_check tr th {
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
            jQuery.page("div_check",10);
            $("#tb_check tr:not('#tr_th'):odd").css("background-color","#cccccc");
        })
    </script>
</head>
<body>
<div class="div_check">
    <table id="tb_check" class="table table-bordered">
        <thead>
        <tr id="tr_th">
            <th>课程名称</th>
            <th>课程学时</th>
            <th>课程类别</th>
            <th>上课地点</th>
            <th>上课时间</th>
            <th>教师</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${empNeedsdetails.size()==0}">
            <td colspan="6">您没有进行选课，<a href="../employee/selection?userId=${employee.empId}&deptid=${employee.deptId}">返回</a> </td>
        </c:if>
        <c:forEach items="${empNeedsdetails}" var="empNeedsdetail">
            <tr>
                <td>${empNeedsdetail.get("CourseName")}</td>
                <td>${empNeedsdetail.get("Credit")}</td>
                <td>${empNeedsdetail.get("CourseType")}</td>
                <td>${empNeedsdetail.get("Location")}</td>
                <td>${empNeedsdetail.get("Duration")}</td>
                <td>${empNeedsdetail.get("TeaName")}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
