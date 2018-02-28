<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/8
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/page.js"></script>
    <link href="${ctxStatic}/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        #tb_check_staff {
            width: 70%;
            margin: 20px auto;
        }

        #tb_check_staff tr th {
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
        #txt_num{
            height: 30px;
            width: 200px;
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
//            jQuery.page("div_check_staff", 2);
            $("#tb_check_staff tr:not('#tr_th'):odd").css("background-color", "#cccccc");
            $("#bt_search").click(function () {
                if ($("#txt_num").val() != "") {
                    $("table tr:has(td)").show();
                    $("table tr:has(td)").hide();
                    $("table tr:has(td)").each(function () {
                        var td = $(this).children();
                        if ( td.eq(1).text().indexOf($("#sel_rank").val())<0) {
                            $(this).hide();
                        }
                    });
                }
            })
        })
    </script>
</head>
<body>
<div id="div_search">按证件号查询&nbsp;&nbsp;<input id="txt_num" type="text">&nbsp;&nbsp;<input id="bt_search" type="button" value="查询"></div>
<div id="div_check_staff">
    <table id="tb_check_staff" class="table table-bordered">
        <thead>
        <tr id="tr_th">
            <th>员工姓名</th>
            <th>证件号</th>
            <th>性别</th>
            <th>婚姻状况</th>
            <th>民族</th>
            <th>籍贯</th>
            <th>家庭住址</th>
            <th>电话号码</th>
            <th>邮箱</th>
            <th>开始工作时间</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${employees.size()==0}">
            <td colspan="10">还没有员工，请<a href="../sysuser/manager_add_staff.jsp">添加</a> </td>
        </c:if>
        <c:if test="${employees.size()!=0}">
            <c:forEach items="${employees}" var="employee">
            <tr>
                <td>${employee.empName}</td>
                <td>${employee.idNum}</td>
                <td>${employee.empSex}</td>
                <td>${employee.marriage}</td>
                <td>${employee.nation}</td>
                <td>${employee.birthPlace}</td>
                <td>${employee.address}</td>
                <td>${employee.telephone}</td>
                <td>${employee.email}</td>
                <td><fmt:formatDate value="${teacher.birthDate}"/></td>
            </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
</div>
</body>
</html>

