<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/8
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/page.js"></script>
    <link href="${ctxStatic}/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        #tb_check_teacher {
            width: 70%;
            margin: 20px auto;
        }

        #tb_check_teacher tr th {
            height: 50px;
            background-color: #6196bb
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
        }
        #div_search{
            margin: 20px;
        }
        #sel_rank{
            height: 30px;
            width: 100px;
        }
        #bt_search{
            height: 25px;
            width: 50px;
            margin: 4px 15px;
            border-right: solid;
            text-align: center;
            background-color: #6196bb;
            color: #fff;
            font-size: 12px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
//            jQuery.page("div_check_teacher", 2);
            $("#tb_check_teacher tr:not('#tr_th'):odd").css("background-color", "#cccccc");
            $("#bt_search").click(function () {
                if ($("#sel_rank").val() != "null") {
                    $("table tr:has(td)").hide();
                    var flag=0;
                    $("table tr:has(td)").each(function () {
                        var td = $(this).children();
                        if ($("#sel_rank").val() != td.eq(3).text()) {
                            $(this).hide();
                        }
                    });
                }
            })
        })
    </script>
</head>
<body>
<div id="div_search">按职称查询&nbsp;&nbsp;<select id="sel_rank" title="职称">
    <option value="null" selected>请选择</option>
    <option value="professor" selected>教授</option>
    <option value="associateProfessor">副教授</option>
    <option value="assistant">助教</option>
    <option value="normalTeacher">讲师</option>
</select>&nbsp;&nbsp;<input type="button" id="bt_search" value="查询"></div>
<div id="div_check_teacher">
    <table id="tb_check_teacher" class="table table-bordered">
        <thead>
        <tr id="tr_th">
            <th>教师姓名</th>
            <th>性别</th>
            <th>出生日期</th>
            <th>职称</th>
            <th>简介</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${teachers.size()==0}">
            <td colspan="6">还没有教师，请<a href="../sysuser/manager_add_teacher.jsp"> 添加</a></td>
        </c:if>
        <c:forEach items="${teachers}" var="teacher">
            <tr>
                <td>${teacher.teaName}</td>
                <td>${teacher.teaSex}</td>
                <td>
                        <fmt:formatDate value="${teacher.birthDate}"/>
                </td>
                <td>${teacher.title}</td>
                <td>${teacher.intro}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>

