<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/8
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/page.js"></script>
    <link href="${ctxStatic}/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        #tb_check_place_needs {
            width: 70%;
            margin: 20px auto;
        }

        #tb_check_place_needs tr th {
            height: 50px;
            background-color: #6196bb
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
        }
        #div_place {
            margin-left: 10%;
            margin-top: 20px;
        }
        #place_label {
            font-family: "Fira Code Medium",serif;
            font-size: 30px;
            color: black
        }
    </style>
    <script type="text/javascript">
        $(function () {
            jQuery.page("div_check_place_needs", 10);
            $("#tb_check_place_needs tr:not('#tr_th'):odd").css("background-color", "#cccccc");
        })
    </script>
</head>
<body>
<div id="div_place"><span id="place_label">${jobcourses[0].get("JobName")}</span></div>
<div id="div_check_place_needs">
    <table id="tb_check_place_needs" class="table table-bordered">
        <thead>
        <tr id="tr_th">
            <th>课程名称</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${jobcourses.size()==0}">
            <td>该岗位还未制定岗位需求，<a href="../jobneeds/index">返回</a></td>
        </c:if>
        <c:forEach items="${jobcourses}" var="jobcourse">
            <tr>
                <td>${jobcourse.get("CourseName")}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>

