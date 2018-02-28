<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/5/7
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<%
    int id = 0;
%>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxStatic}/jquery/page.js"></script>
    <link href="${ctxStatic}/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        #tb_del_place {
            width: 70%;
            margin: 20px auto 0;
        }
        #tb_all_del_place {
            width: 70%;
            margin: 0 auto 20px;
        }

        .table tr th {
            height: 50px;
            background-color: #6196bb
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
        }
        #bt_del{float: left;margin-left: 10px;background-color: #6196bb;color: #fff;font-size: 12px;height: 25px;width: 50px}
    </style>
    <script type="text/javascript">


        $(function () {
            $("#tb_del_place tr:not('#tr_th'):odd").css("background-color", "#cccccc");

            $("#chkall").click(function () {
                if (this.checked){
                    $("table tr td input[type=checkbox]").attr("checked",true);
                }else {
                    $("table tr td input[type=checkbox]").attr("checked",false);
                }
            });

            $("#bt_del").click(function () {
                var len = $("table tr td input[type=checkbox]:not('#chkall')").length;
                if (len!=0){
                    $("#form_del_place") .submit();
                }
            });
        })

    </script>
</head>
<body>
<form id="form_del_place" action="../job/deleteJobBat" method="post">
    <div id="div_del_place">
        <table id="tb_del_place" class="table table-bordered">
            <thead>
            <tr id="tr_th">
                <th width="100px">选项</th>
                <th>部门名称</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${jobs.size()==0}">
                <td colspan="2">该部门还没有岗位，<a href="../job/index">返回</a></td>
            </c:if>
            <c:if test="${jobs.size()!=0}">
                <c:forEach items="${jobs}" var="job">
                <tr>
                    <td><input type="checkbox" id="chk" name="jobid" value="${job.jobId}"/></td>
                    <td>
                        ${job.jobName}
                    </td>
                </tr>
                </c:forEach>
            </c:if>
            </tbody>

        </table>
    </div>
    <div>
        <table id="tb_all_del_place" class="table table-bordered" >
            <tr>
                <td colspan="2"><input type="checkbox" id="chkall" style="float: left;margin-left: 34px;" /><span style="float: left;margin-left: 10px;">全选</span>
                    <input type="button" value="删除" id="bt_del"/></td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>


