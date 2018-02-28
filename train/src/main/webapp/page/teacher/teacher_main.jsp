<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/4/18
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<%
    String teaName = request.getParameter("teaName");
    //处理中文乱码问题
    try {
        teaName = new String(teaName.getBytes("ISO-8859-1"),"UTF-8");
    }
    catch (Exception e)
    {
        e.printStackTrace();
    }
%>
<html>
<head>
    <meta content="utf-8" />
    <title>企业员工管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <style type="text/CSS">
        * {margin: 0;padding: 0}
        .top {width: 100%;height: 10%;background-color: #467ca2;border: solid 0.1px #cccccc;}
        #welname {float: left;margin: auto 10px;padding: 18px;}
        #btlogout {float: right;margin-right: 20px;padding: 18px;color: #ac2925;}
        #date {float: right;padding: 18px;}
        .tabs {width: 100%;height: 100%;}
        a:link, a:visited {text-decoration: none;}
        .tab_con {position: absolute;width: 200px;border-bottom: solid 1px #316a91;margin: 0 auto 0 auto;}
        .tab_con ul li {background-color: #467ca2;border: solid 1px #316a91;border-bottom: 0;}
        .tab_con ul li a {padding-left: 10px;color: #fff;font-size: 14px;font-family: 新宋体, serif;display: block;height: 40px;line-height: 36px;}
        .tab_con ul li ul li {border-left: 0;border-right: 0;background-color: #6196bb;border-color: #467ca2;}
        .tab_con ul li ul li a {padding-left: 20px;}
        ul, li {list-style: none}
        .right_con {height: 100%;margin: auto auto auto 200px;border: 5px outset #467ca2;}
        #if_con {height: 100%;width: 100%;right: 10px;}
    </style>
    <script type="text/javascript">
        function changeFrameHeight(){
            var ifm= document.getElementById("if_con");
            var h=document.body.clientHeight-document.getElementById("top").offsetHeight;
            ifm.height = h-100;
            var ifw = document.getElementById("if_con");
            ifw.width= document.body.clientWidth;
        }
        window.onresize=function(){
            changeFrameHeight();
        }

        function time()
        {
            var now= new Date();
            var year=now.getFullYear();
            var month=now.getMonth();
            var date=now.getDate();
            var week=now.getDay();
            var ww=""
            switch (week)
            {
                case 0:ww="星期日";break;
                case 1:ww="星期一";break;
                case 2:ww="星期二";break;
                case 3:ww="星期三";break;
                case 4:ww="星期四";break;
                case 5:ww="星期五";break;
                case 6:ww="星期六";break;
                default:break;
            }
            document.getElementById("spandate").innerHTML=year+"年"+(month+1)+"月"+date+"日"+"    "+ww;
        }

        $(function (){
            $("li").eq(0).click();
            $("li").eq(0).children()[0].click();
        })
    </script>
</head>

<body  onload="time()">
<div class="tabs" >
    <div class="top" id="top">
        <div id="welname" ><span id ="spanwelname">欢迎您，<%=teaName%></span><span>老师</span></div>
        <a id="btlogout" href="login.jsp" onclick="javascript:location.replace(this.href); event.returnValue=false; ">退出登录</a>
        <div id="date"><span id="spandate"></span></div>
    </div>
    <div class="tab_con">
        <ul class="left_tabs">
            <li class="tab-nav"><a href="../teacher/info?teaId=${param.teaId}" target="if_con">查看个人信息</a></li>
            <li class="tab-nav"><a href="../teacher/course?teaId=${param.teaId}" target="if_con">查看课程</a></li>
            <li class="tab-nav"><a href="../teacher/setscoreindex?teaId=${param.teaId}" target="if_con">提交成绩</a></li>
        </ul>
    </div>
    <div class="right_con">
            <iframe id="if_con" name="if_con" frameborder="0"  noresize="noresize" marginwidth="5dp" marginheight="5dp" scrolling="no" onload="changeFrameHeight()" ></iframe>
    </div>
</div>
</body>

</html>